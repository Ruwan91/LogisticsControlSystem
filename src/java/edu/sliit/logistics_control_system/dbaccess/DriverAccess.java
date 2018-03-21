/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.Driver;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Ruwan
 */
public class DriverAccess {
    
    //Insert Driver details
    public boolean addDriver(Driver driver) throws ClassNotFoundException, SQLException{
        Connection connection = MySQLConnection.getConnection();
        PreparedStatement prepareStatement = connection.prepareStatement("insert into driver values(?,?,?,?,?,?)");
        prepareStatement.setInt(1,0);
        prepareStatement.setString(2,driver.getName());
        prepareStatement.setString(3,driver.getAddress());
        prepareStatement.setString(4,driver.getNic());
        prepareStatement.setString(5,driver.getLicenseno());
        prepareStatement.setString(6,driver.getContact());
        
        return 0 < prepareStatement.executeUpdate();
    }
    
    public Driver getDiverByDriverId(int driverid) throws ClassNotFoundException, SQLException{
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql="select * from driver where driverid='"+driverid+"'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Driver d=null;
        while (executeQuery.next()) {
            d=new Driver(executeQuery.getInt(1), executeQuery.getString(2),executeQuery.getString(3),executeQuery.getString(4),executeQuery.getString(5),executeQuery.getString(6));
        }
        return d;
    }
}
