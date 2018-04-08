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
                     
                         
                                     Connection con=MySQLConnection.getConnection();
                                     Statement stmt=con.createStatement();
                                    
                                    
                              
                                      
                                     
                                     String getdetails="SELECT cu.custid,cu.firstname,it.it_name,car.ctype_name,warin.qty,warin.receiveddate,warin.duedate FROM customer cu,item it,cargotype car,warehousein warin,order2,orderdetail WHERE cu.custid=order2.custid and order2.orderid=warin.orderid and it.itemid=orderdetail.itemid and orderdetail.orderid=order2.orderid and it.cargotypeid=car.cargotypeid";
                                     ResultSet rsgetdetails=stmt.executeQuery(getdetails);
                                     
                                     
                        out.print("<table class=\"table table-bordered table-hover\">");  
                        out.print("<thead>");
                            out.print("<tr>");
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
                                out.print("Receive Date");
                                        out.print("</th>");
                                out.print("<th>");
                                out.print("Due Date");
                                        out.print("</th>");
                            out.print("</tr>");
                        out.print("</thead>");
                        out.print("<tbody>");
                           
                        
                        
                        
                        
                            
                            
                            int get_cusid[]=new int[100];
                            String get_cusname[]=new String[100];
                             String get_cargoname[]=new String[100];
                             String get_cargotype[]=new String[100];
                             int get_quantity[]=new int[100];
                             String get_currentdate[]=new String[100];
                             String get_duedate[]=new String[100];
                             
                             int i=0;
                             
                         
                            
                            
                            while(rsgetdetails.next()){
                                
                                   get_cusid[i]=Integer.parseInt(rsgetdetails.getString("custid"));
                                 get_cusname[i]=rsgetdetails.getString("firstname");
                                  get_cargoname[i]=rsgetdetails.getString("it_name");
                                 get_cargotype[i]=rsgetdetails.getString("ctype_name");
                                  get_quantity[i]=Integer.parseInt(rsgetdetails.getString("qty")) ;
                                 get_currentdate[i]=rsgetdetails.getString("receiveddate");
                                 get_duedate[i]=rsgetdetails.getString("duedate");
                               out.print("<tr>");
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
                                  out.print(get_currentdate[i]);
                                   out.print("</td>");
                                   
                                  out.print("<td>");
                                  out.print(get_duedate[i]);
                                   out.print("</td>");
                                 i++;
                                 out.print("</tr>");
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
