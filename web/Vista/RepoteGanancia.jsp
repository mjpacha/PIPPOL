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
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
         <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <title>Perfil Usuario</title>
    </head>
        
        <div id="contenedor5">
            
        </div>
        <div id='contenedor4'>
            <div class="colum1"style='height:80%; width: 10%;  float: left;'>
                <nav class="nav flex-column">
                <li>
                    <img name="logo2" class="logo2" src="./imagen/bancapublica.jpg" alt="logo2" width='80%' height='80%'> 
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
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
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
                <a href="Controla" ><img name="ganancia" src="./imagen/boton estadisticas.png" alt="ganancia" width='20%' height='45%'></a>
            </nav>
            </div>
        </div>
    <div div class="tablaganancia"style='height:800px; width: 55%; float: left;'>
        <table border="1">
            <tbody>
                <tr>
                    <td WIDTH="15%" HEIGHT="10%"> <br>FECHA</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>MONEDA</td>
                    <td WIDTH="15%" HEIGHT="10%"> <br>EFECTIVO</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>LIVE</td>
                </tr>
                <tr>
                    <td WIDTH="15%" HEIGHT="10%"><br>06-11-2020</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>800</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>$800</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>8h34min</td>
                </tr>
                <tr>
                    <td WIDTH="1%" HEIGHT="10%"><br>07-11-2020</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>1000</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>$1000</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>6h34min</td>
                </tr>
                <tr>
                    <td WIDTH="15%" HEIGHT="10%"><br>08-11-2020</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>500</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>$500</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>7h34min</td>
                </tr>
                <tr>
                    <td WIDTH="15%" HEIGHT="10%"><br>09-11-2020</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>200</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>$200</td>
                    <td WIDTH="15%" HEIGHT="10%"><br>2h34min</td>
                </tr>
            </tbody>
        </table>
</div>
        <div div class="colum3"style='height:30%; width: 25%; float: left;'>
        <table border="0">
            <tbody>
                <tr>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="./imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="./imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                </tr>
                <tr>
                     <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="./imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="./imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                </tr>
                <tr>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                 </tr>
                <tr>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                </tr>
                <tr>
                     <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                </tr>
                <tr>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                 </tr>
                <tr>
                     <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>
                    <td WIDTH="35%" HEIGHT="20%"><input type="image" name="amigo" src="imagen/bancapublica.jpg" alt="amigo" width='80%' height='20%'><br>Nombre de usuario</td>   
                </tr>
            </tbody>
        </table>
</div>
</html>