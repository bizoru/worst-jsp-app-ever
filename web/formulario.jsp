<%@ page import="com.testapp.model.Empleado" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Modulo de Empleados</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/starter-template.css" rel="stylesheet">

</head>

<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar"
                    aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Modulo Empleados</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="index.jsp">Inicio</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<%
    Empleado e = new Empleado();
    e.nombre = "";
    e.apellido = "";
    e.telefono = "";
    e.sueldo = new Float(0);
    e.id = 0;
    boolean editar = false;

    if (!session.isNew()) {

        try {

            e = (Empleado) session.getAttribute("empleado");
            editar = true;

        } catch (Exception ex) {


        }

    }

%>

<div class="container">

    <div class="starter-template">

        <h1> Creacion de Empleado </h1>

        <form method="post" action="empleados.jsp">

            <% if (editar) {%>
                <input type="hidden" name="id" value="<%= e.id %>">
                <input type="hidden" name="accion" value="actualizar">
            <%}else{%>
                <input type="hidden" name="accion" value="guardar">
            <%}%>


            <div class="form-group">
                <label for="nombre">Nombre</label>
                <input type="text" class="form-control" id="nombre" placeholder="Nombre" name="nombre"
                       value="<%= e.nombre  %>">
            </div>
            <div class="form-group">
                <label for="apellido">Apellido</label>
                <input type="text" class="form-control" id="apellido" placeholder="Apellido" name="apellido"
                       value="<%= e.apellido  %>">
            </div>

            <div class="form-group">
                <label for="telefono">Telefono</label>
                <input type="text" class="form-control" id="telefono" placeholder="Telefono" name="telefono"
                       value="<%= e.telefono  %>">
            </div>

            <div class="form-group">
                <label for="sueldo">Sueldo</label>
                <% if (editar) {%>
                <input type="text" class="form-control" id="sueldo" placeholder="Sueldo" name="sueldo"
                       value="<%= e.sueldo  %>">
                <%} else {%>
                <input type="text" class="form-control" id="sueldo" placeholder="Sueldo" name="sueldo" value="">
                <%}%>
            </div>


            <button type="submit" class="btn btn-default">Guardar</button>
        </form>


    </div>

</div>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</body>
</html>

