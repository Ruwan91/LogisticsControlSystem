/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller;

import edu.sliit.logistics_control_system.dbaccess.DeliveryAccess;
import edu.sliit.logistics_control_system.dbaccess.DeliveryDestinationAccess;
import edu.sliit.logistics_control_system.dbaccess.VehicleAccess;
import edu.sliit.logistics_control_system.model.Delivery;
import edu.sliit.logistics_control_system.model.DeliveryDestination;
import edu.sliit.logistics_control_system.model.Vehicle;
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
public class AddDelivery extends HttpServlet {

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
            //Getting Delivery details from delivery form
            String vnumber = request.getParameter("delvnumber");
            String ddname = request.getParameter("delddname");
            String drivernamewithid = request.getParameter("deldriverid");
            //Separate name with the driver id using String split() using regex "-"
            String[] splitedString = drivernamewithid.split("-");
            //splitted string second element  of array splitedString id value is containing splitedString[1] 
            int driverId = Integer.parseInt(splitedString[1]);
            String date = request.getParameter("deldate");
            String destaddress = request.getParameter("deldestaddress");
            int orderId = Integer.parseInt(request.getParameter("delorderId"));

            //creating DB Access objects
            VehicleAccess va = new VehicleAccess();
            DeliveryDestinationAccess ddacc = new DeliveryDestinationAccess();
            Vehicle vehicle = null;
            DeliveryDestination deliveryDestination = null;

            //Retriving data from vehicle & delevery destination
            try {
                vehicle = va.getVehicleByVnumber(vnumber);
                deliveryDestination = ddacc.getDeliveryDestinationByName(ddname);
            } catch (SQLException | ClassNotFoundException ex) {
                Logger.getLogger(AddDelivery.class.getName()).log(Level.SEVERE, null, ex);
            }
            if (null != vehicle && deliveryDestination != null) {
                //Calculating Amount of the delivery calculation
                double amount = 0;
                double kms = deliveryDestination.getKms();
                double fixcharge = vehicle.getFixcharge();
                double perkm = vehicle.getPerkm();
                amount = (kms * perkm) + fixcharge;
//                System.out.println("Charge is:" + amount + "...........................");
                //creating delivery object
                Delivery delivery = new Delivery(0, vehicle.getVehicleid(), deliveryDestination.getDdid(), driverId, amount, date, destaddress, orderId);
                DeliveryAccess da = new DeliveryAccess();
                try {
                    //Adding Driver and print the result
                    if (da.addDelivery(delivery)) {
                        out.print("Delivery Added Successfully...");
                    } else {
                        out.print("Adding Failed...");
                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AddDelivery.class.getName()).log(Level.SEVERE, null, ex);
                }
            }else{
                //System.out.println("NUlllll.....");
                out.print("Adding Failed...");
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
