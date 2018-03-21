/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.VehicleAccess;
import edu.sliit.logistics_control_system.dbaccess.VehicleTypeAccess;
import edu.sliit.logistics_control_system.model.Vehicle;
import edu.sliit.logistics_control_system.model.VehicleType;
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
public class AddVehicle extends HttpServlet {

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
            String vtypename = request.getParameter("vtypename");
            String vnumber = request.getParameter("newvnumber");
            double fixcharge = Double.parseDouble(request.getParameter("fixcharge"));
            double perkm = Double.parseDouble(request.getParameter("perkm"));
            VehicleTypeAccess vta = new VehicleTypeAccess();
            VehicleType vehicletype = null;

            try {
                vehicletype = vta.getVehicleTypeBYVTypeName(vtypename);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(AddVehicle.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (vehicletype != null) {
                Vehicle vehicle = new Vehicle(0, vehicletype.getVtypeid(), vnumber, fixcharge, perkm);

                VehicleAccess vehicleAccess = new VehicleAccess();
                try {
                    if (vehicleAccess.addVehicle(vehicle)) {
                        out.print("Vehicle Added sucessfully..");
                    } else {
                        out.print("Adding Fail...");
                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AddVehicle.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                out.print("Adding Fail...");
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
