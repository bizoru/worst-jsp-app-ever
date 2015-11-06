<%@ page import="com.testapp.model.Empleado" %>
<%@ page import="java.util.List" %>
<%@ page import="com.testapp.controller.Router" %>
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

<div class="container">

    <div class="starter-template">

        <h1> Lista de Empleados </h1>

        <jsp:useBean id="db" class="com.testapp.controller.DBManager"/>
        <% session.invalidate(); %>
        <% List empleados = db.getEmpleados(); %>


        <%if(empleados.size() == 0){%>
            <div class="alert alert-info" role="alert"> No existen empleados registrados !</div>
        <%}else{%>

        <table class="table table-hover">
            <thead>
            <tr>
                <th>Nombre</th>
                <th>Apellido</th>
                <th>Telefono</th>
                <th>Sueldo</th>
                <th>Acciones</th>

            </tr>
            </thead>

            <tbody>

            <% for (int i = 0; i < empleados.size(); i++) { %>
                <% Empleado e = (Empleado) empleados.get(i); %>

                <tr>
                    <td><%= e.nombre %></td>
                    <td><%= e.apellido %></td>
                    <td><%= e.telefono %></td>
                    <td><%= e.sueldo %></td>
                    <td>
                        <a href="empleados.jsp?accion=editar&id=<%= e.id %>" class="btn btn-default btn-lg btn-sm" role="button">Editar</a>
                        <a href="empleados.jsp?accion=eliminar&id=<%= e.id %>" class="btn btn-default btn-lg btn-sm" role="button">Eliminar</a>
                    </td>
                </tr>
            <% }%>
            </tbody>
        </table>
        <%}%>
        <div class="btn-group" role="group" aria-label="...">
            <a href="formulario.jsp" class="btn btn-default btn-lg btn-sm" role="button">Agregar Empleado</a>
        </div>

    </div>

</div>


<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>


</body>
</html>

