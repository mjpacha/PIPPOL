<%-- 
    Document   : Registro
    Created on : 17-feb-2021, 11:34:58
    Author     : Mauricio
--%>

<%@page import="modeloDAO.usuarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
                    <input type="text" name="nombre" placeholder="Nombre:" required/>
                </div>
                <div class="white-grad">
                    <input type="text" name="apellido" placeholder="Apellido: " required/>
                </div>
                <div class="white-grad">
                    <input type="text" name="alias" placeholder="Alias:" required />
                </div>
                <div class="white-grad">                    
                    <input type="text" id="email" name="email" required placeholder="Mail: pedrito@gmail.com" 
                           onkeyup="validarEmail(this)">
                </div>
                
                
                
                <input type="text" hidden="" id="emailverification" name="emailverification" value="false" required />
                <a id='resultado' i></a>       
                
                
                <!--VALIDAR CORREO-->                
                <input type="text" hidden="" id="veremail" name="verifica1" value="false" required />
                <a id='resultado2' i></a> 
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
                    <div class="coldiv">
                        <input type="radio" name="genero" id="genero" value="Otro" title="OTRO" required/>
                        <label for="generoOtro">
                            <img src="./imagen/otro.png" width="30" alt="piipol otro"/>
                        </label>
                    </div>
                </div> 
                <div class="div-button">
                    <input type='submit' name="accion" value='Siguiente'/>
                </div>         
            <!--SANTIAGO ZAGAL BOTON FACE-->
                    <script>
                        function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
                            console.log('statusChangeCallback');
                            console.log(response);                   // The current login status of the person.
                            if (response.status === 'connected') {   // Logged into your webpage and Facebook.
                                testAPI();  
                            } else {                                 // Not logged into your webpage or we are unable to tell.
                                document.getElementById('status').innerHTML = 'Please log ' + 'into this webpage.';
                            }
                        }

                        function checkLoginState() {               // Called when a person is finished with the Login Button.
                            FB.getLoginStatus(function (response) {   // See the onlogin handler
                                statusChangeCallback(response);
                            });
                        }

                        window.fbAsyncInit = function () {
                            FB.init({
                                appId: '339681917497212',
                                cookie: true, // Enable cookies to allow the server to access the session.
                                xfbml: true, // Parse social plugins on this webpage.
                                version: 'v10.0'           // Use this Graph API version for this call.
                            });

                            FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
                                statusChangeCallback(response);        // Returns the login status.
                            });
                        };

                        function testAPI() {                      // Testing Graph API after login.  See statusChangeCallback() for when this call is made.
                            console.log('Welcome!  Fetching your information.... ');
                            FB.api('/me', function (response) {
                                console.log('Successful login for: ' + response.name);
                                document.getElementById('status').innerHTML = 'Thanks for logging in, ' + response.name + '!';
                                });
                            }
                    </script>
                <!----------->
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
