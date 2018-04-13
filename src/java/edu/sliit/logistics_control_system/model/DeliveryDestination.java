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
public class DeliveryDestination {

    private int ddid;
    private String destination;
    private double kms;

    public DeliveryDestination(int ddid, String destination, double kms) {
        this.ddid = ddid;
        this.destination = destination;
        this.kms = kms;
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
     * @return the destination
     */
    public String getDestination() {
        return destination;
    }

    /**
     * @param destination the destination to set
     */
    public void setDestination(String destination) {
        this.destination = destination;
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
}
