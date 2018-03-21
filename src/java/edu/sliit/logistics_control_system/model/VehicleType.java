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
public class VehicleType {

    private int vtypeid;
    private String type;

    public VehicleType(int vtypeid, String type) {
        this.vtypeid = vtypeid;
        this.type = type;
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
     * @return the type
     */
    public String getType() {
        return type;
    }

    /**
     * @param type the type to set
     */
    public void setType(String type) {
        this.type = type;
    }
}
