<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Preguntas Seguridad</title>
        <link href="./css/estilo.css" rel="stylesheet" type="text/css"/>    
        
        <!--SANTIAGO ZAGAL VALIDA PREGUNTA--> 
        <script>
            function validar(){
                var nombreVariable = document.getElementById('pregunta1');
                var optionSelected = nombreVariable.options[nombreVariable.selectedIndex].value;                             
                console.log("Nombre " + optionSelected);
                if(optionSelected == 0 || optionSelected == "") {
//                    alert("Selecciona Una opción de la pregunta 1");
//                    optionSelected.focus();
                    document.getElementById("vpreg1").value = "false";
                    document.getElementById("rp1").innerHTML = "No escogio alguna pregunta";
                } else {
                    document.getElementById("vpreg1").value = "true";
                    document.getElementById("rp1").innerHTML = "";                
                }
            } 
            function validar2(){
                var nombreVariable = document.getElementById('pregunta2');
                var optionSelected = nombreVariable.options[nombreVariable.selectedIndex].value;                             
                console.log("Nombre " + optionSelected);
                if(optionSelected == 0 || optionSelected == "") {
//                    alert("Selecciona Una opción de la pregunta 1");
//                    optionSelected.focus();
                    document.getElementById("vpreg2").value = "false";
                    document.getElementById("rp2").innerHTML = "No escogio alguna pregunta";
                } else {
                    document.getElementById("vpreg2").value = "true";
                    document.getElementById("rp2").innerHTML = "";                
                }
            } 
            function validar3(){
                var nombreVariable = document.getElementById('pregunta3');
                var optionSelected = nombreVariable.options[nombreVariable.selectedIndex].value;                             
                console.log("Nombre " + optionSelected);
                if(optionSelected == 0 || optionSelected == "") {
//                    alert("Selecciona Una opción de la pregunta 1");
//                    optionSelected.focus();
                    document.getElementById("vpreg3").value = "false";
                    document.getElementById("rp3").innerHTML = "No escogio alguna pregunta";
                } else {
                    document.getElementById("vpreg3").value = "true";
                    document.getElementById("rp3").innerHTML = "";                
                }
            } 
        </script>
        <!---------->
        
    </head>
    <body>
       <!--SANTIAGO ZAGAL BOTON DE ATRAS-->
        <div>            
            <a href="/PIIPOL/Registrar" style="float: left">
                <img src="./imagen/boton atrás.png" alt="" width="60"/>
            </a>
            <a href="index.jsp" style="float: right">
                <img src="./imagen/pag.1.logo.png" alt="" width="40"/>
            </a>            
        </div>
       
        <!----------->
        <div id="contenedor1">
            <form id="form1" name="form1" action="Controla" method="POST" enctype="multipart/form-data" 
                  onsubmit="return validarForm()">
                <%--COLOCA UNA LISTA SELECCIONABLE--%>
                <h1>Preguntas de seguridad:</h1>
                <div class="white-grad">
                    <select id="pregunta1" name="pregunta1" id="pregunta1" 
                            onchange="verificarPregunta1(), validar()" required>
                        <option selected value="0" disabled >Seleccione una pregunta:</option>
                        <option value="1">¿Cuál es su color favorito?</option>
                        <option value="2">¿El nombre de su primera mascota?</option>
                        <option value="3">¿Cuál es su pelicula favorita?</option>
                        <option value="4">¿Cuál es su deporte favorito?</option>
                        <option value="5">¿Cuál es el nombre de su abuela materna?</option>
                    </select>                    
                </div>
                
                <!--SANTIAGO ZAGAL PREGUNTAS NO SELECCIONADAS Y onchange="validar()"  EN CASILLEROS DE RESPUESTAS
                Y validar() EN LOS SELECT-->
                <input type="text" hidden="" id="vpreg1" name="vpreg1" value="false" required/>
                <a id='rp1' i> </a>   
                <!---------->
                
                <%--COLOCA UNA CAJA DE TEXTO PARA LA RESPUESTA--%>
                <div class="white-grad">
                    <input type="text" name="respuesta1" placeholder="Respuesta:" pattern="[Aa-Zz]{4,25}" 
                           title="Solo Letras" onchange="validar()" required/>
                </div>
                <%--COLOCA UNA LISTA SELECCIONABLE--%>
                <div class="white-grad">
                    <select id="pregunta2" name="pregunta2" onchange="verificarPregunta2(), validar2()" required>
                        <option value="0" disabled selected>Seleccione una pregunta:</option>
                        <option value="1">¿Cuál es su color favorito?</option>
                        <option value="2">¿El nombre de su primera mascota?</option>
                        <option value="3">¿Cuál es su pelicula favorita?</option>
                        <option value="4">¿Cuál es su deporte favorito?</option>
                        <option value="5">¿Cuál es el nombre de su abuela materna?</option>
                    </select>
                </div>
                <div class="white-grad">
                    <input type="text" name="respuesta2" placeholder="Respuesta:" pattern="[Aa-Zz]{4,25}" 
                           onchange="validar2()" title="Solo Letras"  required/>
                </div>
                
                <!--SANTIAGO ZAGAL PREGUNTAS NO SELECCIONADAS Y onchange="validar2()"  EN CASILLEROS DE RESPUESTAS
                Y validar2() EN LOS SELECT-->
                <input type="text" hidden="" id="vpreg2" name="vpreg2" value="false" required />
                <a id='rp2' i></a>   
                <!---------->
                
                <%--COLOCA UNA LISTA SELECCIONABLE--%>
                <div class="white-grad">
                    <select id="pregunta3" name="pregunta3" onchange="verificarPregunta3(), validar3()" >
                        <option value="0" disabled selected>Seleccione una pregunta:</option>
                        <option value="1">¿Cuál es su color favorito?</option>
                        <option value="2">¿El nombre de su primera mascota?</option>
                        <option value="3">¿Cuál es su pelicula favorita?</option>
                        <option value="4">¿Cuál es su deporte favorito?</option>
                        <option value="5">¿Cuál es el nombre de su abuela materna?</option>
                    </select>
                </div>
                
                <!--SANTIAGO ZAGAL PREGUNTAS NO SELECCIONADAS Y onchange="validar()"  EN CASILLEROS DE RESPUESTAS 
                Y validar3() EN LOS SELECT-->
                <input type="text" hidden="" id="vpreg3" name="vpreg2" value="false" required />
                <a id='rp3' i></a>   
                <!---------->
                
                <%--COLOCA UNA CAJA DE TEXTO PARA LA RESPUESTA--%>
                <div class="white-grad">
                    <input type="text" name="respuesta3" placeholder="Respuesta:" pattern="[Aa-Zz]{4,25}" 
                           onchange="validar3()" title="Solo Letras" required/>
                </div>
                <h1>Crear contraseña:</h1>
                <%--COLOCA UNA CAJA DE TEXTO PARA LA CONTRASEÑA--%>
                <div class="white-grad">
                    <input type="password" name="contrasena" id="contrasena" placeholder="Contraseña:" required/>
                </div>
                <div class="white-grad">
                    <input onblur="verificarPassword()" type="password" name="confirmaContrasena" id="confirmaContrasena" 
                           placeholder="Confirmar contraseña:" required/>
                </div>
                
                <!--SANTIAGO ZAGAL VERIFICAR SI SON IGUALES-->
                
                <input type="text" hidden="" id="emailverification" name="emailverification" value="false" required />
                <a id='resultadop' i></a>       
                
                <!---------->
                
                <input type="file" name="foto" id="foto" accept=".jpg, .jpeg, .png" required/>
                <div class="div-button">
                    <input type='submit' name="accion" value="Crear Perfil">
                </div>
            </form>
        </div>
         
        
                
                
                
                
        <script type="text/javascript" src="./js/jquery-3.2.1.slim.min.js"></script>
        <script>
//Metodo para verificar las opciones seleccionadas para que no se puede repetir
                        function habilitarOption(select, option) {
                            $("#" + select + " option").each(function () {
                                let comparacion = (parseInt($(this).val()) === parseInt(option));
                                let pregunta1 = $("#pregunta1").val();
                                let pregunta2 = $("#pregunta2").val();
                                let pregunta3 = $("#pregunta3").val();
                                if (select === "pregunta1") {
                                    if (comparacion) {
                                        $('#pregunta2 option[value="' + option + '"]').prop("disabled", "true");
                                        $('#pregunta3 option[value="' + option + '"]').prop("disabled", "true");
                                    } else {
                                        if (((pregunta3) === parseInt(option)) || ((pregunta2) === parseInt(option))) {
                                            $('#pregunta2 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                            $('#pregunta3 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                        }
                                    }
                                } else if (select === "pregunta2") {
                                    if (comparacion) {
                                        $('#pregunta1 option[value="' + option + '"]').prop("disabled", "true");
                                        $('#pregunta3 option[value="' + option + '"]').prop("disabled", "true");
                                    } else {
                                        if (((pregunta3) === parseInt(option)) || ((pregunta1) === parseInt(option))) {
                                            $('#pregunta1 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                            $('#pregunta3 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                        }
                                    }
                                } else if (select === "pregunta3") {
                                    if (comparacion) {
                                        $('#pregunta2 option[value="' + option + '"]').prop("disabled", "true");
                                        $('#pregunta1 option[value="' + option + '"]').prop("disabled", "true");
                                    } else {
                                        if (((pregunta1) === parseInt(option)) || ((pregunta2) === parseInt(option))) {
                                            $('#pregunta2 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                            $('#pregunta1 option[value="' + $(this).val() + '"]').removeAttr("disabled");
                                        }
                                    }
                                }

                            });
                        }

                        //Usar la verificacion para la pregunta1
                        function verificarPregunta1() {
                            let pregunta1 = $("#pregunta1").val();
                            habilitarOption("pregunta1", pregunta1);
                        }

                        //Usar la verificacion para la pregunta2
                        function verificarPregunta2() {
                            let pregunta2 = $("#pregunta2").val();
                            habilitarOption("pregunta2", pregunta2);
                        }

                        //Usar la verificacion para la pregunta3
                        function verificarPregunta3() {
                            let pregunta3 = $("#pregunta3").val();
                            habilitarOption("pregunta3", pregunta3);
                        }

                        //Metodo para verificar las contraseñas
                        function verificarPassword() {
                            console.log("Entra Pas1");
                            let pass1 = $("#contrasena").val();
                            let pass2 = $("#confirmaContrasena").val();
                            
                            // SANTIAGO ZAGAL CONTRASEÑA                           
                            var espacios = false;
                            var cont = 0;
                            
                            if (pass1.length == 0 || pass2.length == 0) {
                                alert("Los campos de la password no pueden quedar vacios");
                                return false;
                            } else {
                                if (pass1 != pass2) {
                                    alert("Las passwords deben de coincidir");
                                    return false;
                                  } else {
    //                                alert("Todo esta correcto");                                     
                                    if (pass1.length >= 6 ) {
                                        while (!espacios && (cont < pass1.length)) {
                                        if (pass1.charAt(cont) == " ")
                                            espacios = true;
                                            cont++;
                                        }
                                        if (espacios) {
                                            alert ("La contraseña no puede contener espacios en blanco");
                                            return false;
                                        }
                                    } else {
                                        alert ("La longitud debe ser de 6 caracteres");
                                        return false;
                                    }
//                                    return true;
                                }
                                
                            }
                            
//                            ------
                            
                        }


//Metodo para verificar que el formulario esta completo
                        function validarForm() {
                            console.log("Entro ");
//                        SANTIAGO ZAGAL VALIDA PREGUNTAS SELECCIONADAS
                            var x = document.forms["form1"]["vpreg1"].value;
                            var x2 = document.forms["form1"]["vpreg2"].value;
                            var x3 = document.forms["form1"]["vpreg3"].value;
                            console.log(x);
                            if (x == "false" || x2 == "false" || x3 == "false") {
                                alert("Debes ingresar pregunta");                                
                                return false;
                            }            
//                            -----

                            let pregunta1 = $("#pregunta1").val();
                            let pregunta2 = $("#pregunta2").val();
                            let pregunta3 = $("#pregunta3").val();
                            let respuesta1 = $("#respuesta1").val();
                            let respuesta2 = $("#respuesta2").val();
                            let respuesta3 = $("#respuesta3").val();
                            let pass1 = $("#contrasena").val();
                            let pass2 = $("#confirmaContrasena").val();
                            let foto = $("#foto").val();
                            if (pregunta1 !== 0 && pregunta2 !== 0 && pregunta3 !== 0 && respuesta1 !== "" &&
                                    respuesta2 !== "" &&
                                    respuesta3 !== "" && pass1 == pass2 && foto !== "") {
                                return true;
                            } else {
                                return false;
                            }
                            

                            
                            
                        }
        </script>
        
        
        
    </body>
</html>
