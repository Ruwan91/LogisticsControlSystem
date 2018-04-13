/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.DeliveryAccess;
import edu.sliit.logistics_control_system.dbaccess.DeliveryDestinationAccess;
import edu.sliit.logistics_control_system.dbaccess.DriverAccess;
import edu.sliit.logistics_control_system.dbaccess.VehicleAccess;
import edu.sliit.logistics_control_system.model.Delivery;
import edu.sliit.logistics_control_system.model.DeliveryDestination;
import edu.sliit.logistics_control_system.model.Driver;
import edu.sliit.logistics_control_system.model.Vehicle;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ruwan
 */
public class SearchedAllDeliveryDetail extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            DeliveryAccess da = new DeliveryAccess();
            ArrayList<Delivery> allDeliveryDetails = null;
            try {
                allDeliveryDetails = da.getAllDeliveryDetails();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(SearchedAllDeliveryDetail.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (allDeliveryDetails != null) {
                out.print("<table class=\"table table-striped table-hover\" >");
                out.print("<thead class=\"thead-dark\">");
                out.print("<tr>");
                out.print("<th scope=\"col\">");
                out.print("Delivery Id");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Vehicle Id");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Delivery Distance");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Driver Name");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Date");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Charge(Rs.)");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Destination Address");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Order Id");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                for (Delivery d : allDeliveryDetails) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(d.getDeliveryid());
                    out.print("</td>");
                    out.print("<td>");
                    VehicleAccess va = new VehicleAccess();
                    Vehicle v = null;
                    try {
                        v = va.getVehicleById(d.getVehicleid());
                    } catch (SQLException | ClassNotFoundException ex) {
                        Logger.getLogger(SearchedAllDeliveryDetail.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (v != null) {
                        out.print(v.getVnumber());
                    }
                    out.print("</td>");
                    out.print("<td>");
                    DeliveryDestinationAccess dda = new DeliveryDestinationAccess();
                    DeliveryDestination deliveryDestination = null;
                    try {
                        deliveryDestination = dda.getAllDeliveryDestinationBYDeliveryDestinationId(d.getDdid());
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(SearchedAllDeliveryDetail.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (deliveryDestination != null) {
                        out.print(deliveryDestination.getDestination() + " - " + deliveryDestination.getKms() + "km");
                    }
                    out.print("</td>");
                    out.print("<td>");
                    DriverAccess driacc = new DriverAccess();
                    Driver d1 = null;
                    try {
                        d1 = driacc.getDiverByDriverId(d.getDriverid());
                    } catch (ClassNotFoundException | SQLException ex) {
                        Logger.getLogger(SearchedAllDeliveryDetail.class.getName()).log(Level.SEVERE, null, ex);
                    }
                    if (d1 != null) {
                        out.print(d1.getName());
                    }
                    out.print("</td>");
                    out.print("<td>");
                    out.print(d.getDate());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(d.getCharge());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(d.getDestaddress());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(d.getOrderid());
                    out.print("</td>");
                    out.print("</tr>");
                }

                out.print("</tbody>");
                out.print("</table>");
            } else {
                out.print("<font>");
                out.print("No Delivery Details found...");
                out.print("</font>");
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
