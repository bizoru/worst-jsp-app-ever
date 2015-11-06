package com.testapp.controller;


import com.testapp.model.Empleado;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {


    static final String DB_URL = "jdbc:mysql://localhost/cti3";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "root";
    private Connection conn;


    public DBManager() throws ClassNotFoundException {


        Statement stmt = null;


        Class.forName("com.mysql.jdbc.Driver");
        try {
            conn = DriverManager.getConnection(DB_URL,USER,PASS);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }


    public List<Empleado> getEmpleados(){

      List<Empleado> results = new ArrayList<>();

        try {

            Statement stmt = this.conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM empleado");
            while(rs.next()){

                Empleado e = new Empleado();
                e.id = rs.getInt("id");
                e.nombre = rs.getString("nombre");
                e.apellido = rs.getString("apellido");
                e.telefono = rs.getString("telefono");
                e.sueldo = rs.getFloat("sueldo");

                results.add(e);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return results;

    }




    public void executeQuery(String query){

        System.out.println("Ejecutando el query: "+query);

        try {
            Statement stmt = this.conn.createStatement();
            stmt.executeUpdate(query);

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }

    public void updateEmpleado(Empleado e){

        String query = "UPDATE empleado SET nombre=?, apellido=? ,telefono=? , sueldo=? WHERE id=?";
        try {

            PreparedStatement preparedStmt = this.conn.prepareStatement(query);
            preparedStmt.setString(1,e.nombre);
            preparedStmt.setString(2,e.apellido);
            preparedStmt.setString(3,e.telefono);
            preparedStmt.setFloat(4,e.sueldo);
            preparedStmt.setInt(5,e.id);
            preparedStmt.execute();

        } catch (SQLException e1) {
            e1.printStackTrace();
        }

    }

    public Empleado getEmpleado(String id){

        Empleado e = new Empleado();
        try {

            Statement stmt = this.conn.createStatement();
            ResultSet rs = stmt.executeQuery("SELECT * FROM empleado where id="+id);
            while(rs.next()){

                e.id = rs.getInt("id");
                e.nombre = rs.getString("nombre");
                e.apellido = rs.getString("apellido");
                e.telefono = rs.getString("telefono");
                e.sueldo = rs.getFloat("sueldo");

                return e;


            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }


        return null;

    }


    public void eliminarEmpleado(String id){


      String query = "DELETE FROM empleado where id="+id;
      executeQuery(query);


    }

    public void insertarEmpleado(Empleado e){

        String query = "INSERT INTO empleado (nombre,apellido,telefono,sueldo) VALUES (?,?,?,?)";
        try {

            PreparedStatement preparedStmt = this.conn.prepareStatement(query);
            preparedStmt.setString(1,e.nombre);
            preparedStmt.setString(2,e.apellido);
            preparedStmt.setString(3,e.telefono);
            preparedStmt.setFloat(4,e.sueldo);

            preparedStmt.execute();

        } catch (SQLException e1) {
            e1.printStackTrace();
        }


    }





}
