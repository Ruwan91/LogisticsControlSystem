/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ruwan
 */
public class Test {

    public static void main(String[] args) {
        try {
            Connection connection1 = MySQLConnection.getInstance().getConnection();
            Statement createStatement = connection1.createStatement();
            int execute = createStatement.executeUpdate("insert into test value(0,'Saman')");
            if (execute > 0) {
                System.out.println("Working well");
            } else {
                System.out.println("NOt working");
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Test.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
