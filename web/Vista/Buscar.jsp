<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="modelo.usuario"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : Perfil
    Created on : 20-feb-2021, 10:02:34
    Author     : Mauricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./css/estilo.css" rel="stylesheet" type="text/css"/>
        <link href="./estilosmodal.css" rel="stylesheet" type="text/css"/>
        <link href="../css/estilosmodal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Perfil Usuario</title>
    </head>
    <body>
         <div class="modal" tabindex="-1" role="dialog" id="ventanapublica">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">PUBLICAR</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body" >
                        <form method="POST" action="Controla" enctype="multipart/form-data">
                            <p>Descripción</p>
                            <input type="text" name="descripcion" class="descripcion" placeholder="Descripción" required="">
                            <input type="file"  name="Fotopublica" required=""/>
                             <input type="submit" id="btnpublicar" name="accion" value="PUBLICAR"/>
                        </form>
                    </div>
                    <div class="modal-footer">
                         <input type="submit" data-dismiss="modal" value="CERRAR"/>
                    </div>
                    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" ></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" ></script>
                </div>
            </div>
        </div>
        
        <div id="contenedor5">
            <img  src="./imagen/${usuario.getNomFoto()}" class="fotogrande" width="20%" height="20%" alt="fotoPerfil"/>
            <div class="boton">
                <input type="image" data-target="#ventanapublica" data-toggle="modal" class="agregarpublicacion" id="agregarpublicacion" src="./imagen/boton agragar archivo a perfil.png" width="30%" height="30%"/> 
            </div>
        </div>
        <div id='contenedor4' >
            <div  class="colum1"style='height:90%; width: 10%;  float: left;'>
                <nav class="nav flex-column">
                    <li>
                        <img name="logo2" class="logo2" src="./imagen/${usuario.getNomFoto()}" alt="logo2" width='80%' height='80%'> 
                    <li>
                        <a class="nav-link" href="#"><img name="corazon" src="./imagen/boton favoritos.png" alt="corazon" width='25%' height='50%'></a>
                        <a class="nav-link" href="#"><img name="live" src="./imagen/boton live.png" alt="corazon" width='25%' height='50%'></a>
                        <a class="nav-link" href="#"><img name="logo3" src="./imagen/boton noticias.png" alt="logo3" width='25%' height='50%'></a>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img src="./imagen/boton notificaciones.png" alt="notificaciones" width='20%' height='45%'>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Boris te dio un like</a>
                            <a class="dropdown-item" href="#">Vale te mando un regalo</a>
                            <a class="dropdown-item" href="#">Boris comenzo a seguirte</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            <img name="ajustes" src="./imagen/boton configuraciones.png" alt="ajustes" width='20%' height='45%'>
                        </a>
                        <div class="dropdown-menu">
                            <a class="dropdown-item" href="#">Editar Perfil</a>
                            <a class="dropdown-item" href="#">Invitar a Piipol</a>
                            <a class="dropdown-item" href="#">Ajustes de cuenta</a>
                            <a class="dropdown-item" href="#">Ajustes de privacidad</a>
                            <a class="dropdown-item" href="#">Notificaciones</a>
                            <a class="dropdown-item" href="#">Regla de uso</a>
                            <a class="dropdown-item" href="#">Mandanos un Piip</a>

                        </div>
                    </li>
                    <a href="#"><img name="ganancia" src="./imagen/boton estadisticas.png" alt="ganancia" width='20%' height='45%'></a>
                </nav>
            </div>
        </div>
        <div  class="colum2" action='Controla' method='POST' style='height:70%; width: 55% ; float: left;'>

            <table border="0">
                <tbody>
                    <c:forEach var="datop" items="${listap}">
                        <tr>
                            <td WIDTH="100%" HEIGHT="100%"><img
                                    style='float: center;         
                    border: double 3px transparent;
                    border-radius: 20px;
                    background-image: linear-gradient(white, white), 
                    linear-gradient(to right, red, purple);
                    background-origin: border-box;
                    background-clip: content-box, border-box;'                                                                        
                                    src="./imagen/${datop.getImagen()}" width="90" height="90"/><br>${datop.getDescripcion()}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div  class="colum3" style='height:30%; width: 60%; float: left;'>
            <table border="0">
                <tbody>
                    <c:forEach var="dato" items="${lista}">
                        <tr>
                            <td WIDTH="25%" HEIGHT="25%"><img src="./imagen/${dato.getNomFoto()}" width="90" height="90"/><br>${dato.getNombre()} ${dato.getApellido()}
                            </td>
                                                
                        </tr>
                    </c:forEach>                        
                </tbody>
            </table>            
        </div>

         <%--DIVISOR PARA CREAR CAMPO DE SEGUIDOS--%>   
         <div  class="colum4" style='height:80%; width: 20%; float: left;'>
            
             <table border="0">
                 <div class="box-center"> </div>
                <tbody> 
                    <c:set var = "contador" value = "${1}" scope="page"/>
                    <c:forEach var="dato" items="${listadofollower}" varStatus="numero">
                                                           
                      
                    <c:if test="${numero.count%2 != 0}">
                      <tr>
                            <td width="25%">
                            <img style='float: center;         
  border: double 3px transparent;
  border-radius: 20px;
  background-image: linear-gradient(white, white), 
                    linear-gradient(to right, red, purple);
  background-origin: border-box;
  background-clip: content-box, border-box;' src="./imagen/${dato.getNomFoto()}" width="90" height="90"/><br>${dato.getNombre()} ${dato.getApellido()}
        
                            </td>                                                                 
                      
                        </c:if>
                    
                    <c:if test="${numero.count%2 == 0}">
                        
                            <td width="25%">
                            <img style='float: center;         
  border: double 3px transparent;
  border-radius: 20px;
  background-image: linear-gradient(white, white), 
                    linear-gradient(to right, red, purple);
  background-origin: border-box;
  background-clip: content-box, border-box;' src="./imagen/${dato.getNomFoto()}" width="90" height="90"/><br>${dato.getNombre()} ${dato.getApellido()}
        
                            </td> 
                           </tr>
                        </c:if>            
                    </c:forEach>
                       
                           
                           
                           
                </tbody>
            </table>
        </div>
                    
                    <div class="row navbar-fixed-bottom">
                        <div class="col-md-4 chat-box footer pull-right">
                            <div class="panel panel-primary">
                                <span class="glyphicons glyphicons-comment">Clat</span>
                                <div class="btn-group pull-right">
                                    <button type="button" class="btn btn-default btn-xs dropdown toggle" data-toggle="dropdown">
                                        <span class="glyphicons glyphicons-chevron-down"></span>
                                    </button>
                                    <ul class="dropdown-menu slidedown">
                                        <li><span class="glyphicons glyphicons-off"></span>Salir</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="panel-body class-widget">
                        <ul class="chat chat-messages" >
                            <li class="left clearfix">
                                <span class="chat-img pull-left"></span>
                            </li>
                        </ul>                        
                    </div>
    </body>
</html>