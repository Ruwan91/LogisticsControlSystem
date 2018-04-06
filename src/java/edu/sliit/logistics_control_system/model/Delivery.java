/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.model;

/**
 *
 * @author Ruwan
 */
public class Delivery {

    private int deliveryid;
    private int vehicleid;
    private int ddid;
    private int driverid;
    private double charge;
    private String date;
    private String destaddress;
    private int orderid;

    public Delivery(int deliveryid, int vehicleid, int ddid, int driverid, double charge, String date, String destaddress, int orderid) {
        this.deliveryid = deliveryid;
        this.vehicleid = vehicleid;
        this.ddid = ddid;
        this.driverid = driverid;
        this.charge = charge;
        this.date = date;
        this.destaddress = destaddress;
        this.orderid = orderid;
    }

    /**
     * @return the deliveryid
     */
    public int getDeliveryid() {
        return deliveryid;
    }

    /**
     * @param deliveryid the deliveryid to set
     */
    public void setDeliveryid(int deliveryid) {
        this.deliveryid = deliveryid;
    }

    /**
     * @return the vehicleid
     */
    public int getVehicleid() {
        return vehicleid;
    }

    /**
     * @param vehicleid the vehicleid to set
     */
    public void setVehicleid(int vehicleid) {
        this.vehicleid = vehicleid;
    }

    /**
     * @return the ddid
     */
    public int getDdid() {
        return ddid;
    }

    /**
     * @param ddid the ddid to set
     */
    public void setDdid(int ddid) {
        this.ddid = ddid;
    }

    /**
     * @return the driverid
     */
    public int getDriverid() {
        return driverid;
    }

    /**
     * @param driverid the driverid to set
     */
    public void setDriverid(int driverid) {
        this.driverid = driverid;
    }

    /**
     * @return the charge
     */
    public double getCharge() {
        return charge;
    }

    /**
     * @param charge the charge to set
     */
    public void setCharge(double charge) {
        this.charge = charge;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the destaddress
     */
    public String getDestaddress() {
        return destaddress;
    }

    /**
     * @param destaddress the destaddress to set
     */
    public void setDestaddress(String destaddress) {
        this.destaddress = destaddress;
    }

    /**
     * @return the orderid
     */
    public int getOrderid() {
        return orderid;
    }

    /**
     * @param orderid the orderid to set
     */
    public void setOrderid(int orderid) {
        this.orderid = orderid;
    }
}
