/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import modelo.Publicacion;
import modelo.usuario;
import modeloDAO.publicacionDAO;
import modeloDAO.usuarioDAO;

/**
 *
 * @author WilliamMiguel
 */
@WebServlet(name = "ControlaUsuario", urlPatterns = {"/ControlaUsuario"})
public class ControlaUsuario extends HttpServlet {

    String listar = "Vista/PerfilUsuario_1.jsp";
    String index = "index.jsp";
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
        
            usuarioDAO dao = new usuarioDAO();
            Publicacion pu=new Publicacion();
            publicacionDAO pudao=new publicacionDAO(); 
            List<usuario> lista = dao.listar();
            String acceso = "";
            acceso = listar;
            HttpSession sesion = request.getSession();
            user = sesion.getAttribute("user").toString();
            
            List<Publicacion> listap=pudao.listar(dao.buscarusuario(user).getId_us()); 

            //lista de comprobación de a que publicaciones dio likes el usuario
            List<Publicacion> listaplu=pudao.listarLikesUsuario(dao.buscarusuario(user).getId_us()); 
            request.setAttribute("listaplu",listaplu);
            
            //lista de comprobación de a que publicaciones dio regalos el usuario
            List<Publicacion> listapru=pudao.listarRegalosUsuario(dao.buscarusuario(user).getId_us()); 
            request.setAttribute("listapru",listapru);
            
            List<usuario> listadofollower1 = dao.listar(dao.buscarusuario(user).getId_us());                             
            request.setAttribute("listadofollower", listadofollower1);
                
            List<usuario> listadofollower = dao.listadofollower();
              
            request.setAttribute("lista", lista);
            request.setAttribute("listap",listap);
            
            List<usuario> listadousuario = dao.listarUsuario(dao.buscarusuario(user).getId_us());                             
            request.setAttribute("listadousuario", listadousuario);
            
            
            
            request.getRequestDispatcher(acceso).forward(request, response);
        
        
        
        
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println(listap);         
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
