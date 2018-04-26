/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.DeliveryAccess;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
public class DeliveryDashboardDetail extends HttpServlet {

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
            int twentyFeetContainer = 50;
            int fortyFeetContainer = 0;
            int twentyFeetRefrigeratedLorry = 0;
            int fourteenFeetRefrigeratedMiniLorry = 0;
            int thertyFeetCargoTruck = 0;
            try {
                twentyFeetContainer = da.getDeliveryCountTwentyFeetContainer();
                fortyFeetContainer = da.getDeliveryCountFortyFeetContainer();
                twentyFeetRefrigeratedLorry = da.getDeliveryCountTwentyFeetRefrigeratedLorry();
                fourteenFeetRefrigeratedMiniLorry = da.getDeliveryCountFourteenFeetRefrigeratedMiniLorry();
                thertyFeetCargoTruck = da.getDeliveryCountThertyFeetCargoTruck();
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DeliveryDashboardDetail.class.getName()).log(Level.SEVERE, null, ex);
            }
            
            out.print("<input type=\"hidden\" id=\"20FeetContainerCount\" value=\""+twentyFeetContainer+"\">");
            out.print("<input type=\"hidden\" id=\"40FeetContainerCount\" value=\""+fortyFeetContainer+"\">");
            out.print("<input type=\"hidden\" id=\"20FeetRefrigeratedLorryCount\" value=\""+twentyFeetRefrigeratedLorry+"\">");
            out.print("<input type=\"hidden\" id=\"14FeetRefrigeratedMiniLorryCount\" value=\""+fourteenFeetRefrigeratedMiniLorry+"\">");
            out.print("<input type=\"hidden\" id=\"30FeetCargoTruckCount\" value=\""+thertyFeetCargoTruck+"\">");

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
