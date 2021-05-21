<%-- 
    Document   : Registro2
    Created on : 21-feb-2021, 9:58:38
    Author     : Mauricio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registro</title>
        <link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%--CREA LA PRIMERA FILA--%>
        <div id="fila">
            <%--COLOCA IMAGEN Y TEXTO EN LA PRIMERA FILA--%>
            <img src="../imagen/pag.1.logo.png" width="50" height="50" alt="piipol hombre" class="imagencentro"/>
            <h1 class="tituloreg1" ><br>OBTEN SEGUIDORES PARA GANAR MAS DINERO</h1>
        </div>
            <%--CREA UNA 2DA FILA EN LA QUE IRAN LOS TIPOS DE LIVE CON SU DESCIRPCION Y LOS BOTONES--%>
        <div id='fila2'>
            <%--CREA COLUMNAS PARA COLOCAR CADA TIPO DE LIVE--%>
            <div class="colum" style='height:400px; width: 350px; float: left;'>
                <a class='tipo'> Piipol live<br></a>
                <%--INSERTA IMAGEN--%>
                <img src="../imagen/bancapublica.jpg" width="350" height="200" alt="bancapublica"/>
                <%--INSERTA LA DESCRIPCION--%>
                <div class='info1'><br>
                    Genera dinero haciendo live's sin tener un talento, interactuando con tus seguidores,
                mientras mas regalos recibas, más dinero obtienes.
                </div>
                <%--INSERTA EL BOTON--%>
                <div align='right'>
                    <input type="submit" value="CREAR PERFIL" />
                </div>
            </div>
                <%--CREA UNA 2DA COLUMNA PARA COLOCAR CADA TIPO DE LIVE--%>
            <div class="colum" style='height: 400px; width: 350px; float: left;'>
                <%--INSERTA IMAGEN--%>
                <a class='tipo'> Piipol Academy <br></a>
                <img src="../imagen/bancapublica.jpg" width="350" height="200" alt="bancapublica"/>
               <%--INSERTA LA DESCRIPCION--%>
                <div class='info1'><br>Genera dinero haciendo live's enseñando tus dotes académicos, haz que tus seguidores
                    se conviertan en tus alumnos, mientras más regalos recibas, más dinero obtienes. 
                </div>
                <%--INSERTA EL BOTON--%>
                <div align='right'>
                    <input type="submit" value="CREAR PERFIL" />
                </div>
            </div>
                 <%--CREA UNA 3RA COLUMNA PARA COLOCAR CADA TIPO DE LIVE--%>
            <div class="colum" style='height: 400px; width: 350px; float: left;'>
                <%--INSERTA IMAGEN--%>
                <a class='tipo'> Piipol Music <br></a>
                <img src="../imagen/bancapublica.jpg" width="350" height="200" alt="bancapublica"/>
                <%--INSERTA LA DESCRIPCION--%>
                <div class='info1'><br>Genera dinero haciendo live's cantando o tocando un instrumento, haz que tus
                    seguidores se conviertan en tus alumnos, más dinero obtienes.
                </div>
                <%--INSERTA EL BOTON--%>
                <div align='right'>
                    <input type="submit" value="CREAR PERFIL" />
                </div>
            </div>
        </div>
    </body>
</html>
