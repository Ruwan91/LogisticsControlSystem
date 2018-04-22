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
public class DeliveryView {
    
    private int deliveryid;
    private String driverName;
    private int orderid;
    private String vnumber;
    private String vtype;
    private double charge;
    private String date;
    private String destaddress;
    private double kms;
    private String firstName;
    private String lastName;

    public DeliveryView(int deliveryid, String driverName, int orderid, String vnumber, String vtype, double charge, String date, String destaddress, double kms, String firstName, String lastName) {
        this.deliveryid = deliveryid;
        this.driverName = driverName;
        this.orderid = orderid;
        this.vnumber = vnumber;
        this.vtype = vtype;
        this.charge = charge;
        this.date = date;
        this.destaddress = destaddress;
        this.kms = kms;
        this.firstName = firstName;
        this.lastName = lastName;
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
     * @return the driverName
     */
    public String getDriverName() {
        return driverName;
    }

    /**
     * @param driverName the driverName to set
     */
    public void setDriverName(String driverName) {
        this.driverName = driverName;
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

    /**
     * @return the vnumber
     */
    public String getVnumber() {
        return vnumber;
    }

    /**
     * @param vnumber the vnumber to set
     */
    public void setVnumber(String vnumber) {
        this.vnumber = vnumber;
    }

    /**
     * @return the vtype
     */
    public String getVtype() {
        return vtype;
    }

    /**
     * @param vtype the vtype to set
     */
    public void setVtype(String vtype) {
        this.vtype = vtype;
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
     * @return the kms
     */
    public double getKms() {
        return kms;
    }

    /**
     * @param kms the kms to set
     */
    public void setKms(double kms) {
        this.kms = kms;
    }

    /**
     * @return the firstName
     */
    public String getFirstName() {
        return firstName;
    }

    /**
     * @param firstName the firstName to set
     */
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    /**
     * @return the lastName
     */
    public String getLastName() {
        return lastName;
    }

    /**
     * @param lastName the lastName to set
     */
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

}
