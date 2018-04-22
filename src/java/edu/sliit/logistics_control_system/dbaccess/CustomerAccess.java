/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.Customer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Ruwan
 */
public class CustomerAccess {
    
    public ArrayList<Customer> getAllCustomers() throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from customer";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Customer c = null;
        ArrayList<Customer> customers = new ArrayList<>();
        while (executeQuery.next()) {
            c = new Customer(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getString(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getString(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getDouble(11), executeQuery.getString(12));
            customers.add(c);
        }
        return customers;
    }
    
}
