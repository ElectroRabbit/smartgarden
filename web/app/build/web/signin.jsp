<%-- 
    Document   : index
    Created on : 20-10-2023, 23:15:10
    Author     : Roberto Vargas
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>Iniciar sesión - SmartGarden</title>
        <meta name="description" content="SmartGarden, una solución IoT para tus plantas" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="icon" type="image/png" href="assets/images/logo_sg.png"/>
        
        <c:import url="styles.html" />
    </head>
    <body style="background-image: url(assets/images/bg-login2.jpg); background-size: cover;">
        <div class="app" id="app">

            <!-- ############ LAYOUT START-->
            <div class="center-block w-xxl w-auto-xs p-y-md">

                <div class="p-a-md box-color r box-shadow-z1 text-color m-a">
                    <div class="m-b text-sm text-center">
                        <img src="assets/images/logo_sg.png" width="30%" alt="SG Logo"><br/>
                        <h3 class="font-weight-normal">Iniciar Sesión</h3><br/>
                    </div>

                    <form name="form" method="POST" action="mainController.do">
                        <div class="md-form-group float-label">
                            <input type="email" name="email" class="md-input" required>
                            <label>Correo electrónico</label>
                        </div>
                        <div class="md-form-group float-label">
                            <input type="password" name="password" class="md-input" required>
                            <label>Contraseña</label>
                        </div>
                        <div class="m-b-md">        
                            <label class="md-check">
                                <input type="checkbox"><i class="primary"></i> Mantener sesión iniciada
                            </label>
                        </div>
                        <input type="text" name="accion" value="sign-in" required hidden="true">
                        <button type="submit" class="btn primary btn-block p-x-md">Iniciar Sesión</button>
                    </form>
                    
                    <br/>
                    
                    <div class="p-v-lg text-center">
                        <div class="m-b"><a href="#" class="text-primary _600">¿Contraseña olvidada?</a></div>
                        <div>¿No tienes cuenta? <a href="signup.jsp" class="text-primary _600">Registrate aquí</a></div>
                    </div>

                </div>



            </div>

            <!-- ############ LAYOUT END-->

        </div>        
        <c:import url="scripts.html" />
        <c:if test="${not empty mensaje}">
            <script>
                $(function () {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "newestOnTop": true,
                        "progressBar": true,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.info("${mensaje}", "${tituloMensaje}")
                });
            </script>
        </c:if>
        <c:if test="${not empty error}">
            <script>
                $(function () {
                    toastr.options = {
                        "closeButton": true,
                        "debug": false,
                        "newestOnTop": true,
                        "progressBar": true,
                        "positionClass": "toast-top-right",
                        "preventDuplicates": true,
                        "onclick": null,
                        "showDuration": "300",
                        "hideDuration": "1000",
                        "timeOut": "5000",
                        "extendedTimeOut": "1000",
                        "showEasing": "swing",
                        "hideEasing": "linear",
                        "showMethod": "fadeIn",
                        "hideMethod": "fadeOut"
                    }
                    toastr.error("${error}", "${tituloMensaje}")
                });
            </script>
        </c:if>        
    </body>
</html>