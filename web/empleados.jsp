<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.testapp.controller.DBManager" %>
<%@ page import="com.testapp.model.Empleado" %>

<%

    String id = request.getParameter("id");
    String accion = request.getParameter("accion").toLowerCase();

    System.out.print(accion);

    DBManager db = new DBManager();


    if (accion.equals("eliminar")) {

       System.out.print("accion de eliminar");
       db.eliminarEmpleado(id);
        response.sendRedirect("index.jsp");


    }

    if (accion.equals("editar")) {

        Empleado e = db.getEmpleado(id);

        if(!e.equals(null)){


            response.sendRedirect("formulario.jsp");
            session.setAttribute("empleado",e);

        }

        System.out.print("accion de editar");

    }

    if(accion.equals("guardar")){

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String sueldo = request.getParameter("sueldo");


        Empleado e = new Empleado();
        e.nombre = nombre;
        e.apellido = apellido;
        e.telefono = telefono;
        e.sueldo = Float.parseFloat(sueldo);


        session.invalidate();
        db.insertarEmpleado(e);
        response.sendRedirect("index.jsp");


    }



    if(accion.equals("actualizar")){

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String telefono = request.getParameter("telefono");
        String sueldo = request.getParameter("sueldo");


        Empleado e = new Empleado();
        e.nombre = nombre;
        e.apellido = apellido;
        e.telefono = telefono;
        e.sueldo = Float.parseFloat(sueldo);
        e.id = Integer.parseInt(id);

        session.invalidate();
        db.updateEmpleado(e);
        response.sendRedirect("index.jsp");

    }




%>