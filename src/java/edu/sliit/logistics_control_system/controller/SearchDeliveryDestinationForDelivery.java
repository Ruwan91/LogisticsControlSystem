/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.DeliveryDestinationAccess;
import edu.sliit.logistics_control_system.model.DeliveryDestination;
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
public class SearchDeliveryDestinationForDelivery extends HttpServlet {

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
            //Creating DeliveryDestinationAccess object
            DeliveryDestinationAccess access = new DeliveryDestinationAccess();
            ArrayList<DeliveryDestination> allDeliveryDestinations = null;
            try {
                //Retrive all posible Delivery Destinations
                allDeliveryDestinations = access.getAllDeliveryDestinations();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(SearchDeliveryDestinationForDelivery.class.getName()).log(Level.SEVERE, null, ex);
            }

            //check if not null the DEliverDestinations
            if (allDeliveryDestinations != null) {
                //create the option list to send to delevery section
                out.print("<select class=\"form-control\" id=\"delddname\" name=\"delddname\" >");
                out.print("<option value=\"none\" id=\"selected_delddname\">");
                out.print("Select Delivery Destination");
                out.print("</option>");
                for (DeliveryDestination deliveryDestination : allDeliveryDestinations) {
                    out.print("<option>");
                    out.print(deliveryDestination.getDestination());
                    out.print("</option>");
                }
                out.print("</select>");
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
