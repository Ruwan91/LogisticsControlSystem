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
import edu.sliit.logistics_control_system.model.DeliveryView;
import edu.sliit.logistics_control_system.model.Vehicle;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.view.JasperViewer;

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
            //Driver Name
            String dname = splitedString[0];

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
                        //Here starts Jasper Report
//                        try {
//                            JasperReport compileReport = JasperCompileManager.compileReport("./src/java/edu/sliit/logistics_control_system/report/DEliveryreport.jrxml");
//                            Map<String, Object> map = new HashMap<>();
//                            int lastIsertDeliveryId = da.getLastIsertDeliveryId();
//                            String customerName="No Name";
//                            ArrayList<DeliveryView> deliveryDetailsByDeliveryId = da.getDeliveryDetailsByDeliveryId(driverId);
//                            for (DeliveryView dv : deliveryDetailsByDeliveryId) {
//                                customerName=dv.getFirstName()+" "+dv.getLastName();
//                            }
//                            
//                            JRDataSource dataSource=new JREmptyDataSource();
//                            map.put("delDate", date);
//                            map.put("delid", lastIsertDeliveryId);
//                            map.put("orderid", orderId);
//                            map.put("vehicleNumber", vnumber);
//                            map.put("driverName", dname);
//                            map.put("destaddress", destaddress);
//                            map.put("customerName",customerName);
//                            map.put("total",amount);
//                            map.put("deliveryDestinationName", ddname + "-" + kms + "km");
//
//                            JasperPrint printReport = JasperFillManager.fillReport(compileReport, map,dataSource);
//                            JasperExportManager.exportReportToPdfFile(printReport,"D:\\MyReports\\DeliveryReport.pdf");
//                            //JasperViewer.viewReport(printReport, false);
//                        } catch (JRException ex) {
//                            Logger.getLogger(AddDelivery.class.getName()).log(Level.SEVERE, null, ex);
//                        }
                    } else {
                        out.print("Adding Failed...");
                    }
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(AddDelivery.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
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
