<%-- 
    Document   : 404
    Created on : 01-11-2023, 12:11:43
    Author     : Roberto Vargas <robertoignaciovargas@gmail.com>
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8" />
        <title>404 - SmartGarden</title>
        <meta name="description" content="SmartGarden, una solución IoT para tus plantas" />
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <c:import url="styles.html" />
    </head>
    <body>
        <div class="app" id="app">

            <!-- ############ LAYOUT START-->

            <div class="app-footer white">
                <div class="p-2 text-xs">
                    <div class="pull-right text-muted py-1">
                        &copy; Copyright <strong>SmartGarden</strong> <span class="hidden-xs-down">- IPST Arica - 2023</span>
                        <a ui-scroll-to="content"><i class="fa fa-long-arrow-up p-x-sm"></i></a>
                    </div>
                    <div class="nav">
                        <a class="nav-link" href="#">Acerca de</a>
                        <a class="nav-link" href="https://github.com/ElectroRabbit/smartgarden">Descargar</a>
                    </div>
                </div>

            </div>
            <div class="app-body amber bg-auto w-full">
                <div class="text-center pos-rlt p-y-md">
                    <h1 class="text-shadow m-0 text-white text-4x">
                        <span class="text-2x font-bold block m-t-lg">Acceso no autorizado</span>
                    </h1>
                    <h2 class="h1 m-y-lg text-black">OOPS!</h2>
                    <p class="h5 m-y-lg text-u-c font-bold text-black">No tiene permitido ver esta página.</p>
                    <a href="signin.jsp" class="md-btn amber-700 md-raised p-x-md">
                        <span class="text-white">Ir a la página de inicio</span>
                    </a>
                </div>
            </div>

            <!-- ############ LAYOUT END-->

        </div>
        
        <c:import url="scripts.html" />
        
    </body>
</html>