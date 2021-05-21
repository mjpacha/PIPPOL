<%-- 
    Document   : Perfil
    Created on : 20-feb-2021, 10:02:34
    Author     : Mauricio
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .modal-dialog {
                position: fixed;
                margin-top:  6%;
                width: 320px;
                height: 90%;
                right: 0px;
            }
            .modal-content {
                height: 100%;
            }
        </style>
        <title>Perfil Usuario</title>
    </head>
    <div id="contenedor3">
        <button type="submit" class="live">Piipol<br/>Live</button>
        <button type="submit" class="academico">Piipol<br/>Académico</button>
        <button type="submit" class="music">Piipol<br/>Music</button>
        <button type="submit" class="global"><br/>Global</button>
        <button type="submit" class="cerca" ><br/>Cerca</button>
        <input type="text" name="busqueda" value="" >
        <button type="submit"class="buscar">Buscar</button>
    </div>

    <div class="colum1"style='height:80%; width: 10% ; float: left;'>
        <img src="../imagen/bancapublica.jpg" class="fotoperfil" width="75%" height="20%" alt="cooperativas"/>
        <div>
            <input type="image" name="logo2" src="../imagen/boton live.png" alt="logo2" width='25%' height='20%'> 
        </div>
        <div>
            <input type="image" name="corazon" src="../imagen/boton favoritos.png" alt="corazon" width='25%' height='20%'>
        </div>
        <div>
            <input type="image" name="logo3" src="../imagen/boton noticias.png" alt="logo3" width='25%' height='20%'>
        </div>
        <div id="segundomenu" >
            <div>
                <input type="image" name="notificaciones" src="../imagen/boton notificaciones.png" alt="notificaciones" width='25%' height='20%'>
            </div>
            <div>
                <input type="image" name="ajustes" src="../imagen/boton configuraciones.png" alt="ajustes" width='25%' height='20%'>
            </div>
            <div>
                <input type="image" name="ganancia" src="../imagen/boton estadisticas.png" alt="ganancia" width='25%' height='20%'>
            </div>
        </div>
    </div>
    <div div class="colum2"style='height:70%; width: 55% ; float: left;'>
        <table border="0">
            <tbody>
                <tr>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'><a>Nombre de usuario</a></td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                </tr>
                <tr>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'><a>Nombre de usuario</a></td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                <tr>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'><a>Nombre de usuario</a></td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='85%' height='22%'>Nombre de usuario</td>
                </tr>
            </tbody>
        </table>
    </div>
    <div div class="colum3"style='height:30%; width: 25% ; float: left;'>
        <table border="0">
            <tbody>
                <tr>
                    <td WIDTH="55%" HEIGHT="25%"><input type="image" data-target="#ventanachat" data-toggle="modal" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='80%' height='50%'><a>Nombre de usuario</a></td>
                    <td WIDTH="55%" HEIGHT="25%"><input type="image" name="amigo" src="../imagen/bancapublica.jpg" alt="amigo" width='80%' height='50%'>Nombre de usuario</td>   
                </tr>
            </tbody>
        </table>
        <div class="modal" tabindex="-1" role="dialog" id="ventanachat">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <div class="d-flex justify-content-between">
                            <input type="image" name="atras" src="../imagen/boton atrás.png" alt="atras" width='25%' height='20%' data-dismiss="modal">
                            <img src="../imagen/bancapublica.jpg" width="100" height="100" alt="bancapublica"/>
                            <table border="0">
                                <tbody>
                                    <tr>
                                        <td WIDTH="25%" HEIGHT="25%"><input type="image" name="eliminar" src="../imagen/boton eliminar.png" alt="eliminar" width='100%' height='100%'>
                                        </td>
                                        <td WIDTH="25%" HEIGHT="25%"><input type="image" name="bloquear" src="../imagen/boton bloquear.png" alt="bloquear" width='100%' height='100%'>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td WIDTH="25%" HEIGHT="25%"><input type="image" name="llamar" src="../imagen/boton llamar.png" alt="llamar" width='100%' height='100%'>
                                        </td>
                                        <td WIDTH="25%" HEIGHT="25%"><input type="image" name="perfil" src="../imagen/boton perfil mensaje.png" alt="perfil" width='100%' height='100%'>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                        </div>
                    </div>
                    <div class="modal-body" >
                        <form method="POST" action="Controla" enctype="multipart/form-data">

                            <textarea name="chat" rows="15" cols="28">
                            </textarea>
                                <div class="row justify-content-between">
                                    <div class="col">
                                        <input type="file" id='file_input' style="display:none;" />
                                <img src="../imagen/boton enviar archivos en mensajeria.png" id='image_input' width="200%" height="100%"/>
                                <script type="text/javascript">
                                    $('#image_input').on('click', function () {
                                        $('#file_input').trigger('click');
                                    });
                                </script>
                                    </div>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control-plaintext"  class="mensaje" placeholder="Escribir Mensaje" required="">
                                    </div>
                                    <div class="col">
                                        <input type="image" name="enviar" src="../imagen/enviar.png" alt="enviar" width='200%' height='100%'>
                                    </div>
                                     </div>
                           


                        </form>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </div>

</html>
