/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.DeliveryAccess;
import edu.sliit.logistics_control_system.model.DeliveryView;
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
public class SearcheDeliveryDetails extends HttpServlet {

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

            String delvnumber = request.getParameter("delvnumber");
            String deldriverid = request.getParameter("deldriverid");
            String searchdate = request.getParameter("searchdate");
            String customerName = request.getParameter("customerName");
            int searchdeliveryid = 0;
            if (!"".equals(request.getParameter("searchdeliveryid"))) {
                searchdeliveryid = Integer.parseInt(request.getParameter("searchdeliveryid"));
            }
            int searchorderId = 0;
            if (!"".equals(request.getParameter("searchorderId"))) {
                searchorderId = Integer.parseInt(request.getParameter("searchorderId"));
            }
            int driverId = 0;
            int customerId = 0;
            if (deldriverid != null || !"none".equals(deldriverid)) {
                String[] splitdriver = {};
                try {
                    splitdriver = deldriverid.split("-");
                } catch (NullPointerException n) {

                }
                if (splitdriver.length > 1) {
                    driverId = Integer.parseInt(splitdriver[1]);
                }
            }
            if (customerName != null || !"none".equals(customerName) || !"".equals(customerName)) {
                String[] splitedCustomer = {};
                try {
                    splitedCustomer = customerName.split("-");
                } catch (NullPointerException n) {

                }

                if (splitedCustomer.length > 1) {
                    customerId = Integer.parseInt(splitedCustomer[1]);
                }
            }
            DeliveryAccess da = new DeliveryAccess();
            ArrayList<DeliveryView> allDeliveryDetails = null;
            if (delvnumber != null || !"none".equals(delvnumber)) {
                try {
                    allDeliveryDetails = da.getAllDeliveryDetailsByVehicleNumber(delvnumber);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (driverId > 0) {
                try {
                    allDeliveryDetails = da.getAllDeliveryDetailsByDriverId(driverId);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            } 
            if ( !"".equals(searchdate)) {
                try {
                    allDeliveryDetails = da.getAllDeliveryDetailsByDate(searchdate);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (searchdeliveryid > 0) {
                try {
                    allDeliveryDetails = da.getDeliveryDetailsByDeliveryId(searchdeliveryid);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (searchorderId > 0) {
                try {
                    allDeliveryDetails = da.getDeliveryDetailsByOrderId(searchorderId);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (customerId > 0) {
                try {
                    allDeliveryDetails = da.getDeliveryDetailsByCustomerId(customerId);
                } catch (SQLException | ClassNotFoundException ex) {
                    Logger.getLogger(SearcheDeliveryDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            if (allDeliveryDetails != null) {
                out.print("<table class=\"table table-striped table-hover\" >");
                out.print("<thead class=\"thead-dark\">");
                out.print("<tr>");
                out.print("<th scope=\"col\">");
                out.print("Delivery Id");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Driver Name");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Order Id");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Vehicle Number");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Vehicle Type");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Charge(Rs.)");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Date");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Destination Address");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Kms");
                out.print("</th>");
                out.print("<th scope=\"col\">");
                out.print("Customer Name");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                for (DeliveryView dv : allDeliveryDetails) {
                    out.print("<tr>");
                    out.print("<td>");
                    out.print(dv.getDeliveryid());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getDriverName());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getOrderid());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getVnumber());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getVtype());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getCharge());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getDate());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getDestaddress());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getKms());
                    out.print("</td>");
                    out.print("<td>");
                    out.print(dv.getFirstName() + " " + dv.getLastName());
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
