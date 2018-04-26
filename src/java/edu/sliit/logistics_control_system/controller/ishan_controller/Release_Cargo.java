/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller.ishan_controller;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
 * @author ishan
 */
@WebServlet(name = "Release_Cargo", urlPatterns = {"/Release_Cargo"})
public class Release_Cargo extends HttpServlet {

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
            throws ServletException, IOException, JRException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                /* TODO output your page here. You may use following sample code. */
                int ware = Integer.parseInt(request.getParameter("ware"));
                String customer = request.getParameter("cusname");
                String due = request.getParameter("due");
                int quan = Integer.parseInt(request.getParameter("quan"));

                int lated = Integer.parseInt(request.getParameter("lated"));
                double latfeeperday = Double.parseDouble(request.getParameter("latfeeperday"));
                double cost = Double.parseDouble(request.getParameter("cost"));
                double totalcost = Double.parseDouble(request.getParameter("totalcost"));
                String released = request.getParameter("released");

                int itmid = Integer.parseInt(request.getParameter("itmid"));
                int locid = Integer.parseInt(request.getParameter("locid"));

                Connection con = MySQLConnection.getInstance().getConnection();
                Statement stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();

                Statement stmt4=con.createStatement();
                Statement stmt5=con.createStatement();
                String re_date="SELECT warehousein.receiveddate from warehousein WHERE warehousein.warehouseinid="+ware+"";
                String itn="SELECT item.it_name ,item.cargotypeid FROM item WHERE item.itemid="+itmid+"";
                ResultSet it_nrs = stmt4.executeQuery(itn);
                it_nrs.next();
                 ResultSet re_daters = stmt5.executeQuery(re_date);
                 int c_id= Integer.parseInt(it_nrs.getString("cargotypeid"));
                 
                String sql = "SELECT locationdescription.maxqty,locationdescription.qtyonhand FROM locationdescription,item WHERE  locationdescription.cargotypeid=item.cargotypeid and item.itemid=" + itmid + "";
                ResultSet rs = stmt3.executeQuery(sql);
                rs.next();
                int onhand_quantity = rs.getInt("qtyonhand");
                onhand_quantity = onhand_quantity - quan;

                int executeUpdate = stmt.executeUpdate("INSERT INTO `warehouseout` (`warehouseoutid`, `warehouseinid`, `itemid`, `qty`, `releasedate`, `latedays`, `latefeeperday`, `totalcost`, `ldid`) VALUES (NULL, " + ware + ", " + itmid + ", " + quan + ", '" + released + "', " + lated + ", " + latfeeperday + ", " + totalcost + ", " + locid + ")");
                if (executeUpdate > 0) {

                    int executeUpdate2 = stmt2.executeUpdate("UPDATE `locationdescription` SET `qtyonhand` = " + onhand_quantity + " WHERE locationdescription.cargotypeid= " + c_id + "");
                    out.print("successfully added");
//                    try{
//                        
//                        JasperReport jr = JasperCompileManager.compileReport("D:/Ishan/projects/SLIIT PROJECTS/LogisticsControlSystem/src/java/edu/sliit/logistics_control_system/controller/ishan_controller/report1.jrxml");
//                    Map<String, Object> params = new HashMap<>();
//
//
//                 
//
//                    JasperPrint jp = JasperFillManager.fillReport(jr, null,con);
//                    JasperViewer.viewReport(jp);
//                         Compile jrxml file.
//       JasperReport jasperReport = JasperCompileManager
//               .compileReport("D:/Ishan/projects/SLIIT PROJECTS/LogisticsControlSystem/src/java/edu/sliit/logistics_control_system/controller/ishan_controller/report1.jrxml");
// 
//        Parameters for report
//       Map<String, Object> parameters = new HashMap<String, Object>();
// 
//        DataSource
//        This is simple example, no database.
//        then using empty datasource.
//       JRDataSource dataSource = new JREmptyDataSource();
// 
//       JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport,
//               parameters, dataSource);
// 
//    
//        Make sure the output directory exists.
//       File outDir = new File("C:/jasperoutput");
//       outDir.mkdirs();
// 
//        Export to PDF.
//       JasperExportManager.exportReportToPdfFile(jasperPrint,
//               "C:/jasperoutput/StyledTextReport.pdf");
//        
//       System.out.println("Done!");
//
//                    params.put("wid", ware);
//                    params.put("customer", customer);
//                     params.put("qty", quan);
//                      params.put("cargo", it_nrs.getString("it_name"));
//                       params.put("r_date", re_daters.getString("receiveddate"));
//                        params.put("d_date", due);
//                         params.put("late_d", lated);
//                         params.put("cost_per_d", latfeeperday);
//                          params.put("total", totalcost);
                         
                  

                   

//                  
//                    }catch(JRException e){
//                        System.out.println(e);
//                    }
                }

//                con.close();
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(Stack_Cargo.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(Release_Cargo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (JRException ex) {
            Logger.getLogger(Release_Cargo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
