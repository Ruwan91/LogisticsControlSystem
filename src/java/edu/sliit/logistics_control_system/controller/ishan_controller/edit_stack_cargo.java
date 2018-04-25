/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sliit.logistics_control_system.controller.ishan_controller;

import com.sun.xml.rpc.processor.modeler.j2ee.xml.string;
import edu.sliit.logistics_control_system.connection.MySQLConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.StringTokenizer;
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
@WebServlet(name = "edit_stack_cargo", urlPatterns = {"/edit_stack_cargo"})
public class edit_stack_cargo extends HttpServlet {

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
                int odid = Integer.parseInt(request.getParameter("odid"));
                int wareid = Integer.parseInt(request.getParameter("wareid"));
                String cargoname = request.getParameter("cargoname");

                String cargotype = request.getParameter("cargotype");

                int quantity = Integer.parseInt(request.getParameter("quantity"));
                String cusname = request.getParameter("cusname");
                int cusid = Integer.parseInt(request.getParameter("cusid"));
                double rent = Double.parseDouble(request.getParameter("rent"));
                double cost = Double.parseDouble(request.getParameter("cost"));
                String currentdate = request.getParameter("currentdate");
                String duedate = request.getParameter("duedate");
                int itemid = Integer.parseInt(request.getParameter("itemid"));
                int locationid = Integer.parseInt(request.getParameter("locationid"));

               Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();
                
                String duedateconcat[] = new String[40];
                String currentdateconcat[] = new String[40];
                
                  StringTokenizer stcurrent = new StringTokenizer(currentdate, "-");
                
                int v = 0;
                while (stcurrent.hasMoreTokens()) {
                    currentdateconcat[v] = stcurrent.nextToken();
                    v++;
                }
                   String current_month = currentdateconcat[2];
                String current_date = currentdateconcat[0];

                String current_year = currentdateconcat[1];
                
                int i = 0;
                if(duedate.indexOf('-')>=0){
         
                int executeUpdate = stmt.executeUpdate("UPDATE `warehousein` SET `qty` = " + quantity + ", `orderid`=" + odid + ", `rentalperunit` = " + rent + ", `duedate` = '"+duedate+"', `receiveddate` = '" +current_date    + "-" +current_year     + "-" +current_month + "', `itemid` = " + itemid + ", `ldid` = " + locationid + " WHERE `warehousein`.`warehouseinid` = " + wareid );
                if (executeUpdate > 0) {
                    out.print("successfully updated");
                }else{out.print("Error cant update");}

                }else{
                 StringTokenizer stdue = new StringTokenizer(duedate, "/"); 
                 while (stdue.hasMoreTokens()) {
                    duedateconcat[i] = stdue.nextToken();
                    i++;
                }
                    String due_year = duedateconcat[2];
                String due_date = duedateconcat[0];

                String due_month = duedateconcat[1];

             
                out.print("due date "+due_date);
                out.print("due month "+due_month);
                out.print("due year "+due_year);
                int executeUpdate = stmt.executeUpdate("UPDATE `warehousein` SET `qty` = " + quantity + ", `orderid`=" + odid + ", `rentalperunit` = " + rent + ", `duedate` = '"+due_year     +"-"+ due_date +"-"+  due_month+"', `receiveddate` = '" +current_date    + "-" +current_year     + "-" +current_month + "', `itemid` = " + itemid + ", `ldid` = " + locationid + " WHERE `warehousein`.`warehouseinid` = " + wareid );
                if (executeUpdate > 0) {
                    out.print("successfully updated");
                }else{out.print("Error cant update");}

                }
              
             
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
