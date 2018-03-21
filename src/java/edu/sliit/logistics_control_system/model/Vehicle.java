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
public class Vehicle {
    private int vehicleid;
    private int vtypeid;
    private String vnumber;
    private double fixcharge;
    private double perkm;

    public Vehicle(int vehicleid, int vtypeid, String vnumber, double fixcharge, double perkm) {
        this.vehicleid = vehicleid;
        this.vtypeid = vtypeid;
        this.vnumber = vnumber;
        this.fixcharge = fixcharge;
        this.perkm = perkm;
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
     * @return the vtypeid
     */
    public int getVtypeid() {
        return vtypeid;
    }

    /**
     * @param vtypeid the vtypeid to set
     */
    public void setVtypeid(int vtypeid) {
        this.vtypeid = vtypeid;
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
     * @return the fixcharge
     */
    public double getFixcharge() {
        return fixcharge;
    }

    /**
     * @param fixcharge the fixcharge to set
     */
    public void setFixcharge(double fixcharge) {
        this.fixcharge = fixcharge;
    }

    /**
     * @return the perkm
     */
    public double getPerkm() {
        return perkm;
    }

    /**
     * @param perkm the perkm to set
     */
    public void setPerkm(double perkm) {
        this.perkm = perkm;
    }
}
