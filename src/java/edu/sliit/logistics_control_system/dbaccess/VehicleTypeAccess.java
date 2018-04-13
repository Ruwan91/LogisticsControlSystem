/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.VehicleType;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ruwan
 */
public class VehicleTypeAccess {

    //Retriving all vehicle types
    public ArrayList<VehicleType> getAllVehicleTypes() throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select * from vehicletype";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        VehicleType vt = null;
        ArrayList<VehicleType> vehicleTypeList = new ArrayList<>();
        while (executeQuery.next()) {
            vt = new VehicleType(executeQuery.getInt(1), executeQuery.getString(2));
            vehicleTypeList.add(vt);
        }
        return vehicleTypeList;
    }

    public VehicleType getVehicleTypeBYVTypeName(String vtypeName) throws SQLException, ClassNotFoundException {
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select * from vehicletype where type='" + vtypeName + "'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        VehicleType vt = null;
        while (executeQuery.next()) {
            vt = new VehicleType(executeQuery.getInt(1), executeQuery.getString(2));
        }
        return vt;
    }
}
