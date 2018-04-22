/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.dbaccess;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import edu.sliit.logistics_control_system.model.Delivery;
import edu.sliit.logistics_control_system.model.DeliveryView;
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
        Connection connection = MySQLConnection.getInstance().getConnection();
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
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "Select * from delivery order by deliveryid desc";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        Delivery d = null;
        ArrayList<Delivery> deliverys = new ArrayList<>();
        while (executeQuery.next()) {
            d = new Delivery(executeQuery.getInt(1), executeQuery.getInt(2), executeQuery.getInt(3), executeQuery.getInt(4), executeQuery.getDouble(5), executeQuery.getString(6), executeQuery.getString(7), executeQuery.getInt(8));
            deliverys.add(d);
        }
        return deliverys;
    }

    public ArrayList<DeliveryView> getAllDeliveryDetailsByVehicleNumber(String vnumber) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and ve.vnumber='" + vnumber + "'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }

    public ArrayList<DeliveryView> getAllDeliveryDetailsByDriverId(int driverid) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and d.driverid=" + driverid ;
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }

    public ArrayList<DeliveryView> getAllDeliveryDetailsByDate(String date) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and de.date='" + date + "'";
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }

    public ArrayList<DeliveryView> getDeliveryDetailsByDeliveryId(int deliveryid) throws ClassNotFoundException, SQLException {
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and de.deliveryid=" + deliveryid ;
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }

    public ArrayList<DeliveryView> getDeliveryDetailsByOrderId(int searchorderId) throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and o.orderid=" + searchorderId ;
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }
    
    public ArrayList<DeliveryView> getDeliveryDetailsByCustomerId(int customerId) throws SQLException, ClassNotFoundException{
        Connection connection = MySQLConnection.getInstance().getConnection();
        Statement createStatement = connection.createStatement();
        String sql = "select de.deliveryid,d.name,o.orderid,ve.vnumber,vt.type,de.charge,de.date,de.destaddress,dd.kms,c.firstname,c.lastname from delivery de,driver d,vehicle ve,vehicletype vt,deliverydistance dd, customer c, order2 o where de.vehicleid=ve.vehicleid and d.driverid=de.driverid and ve.vtypeid=vt.vtypeid and dd.ddid=de.ddid and c.custid=o.custid and o.orderid=de.orderid and c.custid=" + customerId ;
        ResultSet executeQuery = createStatement.executeQuery(sql);
        DeliveryView dv = null;
        ArrayList<DeliveryView> deliveryViewList = new ArrayList<>();
        while (executeQuery.next()) {
            dv = new DeliveryView(executeQuery.getInt(1), executeQuery.getString(2), executeQuery.getInt(3), executeQuery.getString(4), executeQuery.getString(5), executeQuery.getDouble(6), executeQuery.getString(7), executeQuery.getString(8), executeQuery.getDouble(9), executeQuery.getString(10), executeQuery.getString(11));
            deliveryViewList.add(dv);
        }
        return deliveryViewList;
    }
}
