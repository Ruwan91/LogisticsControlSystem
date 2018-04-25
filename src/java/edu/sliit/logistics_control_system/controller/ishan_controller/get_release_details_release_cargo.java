/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller.ishan_controller;

import edu.sliit.logistics_control_system.connection.MySQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ishan
 */
@WebServlet(name = "get_release_details_release_cargo", urlPatterns = {"/get_release_details_release_cargo"})
public class get_release_details_release_cargo extends HttpServlet {

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
            try {
                /* TODO output your page here. You may use following sample code. */

               Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();

                String sql = "SELECT  warehouseout.warehouseoutid,warehouseout.warehouseinid,item.it_name,customer.firstname,warehousein.duedate,cargotype.ctype_name,order2.orderid, warehouseout.itemid,warehouseout.qty,warehouseout.releasedate,warehouseout.latedays,warehouseout.latefeeperday,warehouseout.totalcost,warehouseout.ldid\n" +
"FROM warehouseout,item ,order2,customer,warehousein,cargotype\n" +
"WHERE warehouseout.itemid=item.itemid and warehousein.warehouseinid=warehouseout.warehouseinid  and warehousein.orderid=order2.orderid and item.cargotypeid=cargotype.cargotypeid and order2.custid=customer.custid order by warehouseout.releasedate desc";
                ResultSet rs = stmt.executeQuery(sql);

                out.print("<table class=\"table table-bordered table-hover\"  id=\"release_cargo_table\" style=\"font-size:20px;font-family: 'Itim', cursive;\" >");
                out.print("<thead>");
                out.print("<tr class=\"active\">");
                out.print("<th>");
                out.print("W_Out ID");
                out.print("</th>");
                out.print("<th>");
                out.print("W_in ID");
                out.print("</th>");
                 out.print("<th>");
                out.print("Order ID");
                out.print("</th>");
                 out.print("<th>");
                out.print("Customer Name");
                out.print("</th>");
                 out.print("<th style=\"display:none;\">");
                out.print("Item ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Item ");
                out.print("</th>");
                out.print("<th style=\"display:none;\">");
                out.print(" Type");
                out.print("</th>");
                out.print("<th>");
                out.print("Quantity");
                out.print("</th>");
                out.print("<th>");
                out.print("Due Date");
                out.print("</th>");
                out.print("<th>");
                out.print("Release Date");
                out.print("</th>");
                out.print("<th>");
                out.print("Late Days");
                out.print("</th>");
                out.print("<th>");
                out.print("fine_per_Day");
                out.print("</th>");
            
                out.print("<th>");
                out.print("Total Cost");
                out.print("</th>");
                out.print("<th>");
                out.print("Location ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Options");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");
                int get_wareOutid;
                int get_wareINid;

                String get_cargoname;
                String get_customer;
                int get_quantity;
                int late_days;
                int orderid;
                double latefee;
                String get_releasedate;
                String get_duedate;
                String get_itemtype;
                int get_ldid;
                int get_itmid;
                double totalcost;
                
                int i = 0;
                int x = 11;
                int y = 11;
                
                while (rs.next()) {
          orderid = Integer.parseInt(rs.getString("orderid"));
                    get_wareOutid = Integer.parseInt(rs.getString("warehouseoutid"));
                    get_wareINid = Integer.parseInt(rs.getString("warehouseinid"));
                    get_customer=rs.getString("firstname");
                    get_duedate=rs.getString("duedate");
                    late_days = Integer.parseInt(rs.getString("latedays"));
                    get_cargoname = rs.getString("it_name");
                    totalcost = rs.getDouble("totalcost");
                    get_quantity = Integer.parseInt(rs.getString("qty"));
                    latefee = rs.getDouble("latefeeperday");
                    get_releasedate = rs.getString("releasedate");
                    get_itemtype= rs.getString("ctype_name");
                    get_ldid = Integer.parseInt(rs.getString("ldid"));
                    get_itmid = Integer.parseInt(rs.getString("itemid"));

                    out.print("<tr id=\"" + x + "\" >");

                    out.print("<td>");
                    out.print(get_wareOutid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_wareINid);
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(orderid);
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(get_customer);
                    out.print("</td>");
                    
                    out.print("<td style=\"display:none;\">");
                    out.print(get_itmid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cargoname);
                    out.print("</td>");

                     out.print("<td style=\"display:none;\">");
                    out.print(get_itemtype);
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(get_quantity);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_duedate);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_releasedate);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(late_days);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(latefee);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(totalcost);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_ldid);
                    out.print("</td>");

                 
                    out.print("<td>");
                    out.print("<button class=\"btn btn-default\"  id=\"" + y + "\" onclick=\"edit_release_table(this.id)\">");
                    out.print(" <span class=\"glyphicon glyphicon-edit\">");
                    out.print("</span>");
                    out.print("</button>");
                    out.print("<button class=\"btn btn-default\" style=\"background-color:red; \">");
                    out.print(" <span class=\"glyphicon glyphicon-remove\"  id=\"" + x + "\" onclick=\"delete_release_table(this.id)\" style=\"color:white; \">");
                    out.print("</span>");
                    out.print("</button>");

                    out.print("</td>");

                    out.print("</tr>");
                    i++;
                    x++;
                    y++;
                
                }

                out.print("</tbody>");
                out.print("</table>");

              con.close();
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
