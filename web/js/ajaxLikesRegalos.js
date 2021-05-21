/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(document).ready(function(){
 $(".like").click(function () {
                var id = this.id;
                var iduser = document.getElementById("iduser").value;
                var tipolike = "corazones";
                var parametros = {"action": "ControlaLikesRegalos", "id": id, "iduser": iduser, "tipo": tipolike};
                $.ajax({
                    url: 'ajax',
                    data: parametros,
                    beforeSend: function (objeto) {
                    },
                    success: function (data) {
                        window.location.reload();
                    }
                })
            });



            $(".likes").click(function () {
                var id = this.id;
                var iduser = document.getElementById("iduser").value;
                var tipolike = "regalos";                
                var parametros = {"action": "ControlaLikesRegalos", "id": id, "iduser": iduser, "tipo": tipolike};
                $.ajax({
                    url: 'ajax',
                    data: parametros,
                    beforeSend: function (objeto) {
                    },
                    success: function (data) {
                        window.location.reload();
                    }
                })
            });
            
            
            })