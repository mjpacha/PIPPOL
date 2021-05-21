/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.pusher.rest.Pusher;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Base64;
import java.util.Collections;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelo.Mensaje;
import modeloDAO.MensajeDAO;

/**
 *
 * @author mjpac
 */
@WebServlet(name = "NuevoMensajeControl", urlPatterns = {"/NuevoMensajeControl"})
public class NuevoMensajeControl extends HttpServlet {

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
        response.setContentType("text/html; charset=UTF-8");
        MensajeDAO m = new MensajeDAO();
        String name = request.getParameter("name");
        String message = request.getParameter("message");
        String message1 = request.getParameter("message");
        DateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
        
        Date date = new Date();
        int id_user;
        id_user = Integer.parseInt(name);
        Mensaje mensaje = new Mensaje(id_user, message, message1, dateFormat.format(date));
        System.out.print("emojiiiiiiiiiiiiiiiiiiiiiiii"+mensaje.getEmi_mess());
        m.create(mensaje);
        
        DateFormat dateFormat2 = new SimpleDateFormat("HH:mm:ss");

        mensaje.setTime_mess(dateFormat2.format(date));

        Pusher pusher = new Pusher("1188258", "814af04f4e0ebcbfa6e4", "859c005916df08aa32eb");
        pusher.setCluster("us2");
        pusher.setEncrypted(true);

        pusher.trigger("chat", "new-message", mensaje.getJsonObject());

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
