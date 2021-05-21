/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Publicacion;
import modelo.likes;
import modelo.regalos;
import modeloDAO.likesDAO;
import modeloDAO.publicacionDAO;
import modeloDAO.regalosDAO;
import java.util.List;
/**
 *
 * @author WilliamMiguel
 */
@WebServlet(name = "ControlaLikesRegalos", urlPatterns = {"/ControlaLikesRegalos"})
public class ControlaLikesRegalos extends HttpServlet {
String user="";
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        likes l=new likes();
        regalos r = new regalos();  
        Publicacion pu=new Publicacion();
        
        publicacionDAO pudao=new publicacionDAO(); 
        likesDAO ldao=new likesDAO();
        regalosDAO rdao=new regalosDAO();        
        
        int idpub=Integer.parseInt(request.getParameter("id"));
        int iduser=Integer.parseInt(request.getParameter("iduser"));
        String tipolike=request.getParameter("tipo");
             
        pu.setIdpub(idpub);
        pu.setIduser(iduser);
        // Valida si el usuario ha dado likes        
        List<likes> lista = ldao.ComprobarUsuario(iduser, idpub);        
        /* Si la lista está vacía y es de tipo corazones va a aumentar el contador de likes del contador de esa 
          publicacion y va a crear en la tabla regalos el registro de la persona que le envio el corazon */
            if (lista.size() == 0 && tipolike.equals("corazones")) {
                l.setIdPub(idpub);
                l.setIdUser(iduser);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalLikes(idpub);
                pu.setTotalLikes(lista1.get(0).getTotalLikes()); 
                // actualiza el total de likes
                pudao.editarTotalPublicaciones(pu);
                // agrega el like a la tabla regalos
                ldao.agregar(l);
                
          /* Si la lista no está vacía y es de tipo corazones va a disminuir el contador de likes del contador de esa 
          publicacion y va a eliminar en la tabla regalos el registro de la persona que le envio el corazon */
            } else if (lista.size() != 0 && tipolike.equals("corazones")){
                // elimina el like a la tabla regalos
                ldao.eliminarLike(iduser, idpub);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalLikes(idpub);
                pu.setTotalLikes(lista1.get(0).getTotalLikes()); 
                // actualiza el total de likes
                pudao.editarTotalPublicacionesQuitarLike(pu);
            }
        // Valida si el usuario ha dado regalos  
        List<regalos> listar = rdao.ComprobarUsuarioRegalo(iduser, idpub);
            /* Si la lista está vacía y es de tipo regalo va a aumentar el contador de regalos del contador de esa 
               publicacion y va a crear en la tabla regalos el registro de la persona que le envio el regalo  */
            if (listar.size() == 0 && tipolike.equals("regalos")) {
                r.setIdPub(idpub);
                r.setIdUser(iduser);                
                
                List<Publicacion> lista1 = pudao.PublicacionTotalRegalos(idpub);
                pu.setTotalRegalos(lista1.get(0).getTotalRegalos()); 
               
                // actualiza el total de regalos
                pudao.editarTotalPublicacionesAgregarRegalo(pu);
                // agrega el regalo a la tabla regalos
                rdao.agregar(r);
                
            /* Si la lista no está vacía y es de tipo regalo va a disminuir el contador de regalos del contador de esa 
               publicacion y va a borrar en la tabla regalos el registro de la persona que le envio el regalo   */
            } else if (listar.size() != 0 && tipolike.equals("regalos")){
                // elimina el regalo de la tabla regalos
                rdao.eliminarRegalo(iduser, idpub);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalRegalos(idpub);
                pu.setTotalRegalos(lista1.get(0).getTotalRegalos()); 
                
                // actualiza el total de regalos
                pudao.editarTotalPublicacionesQuitarRegalo(pu);  
            }                                    
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
