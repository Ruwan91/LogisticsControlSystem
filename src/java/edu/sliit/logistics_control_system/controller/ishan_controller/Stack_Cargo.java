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
@WebServlet(name = "Stack_Cargo", urlPatterns = {"/Stack_Cargo"})
public class Stack_Cargo extends HttpServlet {

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
             try {
                                     /* TODO output your page here. You may use following sample code. */
                                      int odid=Integer.parseInt(request.getParameter("odid"));
                                       
                          String cargoname=request.getParameter("cargoname");
                          
                          
                           String cargotype=request.getParameter("cargotype");
                           
                         double quantity=Integer.parseInt(request.getParameter("quantity")) ;
                          String cusname=request.getParameter("cusname");
                          int cusid=Integer.parseInt(request.getParameter("cusid"));
                          double rent=Integer.parseInt(request.getParameter("rent"));
                          double cost=Integer.parseInt(request.getParameter("cost"));
                          String currentdate=request.getParameter("currentdate");
                          String duedate=request.getParameter("duedate");
                           int itemid=Integer.parseInt(request.getParameter("itemid"));
                            int locationid=Integer.parseInt(request.getParameter("locationid"));
                         
                                     Connection con=MySQLConnection.getConnection();
                                     Statement stmt=con.createStatement();
                                    
                                    String duedateconcat[]=new  String[40];
                                    String currentdateconcat[]=new  String[40];
                                    
                                    int  i=0;
                                     StringTokenizer stdue = new StringTokenizer(duedate,"/");  
                                     StringTokenizer stcurrent = new StringTokenizer(currentdate,"/");  
                                     while (stdue.hasMoreTokens()) {  
                                       duedateconcat[i] =stdue.nextToken();  
                                       i++;
                                    }  
                                     int v=0;
                                     while (stcurrent.hasMoreTokens()) {  
                                       currentdateconcat[v] =stcurrent.nextToken();  
                                       v++;
                                    }
                                     String due_month=duedateconcat[0];
                                     String due_date=duedateconcat[1];
                                     
                                     String due_year=duedateconcat[2];
                                     
                                      String current_month=currentdateconcat[0];
                                     String current_date=currentdateconcat[1];
                                    
                                     String current_year=currentdateconcat[2];
                                     
                                  stmt.executeUpdate("INSERT INTO `warehousein` (warehouseinid, qty, orderid, rentalperunit, duedate, receiveddate, itemid, ldid) VALUES (NULL, "+quantity+", "+odid+", "+rent+", '"+due_year+"-"+due_month+"-"+due_date+"', '"+current_year+"-"+current_month+"-"+current_date+"', "+itemid+", "+locationid+")");
                                      
                                     
                                 
                    
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
