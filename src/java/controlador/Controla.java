/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import modeloDAO.EmailDAO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.nio.file.StandardCopyOption.*;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import modelo.Publicacion;
import modelo.usuario;
import modeloDAO.publicacionDAO;
import modeloDAO.usuarioDAO;
import javax.servlet.http.HttpSession;
import modelo.preguntas;

@WebServlet(name = "Controla", urlPatterns = {"/Controla"})
/**
 *
 * @author Mauricio
 */
@MultipartConfig
public class Controla extends HttpServlet {

    String listar = "Vista/PerfilUsuario_1.jsp";
    String registro = "Vista/Registro.jsp";
    String agregar = "Vista/PreguntasSeguridad.jsp";
    String index = "index.jsp";
    String editar = "";
    String ganancia = "Vista/RepoteGanancia.jsp";
    usuario us = new usuario();

    String user = "";

//    SANTIAGO ZAGAL NUEVA PAGINA
    String validar = "Vista/verificaCN.jsp";
    String pregun = "Vista/verificaPR.jsp";
    String ing = "Vista/VCN.jsp";  
//    -----

//    SANTIAGO ZAGAL VERIFICAR Y PREGUNTAS
    boolean verificar, verificar1;
    preguntas pre = new preguntas();
//    ---

    String correoV = "Vista/Registro.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
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
        String acceso = "";
        String accion = request.getParameter("accion");
        if (accion.equalsIgnoreCase("Registrar")) {
            acceso = registro;
        } else if (accion.equalsIgnoreCase("Iniciar")) {
            usuarioDAO dao = new usuarioDAO();
            Publicacion pu = new Publicacion();
            publicacionDAO pudao = new publicacionDAO();
            List<usuario> lista = dao.listar();

//            System.out.println("Lista tamaño " + lista.size());

            user = request.getParameter("respuesta1");
            //String contrasena = request.getParameter("contrasena");

//            SANTIAGO ZAGAL ENCRIPTACION
            String contrasena1 = request.getParameter("contrasena");
            String contrasena = Base64.getEncoder().encodeToString(contrasena1.getBytes("utf-8"));
//            -----

//            SANTIAGO ZAGAL VERIFICA CORREO ACTIVADO PARA INGRESAR
            if (lista.size()==0) {
                acceso = ing;
            } else {
                if (lista.isEmpty()) {
                    request.setAttribute("fail", "DATOS ERRONEOS");
                } else {
                    for (int i = 0; i < lista.size(); i++) {
                        System.err.println("repite");
                        if ((lista.get(i).getNick().equals(user) || lista.get(i).getMail().equals(user)) && lista.get(i).getPassword().equals(contrasena)) {
                            request.setAttribute("usuario", lista.get(i));
                            //agregar sesión
                            HttpSession sesion = request.getSession();
                            sesion.setAttribute("user", user);

                            acceso = listar;
                            break;
                        } else {
                            acceso = index;
                        }
                    }
                    //listado de publicaciones que puede ver el usuario
                    List<Publicacion> listap = pudao.listar(dao.buscarusuario(user).getId_us());
                    //listado de publicaciones que hace el usuario
                    List<Publicacion> listaPP = pudao.listarPublicacionesPropias(dao.buscarusuario(user).getId_us());
                    //listado de publicaciones de personas a las que sigue el usuario
                    List<usuario> listadofollower1 = dao.listar(dao.buscarusuario(user).getId_us());
                    request.setAttribute("listadofollower", listadofollower1);

                    request.setAttribute("lista", lista);
                    request.setAttribute("listap", listap);
                    request.setAttribute("listaPP", listaPP);

                }
            }
//            ------

            if (acceso.equals(index)) {
                request.setAttribute("fail", "DATOS ERRONEOS");
            }
        } else if (accion.equalsIgnoreCase("Crear Perfil")) {
            usuarioDAO dao = new usuarioDAO();
            Publicacion pu = new Publicacion();
            publicacionDAO pudao = new publicacionDAO();
            List<usuario> lista = dao.listar();

            //            SANTIAGO ZAGAL ENCRIPTACION
            String passwordr = request.getParameter("contrasena");
            String password = Base64.getEncoder().encodeToString(passwordr.getBytes("utf-8"));
//            ------------

//            SANTIAGO ZAGAL PREGUNTAS
            String p, p2, p3;
            p = request.getParameter("respuesta1");
            p2 = request.getParameter("respuesta2");
            p3 = request.getParameter("respuesta3");
            pre.setPregun1(p);
            pre.setPregun2(p2);
            pre.setPregun3(p3);
//            -------------
            us.setPassword(password);

//            SANTIAGO ZAGAL CORREGIR Foto por foto
            Part file = request.getPart("foto");
//            ----
            String imageFileName = file.getSubmittedFileName();
            String uploadPath = "C:/PIIPOL/web/imagen/" + imageFileName;
            System.out.println("lugar a guardar : " + uploadPath);
            try {
                us.setFoto(uploadPath);
                us.setNomFoto(imageFileName);
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
//            -----------
            dao.agregar(us);

//            SANTIAGO ZAGAL AGREGAR PREGUNTAS
            dao.agregarP(pre, us);
//            -----

//            SANTIAGO ZAGAL CORREO       
            EmailDAO email = new EmailDAO();
            try {
                email.enviar("Correo de Activacion PIIPOL", us);
            } catch (MessagingException ex) {
                Logger.getLogger(Controla.class.getName()).log(Level.SEVERE, null, ex);
            }
//            -----

            request.setAttribute("lista", lista);
            //listado de publicaciones que hace el usuario
            List<Publicacion> listaPP = pudao.listarPublicacionesPropias(dao.buscarusuario(user).getId_us());
            request.setAttribute("listaPP", listaPP);
            //listado de publicaciones de personas a las que sigue el usuario
            List<usuario> listadofollower1 = dao.listar(dao.buscarusuario(user).getId_us());
            request.setAttribute("listadofollower", listadofollower1);
            acceso = index;
            //acceso = listar;
        } else if (accion.equalsIgnoreCase("Siguiente")) {
            try {
                usuarioDAO dao = new usuarioDAO();
                //MÉTODO VERIFICAR CORREO USUARIO
                String email = request.getParameter("email");
                verificar = dao.verificaremail(email);

//                System.err.println("Encontro validar " + verificar);
                //MÉTODO VERIFICAR ALIAS USUARIO
                String alias = request.getParameter("alias");
                verificar1 = dao.verificarAlias(alias);
//                System.err.println("Encontro validar " + verificar1);

                if (verificar == true || verificar1 == true) {
                    System.out.println("Encontro- Correo Duplicado o nick");
//                    SANTIAGO ZAGAL LLAMA NUEVA PAGINA
                    acceso = validar;
//                    -----
                } else {
                    acceso = agregar;
                    String nombre, apellido, mail, pais, genero;
                    int edad;
                    nombre = request.getParameter("nombre");
                    apellido = request.getParameter("apellido");
                    alias = request.getParameter("alias");
                    mail = request.getParameter("email");
                    pais = request.getParameter("pais");
                    edad = Integer.parseInt(request.getParameter("edad"));
                    genero = request.getParameter("genero");
                    us.setNombre(nombre);
                    us.setApellido(apellido);
                    us.setNick(alias);
                    us.setEdad(edad);
                    us.setGenero(genero);
                    us.setMail(mail);
                    us.setPais(pais);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Controla.class.getName()).log(Level.SEVERE, null, ex);
            } catch (NullPointerException ex2) {

            }

        } else if (accion.equals("ganancia")) {
            acceso = ganancia;
        } else if (accion.equals("PUBLICAR")) {
            usuarioDAO dao = new usuarioDAO();
            Publicacion pu = new Publicacion();
            publicacionDAO pudao = new publicacionDAO();
            List<usuario> lista = dao.listar();
            List<Publicacion> listap = pudao.listar(dao.buscarusuario(user).getId_us());
            Part file = request.getPart("Fotopublica");
            String imageFileName = file.getSubmittedFileName();
            //String uploadPath = "C:/PIIPOL/build/web/imagenUsuario/" + imageFileName; 
            String uploadPath = "C:/PIIPOL/web/imagenUsuario/" + imageFileName;
            pu.setDescripcion(request.getParameter("descripcion"));
            usuario us1 = dao.buscarusuario(user);
            pu.setIduser(us1.getId_us());
            try {
                pu.setImagen(imageFileName);
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream is = file.getInputStream();
                byte[] data = new byte[is.available()];
                is.read(data);
                fos.write(data);
                fos.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            pudao.agregar(pu);
            request.setAttribute("lista", lista);

            //listado de publicaciones que hace el usuario
            List<Publicacion> listaPP = pudao.listarPublicacionesPropias(dao.buscarusuario(user).getId_us());
            request.setAttribute("listaPP", listaPP);

            //listado de publicaciones de personas a las que sigue el usuario
            List<usuario> listadofollower1 = dao.listar(dao.buscarusuario(user).getId_us());
            request.setAttribute("listadofollower", listadofollower1);

            //listado de publicaciones que puede ver el usuario
            listap = pudao.listar(dao.buscarusuario(user).getId_us());
            request.setAttribute("listap", listap);
            request.setAttribute("usuario", us1);
            acceso = listar;
        }

        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

//    SANTIAGO ZAGAL RESPUESTA A CORREO DUPLICADO
    private void responseC(HttpServletResponse resp, String msg) throws IOException {
        PrintWriter out = resp.getWriter();
        out.println("Error");
    }
//    ----------

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
}
