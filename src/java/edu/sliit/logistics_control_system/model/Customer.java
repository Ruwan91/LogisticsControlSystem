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
public class Customer {

    private int custid;
    private String title;
    private String firstName;
    private String lastName;
    private String nid;
    private String address;
    private String tp;
    private String email;
    private double fee;
    private String expireDate;
    private double seqdip;
    private String classfication;

    public Customer(int custid, String title, String firstName, String lastName, String nid, String address, String tp, String email, double fee, String expireDate, double seqdip, String classfication) {
        this.custid = custid;
        this.title = title;
        this.firstName = firstName;
        this.lastName = lastName;
        this.nid = nid;
        this.address = address;
        this.tp = tp;
        this.email = email;
        this.fee = fee;
        this.expireDate = expireDate;
        this.seqdip = seqdip;
        this.classfication = classfication;
    }
    
    

    /**
     * @return the custid
     */
    public int getCustid() {
        return custid;
    }

    /**
     * @param custid the custid to set
     */
    public void setCustid(int custid) {
        this.custid = custid;
    }

    /**
     * @return the title
     */
    public String getTitle() {
        return title;
    }

    /**
     * @param title the title to set
     */
    public void setTitle(String title) {
        this.title = title;
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

    /**
     * @return the nid
     */
    public String getNid() {
        return nid;
    }

    /**
     * @param nid the nid to set
     */
    public void setNid(String nid) {
        this.nid = nid;
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
     * @return the tp
     */
    public String getTp() {
        return tp;
    }

    /**
     * @param tp the tp to set
     */
    public void setTp(String tp) {
        this.tp = tp;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the fee
     */
    public double getFee() {
        return fee;
    }

    /**
     * @param fee the fee to set
     */
    public void setFee(double fee) {
        this.fee = fee;
    }

    /**
     * @return the expireDate
     */
    public String getExpireDate() {
        return expireDate;
    }

    /**
     * @param expireDate the expireDate to set
     */
    public void setExpireDate(String expireDate) {
        this.expireDate = expireDate;
    }

    /**
     * @return the seqdip
     */
    public double getSeqdip() {
        return seqdip;
    }

    /**
     * @param seqdip the seqdip to set
     */
    public void setSeqdip(double seqdip) {
        this.seqdip = seqdip;
    }

    /**
     * @return the classfication
     */
    public String getClassfication() {
        return classfication;
    }

    /**
     * @param classfication the classfication to set
     */
    public void setClassfication(String classfication) {
        this.classfication = classfication;
    }

}
