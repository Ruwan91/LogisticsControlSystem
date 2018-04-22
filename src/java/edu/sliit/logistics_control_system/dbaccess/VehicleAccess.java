/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.Vehicle;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ruwan
 */
public class VehicleAccess {

    public boolean addVehicle(Vehicle vehicle) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        PreparedStatement prepareStatement = connection.prepareStatement("insert into vehicle values(?,?,?,?,?)");
        prepareStatement.setInt(1, 0);
        prepareStatement.setInt(2, vehicle.getVtypeid());
        prepareStatement.setString(3, vehicle.getVnumber());
        prepareStatement.setDouble(4, vehicle.getFixcharge());
        prepareStatement.setDouble(5, vehicle.getPerkm());

        return 0 < prepareStatement.executeUpdate();
    }

    public Vehicle getVehicleByVnumber(String vnumber) throws SQLException, ClassNotFoundException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from vehicle where vnumber='" + vnumber + "'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Vehicle v = null;
        while (executeQuery.next()) {
            v = new Vehicle(executeQuery.getInt(1), executeQuery.getInt(2), executeQuery.getString(3), executeQuery.getDouble(4), executeQuery.getDouble(5));
        }
        return v;
    }

    public ArrayList<Vehicle> getVehicleList() throws SQLException, ClassNotFoundException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from vehicle";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Vehicle v = null;
        ArrayList<Vehicle> vehicles = new ArrayList<>();
        while (executeQuery.next()) {
            v = new Vehicle(executeQuery.getInt(1), executeQuery.getInt(2), executeQuery.getString(3), executeQuery.getDouble(4), executeQuery.getDouble(5));
            if (null != v) {
                vehicles.add(v);
            }
        }
        return vehicles;
    }
    
    public Vehicle getVehicleById(int vid) throws SQLException, ClassNotFoundException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from vehicle where vehicleid='" + vid + "'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Vehicle v = null;
        while (executeQuery.next()) {
            v = new Vehicle(executeQuery.getInt(1), executeQuery.getInt(2), executeQuery.getString(3), executeQuery.getDouble(4), executeQuery.getDouble(5));
        }
        return v;
    }
}
