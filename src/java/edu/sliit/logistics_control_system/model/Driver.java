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
public class Driver {
    private int driverid;
    private String name;
    private String address;
    private String nic;
    private String licenseno;
    private String contact;

    /**
     * @return the driverid
     */
    public int getDriverid() {
        return driverid;
    }

    public Driver(int driverid, String name, String address, String nic, String licenseno, String contact) {
        this.driverid = driverid;
        this.name = name;
        this.address = address;
        this.nic = nic;
        this.licenseno = licenseno;
        this.contact = contact;
    }

    /**
     * @param driverid the driverid to set
     */
    public void setDriverid(int driverid) {
        this.driverid = driverid;
    }

    /**
     * @return the name
     */
    public String getName() {
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * @return the address
     */
    public String getAddress() {
        return address;
    }

    /**
     * @param address the address to set
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * @return the nic
     */
    public String getNic() {
        return nic;
    }

    /**
     * @param nic the nic to set
     */
    public void setNic(String nic) {
        this.nic = nic;
    }

    /**
     * @return the licenseno
     */
    public String getLicenseno() {
        return licenseno;
    }

    /**
     * @param licenseno the licenseno to set
     */
    public void setLicenseno(String licenseno) {
        this.licenseno = licenseno;
    }

    /**
     * @return the contact
     */
    public String getContact() {
        return contact;
    }

    /**
     * @param contact the contact to set
     */
    public void setContact(String contact) {
        this.contact = contact;
    }
}
