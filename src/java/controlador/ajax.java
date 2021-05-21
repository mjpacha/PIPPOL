/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import javax.servlet.ServletException;
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
public class ajax extends HttpServlet {
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
                
        List<likes> lista = ldao.ComprobarUsuario(iduser, idpub);        
        
            if (lista.size() == 0 && tipolike.equals("corazones")) {
                l.setIdPub(idpub);
                l.setIdUser(iduser);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalLikes(idpub);
                pu.setTotalLikes(lista1.get(0).getTotalLikes()); 
                
                pudao.editarTotalPublicaciones(pu);
                ldao.agregar(l);
            } else if (lista.size() != 0 && tipolike.equals("corazones")){
                ldao.eliminarLike(iduser, idpub);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalLikes(idpub);
                pu.setTotalLikes(lista1.get(0).getTotalLikes()); 
                
                pudao.editarTotalPublicacionesQuitarLike(pu);
            }
            
        List<regalos> listar = rdao.ComprobarUsuarioRegalo(iduser, idpub);
        
            if (listar.size() == 0 && tipolike.equals("regalos")) {
                r.setIdPub(idpub);
                r.setIdUser(iduser);                
                
                List<Publicacion> lista1 = pudao.PublicacionTotalRegalos(idpub);
                pu.setTotalRegalos(lista1.get(0).getTotalRegalos()); 
                
                pudao.editarTotalPublicacionesAgregarRegalo(pu);
                rdao.agregar(r);
            } else if (listar.size() != 0 && tipolike.equals("regalos")){
                rdao.eliminarRegalo(iduser, idpub);
                
                List<Publicacion> lista1 = pudao.PublicacionTotalRegalos(idpub);
                pu.setTotalRegalos(lista1.get(0).getTotalRegalos()); 
                
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
