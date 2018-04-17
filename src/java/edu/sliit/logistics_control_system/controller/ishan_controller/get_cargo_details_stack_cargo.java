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
import java.text.ParseException;
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
@WebServlet(name = "get_cargo_details_stack_cargo", urlPatterns = {"/get_cargo_details_stack_cargo"})
public class get_cargo_details_stack_cargo extends HttpServlet {

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
            throws ServletException, IOException, ParseException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                /* TODO output your page here. You may use following sample code. */

                Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();

                String getdetails = "SELECT DISTINCT warin.warehouseinid, warin.itemid ,warin.ldid,  warin.orderid,warin.rentalperunit,cu.custid,cu.firstname,it.it_name,car.ctype_name,warin.qty,warin.receiveddate,warin.duedate \n"
                        + "FROM customer cu,item it,cargotype car,warehousein warin,order2,orderdetail \n"
                        + "WHERE warin.isreleased=0 and cu.custid=order2.custid and order2.orderid=warin.orderid and warin.itemid=it.itemid and orderdetail.orderid=order2.orderid and it.cargotypeid=car.cargotypeid order by warin.receiveddate desc";
                ResultSet rsgetdetails = stmt.executeQuery(getdetails);

                out.print("<table class=\"table table-bordered table-hover\"  id=\"insert_cargo_table\" >");
                out.print("<thead>");
                out.print("<tr>");
                out.print("<th>");
                out.print("Warehouse ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Order ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Customer ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Customer Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Cargo Name");
                out.print("</th>");
                out.print("<th>");
                out.print("Cargo Type");
                out.print("</th>");
                out.print("<th>");
                out.print("Quantity");
                out.print("</th>");
                out.print("<th>");
                out.print("Rent per unit");
                out.print("</th>");
                out.print("<th>");
                out.print("Receive Date");
                out.print("</th>");
                out.print("<th>");
                out.print("Due Date");
                out.print("</th>");
                out.print("<th>");
                out.print("Item ID");
                out.print("</th>");
                out.print("<th>");
                out.print("Location ID");
                out.print("</th>");
                out.print("<th>");
                out.print("options");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");

                int get_wareid;
                int order_id;
                int get_cusid;
                String get_cusname;
                String get_cargoname;
                String get_cargotype;
                int get_quantity;
                double rent;
                String get_currentdate;
                String get_duedate;
                int get_ldid;
                int get_itmid;

                int i = 0;
                int x = 1;
                int y = 1;
                int z = 1;
                while (rsgetdetails.next()) {

                    get_wareid = Integer.parseInt(rsgetdetails.getString("warehouseinid"));
                    order_id = rsgetdetails.getInt("orderid");
                    get_cusid = Integer.parseInt(rsgetdetails.getString("custid"));
                    get_cusname = rsgetdetails.getString("firstname");
                    get_cargoname = rsgetdetails.getString("it_name");
                    get_cargotype = rsgetdetails.getString("ctype_name");
                    get_quantity = Integer.parseInt(rsgetdetails.getString("qty"));
                    rent = rsgetdetails.getDouble("rentalperunit");
                    get_currentdate = rsgetdetails.getString("receiveddate");
                    get_duedate = rsgetdetails.getString("duedate");
                    get_ldid = Integer.parseInt(rsgetdetails.getString("ldid"));
                    get_itmid = Integer.parseInt(rsgetdetails.getString("itemid"));

                    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                    LocalDate localDate = LocalDate.now();

                    String dat;
                    dat = dtf.format(localDate);
                     SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date due = sdf.parse(get_duedate);
         Date curr = sdf.parse(dat);
        
                    if (due.compareTo(curr) < 0) {
                        out.print("<tr id=\"" + x + "\" style=\"background-color:red; \" >");
                    }else if(due.compareTo(curr) == 0){
                        out.print("<tr id=\"" + x + "\" style=\"background-color:yellow; \" >");
                    }else{
                        out.print("<tr id=\"" + x + "\" >");
                    }

                    out.print("<td>");
                    out.print(get_wareid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(order_id);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cusid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cusname);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cargoname);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cargotype);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_quantity);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(rent);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_currentdate);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_duedate);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_itmid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_ldid);
                    out.print("</td>");

                    out.print("<td>");
                    out.print("<button class=\"btn btn-default\"  id=\"" + y + "\" onclick=\"edit_table(this.id)\">");
                    out.print(" <span class=\"glyphicon glyphicon-edit\">");
                    out.print("</span>");
                    out.print("</button>");
                    out.print("<button class=\"btn btn-default\" style=\"background-color:red; \">");
                    out.print(" <span class=\"glyphicon glyphicon-remove\"  id=\"" + x + "\" onclick=\"delete_table(this.id)\" style=\"color:white; \">");
                    out.print("</span>");
                    out.print("</button>");
                    out.print("<button class=\"btn btn-default\">");
                    out.print(" <span class=\"glyphicon glyphicon-export\"  id=\"" + z + "\" onclick=\"release_information(this.id)\" >");
                    out.print("</span>");
                    out.print("</button>");
                    out.print("</td>");

                    out.print("</tr>");
                    i++;
                    x++;
                    y++;
                    z++;
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(get_cargo_details_stack_cargo.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ParseException ex) {
            Logger.getLogger(get_cargo_details_stack_cargo.class.getName()).log(Level.SEVERE, null, ex);
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
