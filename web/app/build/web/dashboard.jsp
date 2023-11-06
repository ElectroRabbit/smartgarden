<%-- 
    Document   : dashboard
    Created on : 20-10-2023, 22:56:19
    Author     : Roberto Vargas
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<fmt:formatDate value="${datos[14].fechaDato}" pattern="HH:mm dd/MM/YY" var="fechaAct" />
<c:if test="${not empty sessionScope.userAcc}">
    <c:if test="${not empty datos}">
        <!DOCTYPE html>
        <html lang="es">
            <head>
                <meta charset="utf-8" />
                <title>Inicio - SmartGarden</title>
                <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, minimal-ui" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <link rel="icon" type="image/png" href="assets/images/logo_sg.png"/>

                <c:import url="styles.html" />
            </head>
            <body class="pace-done dark" ui-class="dark">
                <div class="app" id="app">

                    <!-- ############ LAYOUT START ############ -->

                    <!-- aside -->
                    <div id="aside" class="app-aside modal nav-dropdown">
                        <!-- fluid app aside -->
                        <div class="left navside dark dk" data-layout="column">
                            <div class="navbar no-radius">
                                <!-- brand -->
                                <a class="navbar-brand">
                                    <!-- <div ui-include="'assets/images/logo.svg'"></div> -->
                                    <img src="assets/images/logo_sg.png" alt="Logo SG">
                                    <span class="hidden-folded inline">SmartGarden</span>
                                </a>
                                <!-- / brand -->
                            </div>
                            <div class="hide-scroll" data-flex>
                                <nav class="scroll nav-light">

                                    <ul class="nav" ui-nav>
                                        <li class="nav-header hidden-folded">
                                            <small class="text-muted">Menú</small>
                                        </li>

                                        <li>
                                            <a href="index.jsp">
                                                <span class="nav-icon">
                                                    <i class="material-icons">&#xe871;
                                                    </i>
                                                </span>
                                                <span class="nav-text">Dashboard</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="nav-icon">
                                                    <i class="material-icons">&#xe62b;
                                                    </i>
                                                </span>
                                                <span class="nav-text">Dispositivos</span>
                                            </a>
                                        </li>

                                        <li class="nav-header hidden-folded">
                                            <small class="text-muted">Configuración</small>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="nav-icon">
                                                    <i class="material-icons">&#xe851;
                                                    </i>
                                                </span>
                                                <span class="nav-text">Mi Cuenta</span>
                                            </a>
                                        </li>

                                        <li>
                                            <a href="#">
                                                <span class="nav-icon">
                                                    <i class="material-icons">&#xe868;
                                                    </i>
                                                </span>
                                                <span class="nav-text">Reportar un bug</span>
                                            </a>
                                        </li>

                                        <li class="nav-header hidden-folded">
                                            <small class="text-muted">Descargas</small>
                                        </li>

                                        <li>
                                            <a target="_blank" href="https://github.com/ElectroRabbit/smartgarden">
                                                <span class="nav-icon">
                                                    <i class="material-icons">&#xe2c0;
                                                    </i>
                                                </span>
                                                <span class="nav-text">Obtener</span>
                                            </a>
                                        </li>

                                        <li class="nav-header hidden-folded">
                                            <small class="text-muted">&copy; SmartGarden - 2023</small>
                                        </li>

                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                    <!-- / -->

                    <!-- content -->
                    <div id="content" class="app-content box-shadow-z0" role="main">
                        <div class="app-header white box-shadow">
                            <div class="navbar navbar-toggleable-sm flex-row align-items-center">
                                <!-- Open side - Naviation on mobile -->
                                <a data-toggle="modal" data-target="#aside" class="hidden-lg-up mr-3">
                                    <i class="material-icons">&#xe5d2;</i>
                                </a>
                                <!-- / -->

                                <!-- Page title - Bind to $state's title -->
                                <div class="mb-0 h5 no-wrap" id="pageTitle"></div>

                                <!-- navbar right -->
                                <ul class="nav navbar-nav ml-auto flex-row">
                                    <li class="nav-item dropdown">

                                        <a class="nav-link p-0" href="#" data-toggle="dropdown">
                                            <span class="avatar w-32">
                                                <img src="assets/images/a0.jpg" alt="...">
                                                <i class="on b-white bottom"></i>
                                            </span>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-overlay pull-right">
                                            <a class="dropdown-item" href="#">
                                                <span>Mi cuenta</span>
                                            </a>
                                            <div class="dropdown-divider"></div>
                                            <a href="logoutController.do" class="dropdown-item">Cerrar sesión</a>
                                        </div>

                                    </li>
                                </ul>
                                <!-- / navbar right -->
                            </div>
                        </div>
                        <div class="app-footer">
                            <div class="p-2 text-xs">
                                <div class="pull-right text-muted py-1">
                                    &copy; Copyright <strong>SmartGarden</strong> <span class="hidden-xs-down">- IPST Arica - 2023</span>
                                    <a ui-scroll-to="content"><i class="fa fa-long-arrow-up p-x-sm"></i></a>
                                </div>
                            </div>
                        </div>

                        <div ui-view class="app-body" id="view">

                            <!-- ############ PAGE START ############ -->
                            <div class="p-a white lt box-shadow">
                                <div class="row">
                                    <div class="col-sm-6">
                                        <h4 class="mb-0 _300">Bienvenid@ ${userAcc.nombreUsuario}</h4>
                                        <small class="text-muted">¿Sabes cómo está tu planta hoy?</small>
                                    </div>
                                    <div class="col-sm-6 text-sm-right">
                                        <div class="m-y-sm">
                                            <span class="m-r-sm">Dispositivo:</span>
                                            <div class="btn-group dropdown">
                                                <button class="btn white btn-sm">#1</button>
                                                <button class="btn white btn-sm dropdown-toggle" data-toggle="dropdown"></button>
                                                <div class="dropdown-menu dropdown-menu-scale pull-right">
                                                    <a class="dropdown-item" href="#">#2</a>
                                                    <div class="dropdown-divider"></div>
                                                    <a class="dropdown-item" href="#">Gestionar dispositivos</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="padding">

                                <div class="row">

                                    <div class="col-sm-3 col-md-3">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Temperatura Ambiente</h3>
                                                <small id="lastUpT">Última actualización: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="background-image: url(assets/images/temperatura.png); background-size: cover; background-repeat: no-repeat;" class="box-body text-center b-t">
                                                <div class="row-col">
                                                    <div class="row-cell p-a">
                                                        <div class="inline m-b">
                                                            <div>
                                                                <h1 id="temperatura" class="display-2 text-white font-weight-normal">${datos[14].temperaturaAmbiente}°C</h1>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <br/>
                                                            <span class="text-center">
                                                                <span id="msgTemp" class="text-white">...</span>      
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-3 col-md-3">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Humedad Ambiente</h3>
                                                <small id="lastUpHA">Última actualización: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="background-image: url(assets/images/humedadA.jpg); background-size: cover; background-repeat: no-repeat;" class="box-body text-center b-t">
                                                <div class="row-col">
                                                    <div class="row-cell p-a">
                                                        <div class="inline m-b">
                                                            <div>
                                                                <h1 id="humedadAmb" class="display-2 text-white font-weight-normal">${datos[14].humedadAmbiente}%</h1>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <br/>
                                                            <span class="text-center">
                                                                <span id="msgHuA" class="text-white">...</span>      
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-3 col-md-3">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Humedad Suelo</h3>
                                                <small id="lastUpHS">Última actualización: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="background-image: url(assets/images/humedadT.jpg); background-size: cover; background-repeat: no-repeat;" class="box-body text-center b-t">
                                                <div class="row-col">
                                                    <div class="row-cell p-a">
                                                        <div class="inline m-b">
                                                            <div>
                                                                <h1 id="humedadSuelo" class="display-2 text-white font-weight-normal">
                                                                    <c:if test="${datos[14].humedadSuelo <= 30}">
                                                                        Seco
                                                                    </c:if>
                                                                    <c:if test="${datos[14].humedadSuelo > 30}">
                                                                        OK
                                                                    </c:if>
                                                                </h1>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <br/>
                                                            <span class="text-center">
                                                                <span id="msgHuT" class="text-white">...</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-sm-3 col-md-3">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Nivel de Agua</h3>
                                                <small id="lastUpA">Última actualización: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div style="background-image: url(assets/images/nivelA.jpg); background-size: cover; background-repeat: no-repeat;" class="box-body text-center b-t">
                                                <div class="row-col">
                                                    <div class="row-cell p-a">
                                                        <div class="inline m-b">
                                                            <div>
                                                                <h1 id="nivelAgua" class="display-2 text-white font-weight-normal">${datos[14].nivelAgua}%</h1>
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <br/>
                                                            <span class="text-center">
                                                                <span id="msgAgua" class="text-white">...</span>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div>                        

                                <div class="row">

                                    <div class="col-sm-12 col-md-12">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Temperatura Ambiente</h3>                                        
                                                <small>Último registro: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="box-body">
                                                <div ui-jp="chart" ui-options="{
                                                     tooltip : {
                                                     trigger: 'axis'
                                                     },
                                                     legend: {
                                                     data:['Temperatura Ambiente (°C)']
                                                     },
                                                     calculable : true,
                                                     xAxis : [
                                                     {
                                                     type : 'category',
                                                     boundaryGap : false,
                                                     data : [
                                                     <c:forEach items="${datos}" var="d">
                                                         <fmt:formatDate value="${d.fechaDato}" pattern="HH:mm dd/MM" var="fechaFormateada" />
                                                         '${fechaFormateada}',
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ],
                                                     yAxis : [
                                                     {
                                                     type : 'value'
                                                     }
                                                     ],
                                                     series : [
                                                     {
                                                     name:'Temperatura Ambiente (°C)',
                                                     type:'line',
                                                     smooth:true,
                                                     itemStyle: {normal: {areaStyle: {type: 'default'}}},
                                                     data:[
                                                     <c:forEach items="${datos}" var="d">
                                                         ${d.temperaturaAmbiente},
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ]

                                                     }" style="height:300px" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end ROW -->

                                <div class="row">

                                    <div class="col-sm-12 col-md-12">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Humedad Ambiente</h3>
                                                <small>Último registro: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="box-body">
                                                <div ui-jp="chart" ui-options="{
                                                     tooltip : {
                                                     trigger: 'axis'
                                                     },
                                                     legend: {
                                                     data:['Humedad Ambiente (%)']
                                                     },
                                                     calculable : true,
                                                     xAxis : [
                                                     {
                                                     type : 'category',
                                                     boundaryGap : false,
                                                     data : [
                                                     <c:forEach items="${datos}" var="d">
                                                         <fmt:formatDate value="${d.fechaDato}" pattern="HH:mm dd/MM" var="fechaFormateada" />
                                                         '${fechaFormateada}',
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ],
                                                     yAxis : [
                                                     {
                                                     type : 'percentage'
                                                     }
                                                     ],
                                                     series : [
                                                     {
                                                     name:'Humedad Ambiente (%)',
                                                     type:'line',
                                                     smooth:true,
                                                     itemStyle: {normal: {color: '#e79eff', areaStyle: {type: 'default'}}},
                                                     data:[
                                                     <c:forEach items="${datos}" var="d">
                                                         ${d.humedadAmbiente},
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ]

                                                     }" style="height:300px" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end ROW -->

                                <div class="row">

                                    <div class="col-sm-12 col-md-12">
                                        <div class="box dker">
                                            <div class="box-header">
                                                <h3>Humedad Suelo</h3>
                                                <small>Último registro: ${fechaAct}</small>
                                            </div>
                                            <div class="box-tool">
                                                <ul class="nav">
                                                    <li class="nav-item inline">
                                                        <a class="nav-link">
                                                            <i class="material-icons md-18">&#xe863;</i>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="box-body">
                                                <div ui-jp="chart" ui-options="{
                                                     tooltip : {
                                                     trigger: 'axis'
                                                     },
                                                     legend: {
                                                     data:['Humedad Suelo (-)']
                                                     },
                                                     calculable : true,
                                                     xAxis : [
                                                     {
                                                     type : 'category',
                                                     boundaryGap : false,
                                                     data : [
                                                     <c:forEach items="${datos}" var="d">
                                                         <fmt:formatDate value="${d.fechaDato}" pattern="HH:mm dd/MM" var="fechaFormateada" />
                                                         '${fechaFormateada}',
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ],
                                                     yAxis : [
                                                     {
                                                     type : 'percentage'
                                                     }
                                                     ],
                                                     series : [
                                                     {
                                                     name:'Humedad Suelo (-)',
                                                     type:'line',
                                                     smooth:true,
                                                     itemStyle: {normal: {color: '#a3ffac', areaStyle: {type: 'default'}}},
                                                     data:[
                                                     <c:forEach items="${datos}" var="d">
                                                         ${d.humedadSuelo},
                                                     </c:forEach>
                                                     ]
                                                     }
                                                     ]

                                                     }" style="height:300px" >
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </div><!-- end ROW -->

                            </div><!-- end PADDING -->

                            <!-- ############ PAGE END-->

                        </div>
                    </div>
                    <!-- / -->

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
                            toastr.success("${mensaje}", "${tituloMensaje}")
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
                            // Display an info toast with no title
                            toastr.error("${error}", "${tituloMensaje}")
                        });
                    </script>
                </c:if>
                <!-- endbuild -->

            </body>
        </html>
    </c:if>
    <c:if test="${empty datos}">
        <c:redirect url="mainController.do" />
    </c:if>
</c:if>
<c:if test="${empty sessionScope.userAcc}">
    <c:redirect url="signin.jsp" />
</c:if>