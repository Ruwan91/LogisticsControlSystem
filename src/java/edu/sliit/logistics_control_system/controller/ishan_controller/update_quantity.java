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
@WebServlet(name = "update_quantity", urlPatterns = {"/update_quantity"})
public class update_quantity extends HttpServlet {

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

                int quantity = Integer.parseInt(request.getParameter("quantity"));
                int privious_quan = Integer.parseInt(request.getParameter("privious_quan"));
                int itemid = Integer.parseInt(request.getParameter("itemid"));
                int locationid = Integer.parseInt(request.getParameter("locationid"));
                int c_ID_danger = 1;
                int c_ID_normal = 2;
                int c_ID_food = 4;
                int c_ID_refregirator = 3;

                int danger_max_quantity;
                int normal_max_quantity;
                int food_max_quantity;
                int refregirator_max_quantity;

                int danger_onhand_quantity=0;
                int normal_onhand_quantity=0;
                int food_onhand_quantity=0;
                int refregirator_onhand_quantity=0;

                Connection con = MySQLConnection.getConnection();
                Statement stmt = con.createStatement();
                Statement stmt2 = con.createStatement();
                Statement stmt3 = con.createStatement();
                Statement stmt4 = con.createStatement();
                Statement stmt5 = con.createStatement();
                Statement stmt6 = con.createStatement();
                Statement stmt7 = con.createStatement();

                String cID = "SELECT item.cargotypeid, SUM(warehousein.qty)as qunonh FROM item,warehousein WHERE item.itemid=warehousein.itemid and item.itemid=" + itemid + " AND warehousein.isreleased=0 ";
                String danger = "SELECT locationdescription.maxqty,locationdescription.qtyonhand FROM locationdescription WHERE locationdescription.cargotypeid=" + c_ID_danger + "";
                String normal = "SELECT locationdescription.maxqty,locationdescription.qtyonhand FROM locationdescription WHERE locationdescription.cargotypeid=" + c_ID_normal + "";
                String food = "SELECT locationdescription.maxqty,locationdescription.qtyonhand FROM locationdescription WHERE locationdescription.cargotypeid=" + c_ID_food + "";
                String refregirator = "SELECT locationdescription.maxqty,locationdescription.qtyonhand FROM locationdescription WHERE locationdescription.cargotypeid=" + c_ID_refregirator + "";

                ResultSet rs_cID = stmt.executeQuery(cID);
                ResultSet rs_danger = stmt2.executeQuery(danger);
                ResultSet rs_normal = stmt3.executeQuery(normal);
                ResultSet rs_food = stmt4.executeQuery(food);
                ResultSet rs_refregirator = stmt5.executeQuery(refregirator);

                rs_cID.next();
                rs_danger.next();
                rs_normal.next();
                rs_food.next();
                rs_refregirator.next();

                danger_max_quantity = Integer.parseInt(rs_danger.getString("maxqty"));
                normal_max_quantity = Integer.parseInt(rs_normal.getString("maxqty"));
                food_max_quantity = Integer.parseInt(rs_food.getString("maxqty"));
                refregirator_max_quantity = Integer.parseInt(rs_refregirator.getString("maxqty"));

                if (c_ID_danger == Integer.parseInt(rs_cID.getString("cargotypeid"))) {

                    danger_onhand_quantity = Integer.parseInt(rs_danger.getString("qtyonhand"));
                    danger_onhand_quantity = danger_onhand_quantity - privious_quan;
                    danger_onhand_quantity = danger_onhand_quantity + quantity;
                    if (danger_onhand_quantity > danger_max_quantity) {

                        out.print(1);
                    } else {

                        int executeUpdate2 = stmt7.executeUpdate("UPDATE `locationdescription` SET `qtyonhand` = " + danger_onhand_quantity + " WHERE locationdescription.cargotypeid=" +c_ID_danger+ "");

                        out.print(0);

                    }

                } else if (c_ID_normal == Integer.parseInt(rs_cID.getString("cargotypeid"))) {

                    normal_onhand_quantity = Integer.parseInt(rs_normal.getString("qtyonhand"));
                    normal_onhand_quantity = normal_onhand_quantity - privious_quan;
                    normal_onhand_quantity = normal_onhand_quantity + quantity;
                    if (normal_onhand_quantity > normal_max_quantity) {
                        out.print(1);
                    } else {
                        int executeUpdate2 = stmt7.executeUpdate("UPDATE `locationdescription` SET `qtyonhand` = " + normal_onhand_quantity + " WHERE locationdescription.cargotypeid=" +c_ID_normal+ "");
                        out.print(0);
                    }

                } else if (c_ID_food == Integer.parseInt(rs_cID.getString("cargotypeid"))) {

                    food_onhand_quantity = Integer.parseInt(rs_food.getString("qtyonhand"));
                    food_onhand_quantity = food_onhand_quantity - privious_quan;
                    food_onhand_quantity = food_onhand_quantity + quantity;
                    if (food_onhand_quantity > food_max_quantity) {
                        out.print(1);
                    } else {
                        int executeUpdate2 = stmt7.executeUpdate("UPDATE `locationdescription` SET `qtyonhand` = " + food_onhand_quantity + " WHERE locationdescription.cargotypeid=" +c_ID_food+ "");
                        out.print(0);
                    }

                } else if (c_ID_refregirator == Integer.parseInt(rs_cID.getString("cargotypeid"))) {

                    refregirator_onhand_quantity = Integer.parseInt(rs_refregirator.getString("qtyonhand"));
                    refregirator_onhand_quantity = refregirator_onhand_quantity - privious_quan;
                    refregirator_onhand_quantity = refregirator_onhand_quantity + quantity;
                    if (refregirator_onhand_quantity > refregirator_max_quantity) {
                        out.print(1);
                    } else {
                        int executeUpdate2 = stmt7.executeUpdate("UPDATE `locationdescription` SET `qtyonhand` = " + refregirator_onhand_quantity + " WHERE locationdescription.cargotypeid=" +c_ID_refregirator+ "");
                        out.print(0);
                    }

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
