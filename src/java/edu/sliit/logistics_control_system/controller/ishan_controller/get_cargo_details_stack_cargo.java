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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                /* TODO output your page here. You may use following sample code. */

                Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();

                String getdetails = "SELECT warin.warehouseinid, warin.orderid,warin.rentalperunit,cu.custid,cu.firstname,it.it_name,car.ctype_name,warin.qty,warin.receiveddate,warin.duedate FROM customer cu,item it,cargotype car,warehousein warin,order2,orderdetail WHERE cu.custid=order2.custid and order2.orderid=warin.orderid and it.itemid=orderdetail.itemid and orderdetail.orderid=order2.orderid and it.cargotypeid=car.cargotypeid order by warin.receiveddate desc";
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
                out.print("options");
                out.print("</th>");
                out.print("</tr>");
                out.print("</thead>");
                out.print("<tbody>");

                int get_wareid[] = new int[100];
                int order_id[] = new int[100];
                int get_cusid[] = new int[100];
                String get_cusname[] = new String[100];
                String get_cargoname[] = new String[100];
                String get_cargotype[] = new String[100];
                int get_quantity[] = new int[100];
                double rent[] = new double[100];
                String get_currentdate[] = new String[100];
                String get_duedate[] = new String[100];

                int i = 0;
                int x = 1;
                int y=1;
                while (rsgetdetails.next()) {

                    get_wareid[i] = Integer.parseInt(rsgetdetails.getString("warehouseinid"));
                    order_id[i]=rsgetdetails.getInt("warin.orderid");
                    get_cusid[i] = Integer.parseInt(rsgetdetails.getString("custid"));
                    get_cusname[i] = rsgetdetails.getString("firstname");
                    get_cargoname[i] = rsgetdetails.getString("it_name");
                    get_cargotype[i] = rsgetdetails.getString("ctype_name");
                    get_quantity[i] = Integer.parseInt(rsgetdetails.getString("qty"));
                    rent[i]=rsgetdetails.getDouble("warin.rentalperunit");
                    get_currentdate[i] = rsgetdetails.getString("receiveddate");
                    get_duedate[i] = rsgetdetails.getString("duedate");

                    out.print("<tr id=\"" + x + "\">");
                    out.print("<td>");
                    out.print(get_wareid[i]);
                    out.print("</td>");
                    
                     out.print("<td>");
                    out.print(order_id[i]);
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(get_cusid[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cusname[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cargoname[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_cargotype[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_quantity[i]);
                    out.print("</td>");
                    
                    out.print("<td>");
                    out.print(rent[i]);
                    out.print("</td>");
                    

                    out.print("<td>");
                    out.print(get_currentdate[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print(get_duedate[i]);
                    out.print("</td>");

                    out.print("<td>");
                    out.print("<button class=\"btn btn-default\"  id=\"" + y + "\" onclick=\"edit_table(this.id)\">");
                    out.print(" <span class=\"glyphicon glyphicon-pencil\">");
                    out.print("</span>");
                    out.print("</button>");
                    out.print("<button class=\"btn btn-default\">");
                    out.print(" <span class=\"glyphicon glyphicon-remove\"  id=\"" + x + "\" onclick=\"delete_table(this.id)\" >");
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
