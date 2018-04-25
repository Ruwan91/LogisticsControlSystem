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
@WebServlet(name = "edit_release_cargo", urlPatterns = {"/edit_release_cargo"})
public class edit_release_cargo extends HttpServlet {

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
                int wareout=Integer.parseInt(request.getParameter("warout"));
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

                Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();

                int executeUpdate = stmt.executeUpdate("UPDATE `warehouseout` SET `warehouseinid` = "+ware+", `itemid` = "+itmid+", `qty` = "+quan+", `releasedate` = '"+released+"', `latedays` = "+lated+", `latefeeperday` = "+latfeeperday +", `totalcost` = "+totalcost+", `ldid` = "+locid+" WHERE `warehouseout`.`warehouseoutid` = "+wareout+"");
                if (executeUpdate > 0) {
                    out.print("successfully added");
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
