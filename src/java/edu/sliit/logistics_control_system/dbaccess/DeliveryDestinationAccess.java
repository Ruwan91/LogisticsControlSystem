/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.DeliveryDestination;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ruwan
 */
public class DeliveryDestinationAccess {
    
    //Get all Delivery Destination when give Delivery Destination Name
    public DeliveryDestination getDeliveryDestinationByName(String ddName) throws ClassNotFoundException, SQLException{
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql="select * from deliverydistance where destination='"+ddName+"'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryDestination dd=null;
        
        while (executeQuery.next()) {
            dd=new DeliveryDestination(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getDouble(3));
        }
        return dd;
    }
    
    //Get all Delivery Destinations
    public ArrayList<DeliveryDestination> getAllDeliveryDestinations() throws ClassNotFoundException, SQLException{
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql="select * from deliverydistance";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryDestination dd=null;
        ArrayList<DeliveryDestination> deliveryDestinationList=new ArrayList<>();
        while (executeQuery.next()) {
            dd=new DeliveryDestination(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getDouble(3));
            deliveryDestinationList.add(dd);
        }
        return deliveryDestinationList;
    }
    
    public DeliveryDestination getAllDeliveryDestinationBYDeliveryDestinationId(int ddid) throws ClassNotFoundException, SQLException{
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql="select * from deliverydistance where ddid='"+ddid+"'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryDestination dd=null;
        while (executeQuery.next()) {
            dd=new DeliveryDestination(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getDouble(3));
        }
        return dd;
    }
}
