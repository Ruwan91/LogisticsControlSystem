/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.Delivery;
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
public class DeliveryAccess {

    //Insert Delivery
    public boolean addDelivery(Delivery delivery) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getConnection();
        PreparedStatement prepareStatement = connection.prepareStatement("insert into delivery values(?,?,?,?,?,?,?,?)");
        prepareStatement.setInt(1, 0);
        prepareStatement.setInt(2, delivery.getVehicleid());
        prepareStatement.setInt(3, delivery.getDdid());
        prepareStatement.setInt(4, delivery.getDriverid());
        prepareStatement.setDouble(5, delivery.getCharge());
        prepareStatement.setString(6, delivery.getDate());
        prepareStatement.setString(7, delivery.getDestaddress());
        prepareStatement.setInt(8, delivery.getOrderid());

        return 0 < prepareStatement.executeUpdate();
    }

    public ArrayList<Delivery> getAllDeliveryDetails() throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from delivery";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Delivery d = null;
        ArrayList<Delivery> deliverys = new ArrayList<>();
        while (executeQuery.next()) {
            d = new Delivery(executeQuery.getInt(1), executeQuery.getInt(2), executeQuery.getInt(3), executeQuery.getInt(4), executeQuery.getDouble(5), executeQuery.getString(6), executeQuery.getString(7), executeQuery.getInt(8));
            deliverys.add(d);
        }
        return deliverys;
    }
}
