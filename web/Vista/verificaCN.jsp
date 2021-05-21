<%-- 
    Document   : verificaCN
    Created on : 07/05/2021, 9:44:51
    Author     : Santy
--%>

<%@page import="modeloDAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    usuarioDAO dao = new usuarioDAO();
    boolean emailEN = dao.verificaremail(request.getParameter("email"));
    System.out.println("Nueva encontro email "+ emailEN);
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PIIPOL</title>
        <link href="./css/estilo.css" rel="stylesheet" type="text/css"/>
    </head>
    <script >
        function validarEmail(elemento) {

            var texto = document.getElementById(elemento.id).value;
            var regex = /^[-\w.%+]{1,64}@(?:[A-Z0-9-]{1,63}\.){1,125}[A-Z]{2,63}$/i;
          
            if (!regex.test(texto)) {
                document.getElementById("emailverification").value = "false";
                document.getElementById("resultado").innerHTML = "Correo inválido";
            } else {
                document.getElementById("emailverification").value = "true";
                document.getElementById("resultado").innerHTML = "";                
            }

        }
    </script>    
     
    
    
    <body>
        <!--SANTIAGO ZAGAL BOTON DE ATRAS-->
        <div>            
            <a href="index.jsp" style="float: left">
                <img src="./imagen/boton atrás.png" alt="" width="60"/>
            </a>
            <a href="index.jsp" style="float: right">
                <img src="./imagen/pag.1.logo.png" alt="" width="40"/>
            </a>            
        </div>
        <br><br><br><br>
        <!----------->
        
        <div id="contenedor1">
            <form id="form1" action="Controla" method="POST" onsubmit="return validateForm()">
                <%--COLOCA LAS CAJAS DE TEXTO--%>
                <div class="white-grad">
                    <input type="text" name="nombre" placeholder="Nombre:" value="<%=request.getParameter("nombre") %>" required/>
                </div>
                <div class="white-grad">
                    <input type="text" name="apellido" placeholder="Apellido: " value="<%=request.getParameter("apellido") %>" required/>
                </div>
                
                <!-- SANTIAGO ZAGAL VALIDAR NICK-->
                <div class="white-grad">
                    <input type="text" name="alias" placeholder="Alias:" value="<%=request.getParameter("alias") %>" required />
                </div>
                <%                    
                    boolean nickEN = dao.verificarAlias(request.getParameter("alias"));
                    System.out.println("Nueva encontro email "+ nickEN);
                    if (nickEN==false) {   
                    } else {
                        String res2 = "Nick Duplicado";
                %>
                    <a id='resultado2'> <%=res2%> </a>
                <%
                    }
                %>
                <!-------->              
                
                
                <!-- SANTIAGO ZAGAL VALIDAR CORREO-->
                <div class="white-grad">                    
                    <input type="text" id="email" name="email" required placeholder="Mail: pedrito@gmail.com"  
                           value="<%=request.getParameter("email") %>" onkeyup="validarEmail(this)">
                </div>    
                <%                                        
                    if (emailEN==false) {                        
                    } else {
                        String res = "Correo Duplicado";
                %>
                    <a id='resultado2'> <%=res%> </a>
                <%
                    }
                %>
                <input type="text" hidden="" id="emailverification" name="emailverification" value="false" disabled="" required />
                <a id='resultado'></a>  
                <!-------->
                
               
                
                <%--COLOCA UNA LISTA SELECCIONABLE--%>
                <div class="white-grad">
                    <select name="edad" required>
                        <option value="" disabled selected>Edad:</option>
                        <!--SANTIAGO ZAGAL SE COLOCO LA EDAD DESDE 18 A 100-->
                        <%
                            for (int i = 18; i <= 100; i++) {
                        %>
                                <option> <%=i%> </option>;                        
                        <%
                            }
                        %>
                        <!------------->
                    </select>
                </div>
                <%--COLOCA UNA LISTA SELECCIONABLE--%>
                <div class="white-grad">
                    <div id='founded-countries'>
                    </div>
                </div>
                <script type='text/javascript'>
                    function miFuncion() {
                        var url = 'https://restcountries.eu/rest/v2/all';
                        fetch(url)
                                .then(data => data.json())
                                .then(data => {
                                    var countries = data;
                                    var regional_countries = [];
                                    countries.forEach(item => {
                                        //if (item.region == region) {
                                        regional_countries.push(item.name);
                                        //}
                                    });
                                    console.log(regional_countries);
                                    console.log(regional_countries.length);
                                    if (regional_countries.length > 0) {
                                        setTheCountries(regional_countries);
                                    }
                                });
                    }
                    window.onload = miFuncion;
                    // function declarations
                    function loadCountries()
                    {
                        var select = document.getElementById('regions');
                        var region = select.options[select.selectedIndex].value;
                        var url = 'https://restcountries.eu/rest/v2/all';
                        fetch(url)
                                .then(data => data.json())
                                .then(data => {
                                    var countries = data;
                                    var regional_countries = [];
                                    countries.forEach(item => {
                                        if (item.region == region) {
                                            regional_countries.push(item.name);
                                        }
                                    });
                                    if (regional_countries.length > 0) {
                                        setTheCountries(regional_countries, region);
                                    }
                                });
                    }
                    function setTheCountries(countries)
                    {
                        var html = '';
                        html += '<select name="pais" required>';
                        html += '<option value="">Seleccione el país</option>';
                        countries.forEach(item => {
                            html += '<option value=' + item + '>' + item + '</option>';
                        });
                        html += '</select>';
                        // document.getElementById('selected-region').innerHTML = result_title;
                        document.getElementById('founded-countries').innerHTML = html;
                    }
                    // add event listeners
                    document.querySelector('#regions')
                            .addEventListener('change', loadCountries);
                </script>
                <div class="div-button rowdiv">
                    <%--COLOCA CHECKBOX PARA HOMBRE  MUJER--%>
                    <div class="coldiv">
                        <input type="radio" name="genero" id="genero" value="Masculino" title="MASCULINO" required/>
                        <label for="generoMasculino">
                            <img src="./imagen/masculino.png" width="40" alt="piipol hombre" />
                        </label>
                    </div>
                    <div class="coldiv">
                        <input type="radio" name="genero" id="genero" value="Femenino" title="FEMENINO" required/>
                        <label for="generoFemenino">
                            <img src="./imagen/femenino.png" width="30" alt="piipol mujer"/>
                        </label>
                    </div>
                </div> 
                <div class="div-button">
                    <input type='submit' name="accion" value='Siguiente'/>
                </div>
            </form>
        </div>
        <script>
            function validateForm() {
                var x = document.forms["form1"]["emailverification"].value;
                console.log(x);
                if (x === "false") {
                    alert("Debes ingresar un correo válido");
                    return false;
                }
            }
        </script>
    </body>
</html>