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
@WebServlet(name = "get_quantities", urlPatterns = {"/get_quantities"})
public class get_quantities extends HttpServlet {

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
                
              
                int c_ID_danger = 1;
                int c_ID_normal = 2;
                int c_ID_food = 4;
                int c_ID_refregirator = 3;

                int danger_max_quantity=0;
                int normal_max_quantity=0;
                int food_max_quantity=0;
                int refregirator_max_quantity=0;

                int danger_onhand_quantity=0;
                int normal_onhand_quantity=0;
                int food_onhand_quantity=0;
                int refregirator_onhand_quantity = 0;

                Connection con = MySQLConnection.getConnection();
             
                Statement stmt5 = con.createStatement();

             String sql = "SELECT locationdescription.maxqty,locationdescription.qtyonhand,locationdescription.cargotypeid FROM locationdescription ";

          
                ResultSet rs = stmt5.executeQuery(sql);

              
               while(rs.next())
               {
                  if(c_ID_danger==Integer.parseInt(rs.getString("cargotypeid"))){
                      
                      danger_max_quantity=Integer.parseInt(rs.getString("maxqty"));
                      danger_onhand_quantity=Integer.parseInt(rs.getString("qtyonhand"));
                  
                  }else if(c_ID_normal==Integer.parseInt(rs.getString("cargotypeid"))){
                      
                       normal_max_quantity=Integer.parseInt(rs.getString("maxqty"));
                      normal_onhand_quantity=Integer.parseInt(rs.getString("qtyonhand"));
                  
                  }else if(c_ID_food==Integer.parseInt(rs.getString("cargotypeid"))){
                      
                      food_max_quantity=Integer.parseInt(rs.getString("maxqty"));
                     food_onhand_quantity=Integer.parseInt(rs.getString("qtyonhand"));
                  
                  }else if(c_ID_refregirator==Integer.parseInt(rs.getString("cargotypeid"))){
                  
                      refregirator_max_quantity=Integer.parseInt(rs.getString("maxqty"));
                     refregirator_onhand_quantity=Integer.parseInt(rs.getString("qtyonhand"));
                      
                  }
               }

               out.print("<table class=\"table  table-hover\"  id=\"home_quantity_warehouse_cargo_table\"  style=\" font-size:20px; font-family: 'Itim', cursive; \"  > ");
               out.print("<tr >");
               out.print("<th class=\"active\">");
               out.print("<h2>");
               out.print("Normal Cargo");
               out.print("</h2>");
               out.print("</th>");
               out.print( "<th class=\"active\">");
               out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                        out.print("Maximum Quantity");
                                        out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                      
                                        out.print(normal_max_quantity);
                                       
                                    out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                        out.print("Current Quantity");
                                        out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                      
                                                out.print( normal_onhand_quantity);
                                                
                                    out.print("</th>");
                                out.print("</tr>");
                                  out.print("<tr >");
                                    out.print("<th class=\"active\">");
                                      out.print("<h2>");
                                      out.print("Danger Cargo");
                                      out.print("</h2>");  
                                    out.print("</th>");
                                     out.print("<th class=\"active\">");
                                     out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                                out.print("Maximum Quantity");
                                                out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                        
                                        out.print(danger_max_quantity);
                                       
                                    out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3 >");
                                        out.print("Current Quantity");
                                        out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                        
                                        out.print(danger_onhand_quantity);
                                          
                                     out.print("</th>");
                                 out.print("</tr>");
                                 out.print("<tr >");
                                    out.print("<th class=\"active\">");
                                      out.print("<h2>");
                                      out.print("food Cargo");
                                      out.print("</h2>");  
                                    out.print("</th>");
                                     out.print("<th class=\"active\">");
                                     out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                                out.print("Maximum Quantity");
                                                out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                       
                                        out.print(food_max_quantity);
                                        
                                    out.print("</th>");
                                out.print("</tr>");
                              out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                        out.print("Current Quantity");
                                        out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                      
                                                out.print(food_onhand_quantity);
                                               
                                    out.print("</th>");
                                out.print("</tr>");
                                   out.print("<tr >");
                                    out.print("<th class=\"active\">");
                                      out.print("<h2>");
                                      out.print("refregirator Cargo");
                                      out.print("</h2>");  
                                    out.print("</th>");
                                     out.print("<th class=\"active\">");
                                     out.print("</th>");
                                out.print("</tr>");
                                out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                                out.print("Maximum Quantity");
                                                out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                        
                                        out.print(refregirator_max_quantity);
                                       
                                    out.print("</th>");
                                out.print("</tr>");
                               out.print("<tr>");
                                    out.print("<th>");
                                        out.print("<h3>");
                                        out.print("Current Quantity");
                                        out.print("</h3>");
                                    out.print("</th>");
                                    out.print("<th>");
                                       
                                                out.print(refregirator_onhand_quantity);
                                               
                                    out.print("</th>");
                                out.print("</tr>");
                           
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
