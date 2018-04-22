/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Ruwan
 */
public class MySQLConnection {
    
    private static MySQLConnection dbConnection;
    private Connection conn;
    
    //Constructer makes private , loading the driver and  set the connection in side it
    private MySQLConnection () throws SQLException, ClassNotFoundException{
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/logistics", "root", "");
    }
    //Preventing create too many connection and only create one MySQLConnection object and share it 
    public static MySQLConnection getInstance() throws ClassNotFoundException, SQLException {
        if(dbConnection == null){
            dbConnection=new MySQLConnection();
        }
        return dbConnection;
    }
    
    public Connection getConnection(){
        return conn;
    }

}
