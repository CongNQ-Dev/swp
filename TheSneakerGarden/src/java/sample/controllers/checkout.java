/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package sample.controllers;

import dbmanager.OrderManager;
import dbmanager.ProductManager;
import java.io.IOException;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "checkout", urlPatterns = {"/checkout"})
public class checkout extends HttpServlet {

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

        request.getRequestDispatcher("/checkout.jsp").include(request, response);

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

        String fullname = request.getParameter("fullname");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");

        long millis = System.currentTimeMillis();
        java.sql.Date orderDate = new java.sql.Date(millis);

        OrderManager oderDAO = new OrderManager();
        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = null;

        if (session.getAttribute("cart") == null) {
            request.getRequestDispatcher("/cart").include(request, response);
        } else if (session.getAttribute("user") != null) {
            User userSession = (User) session.getAttribute("user");
            ProductManager pro = new ProductManager();
            cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            int total = 0;
            for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                Product product = pro.getProductByID(en.getKey());
                total += product.getPrice() * en.getValue().getQuantity();
            }
            if (oderDAO.insertOder(userSession.getUserId(), fullname, phone, address, email, orderDate, total)) {
                for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                    Product product = pro.getProductByID(en.getValue().getID());
                    oderDAO.insertOderItem(oderDAO.getOrderID(), en.getValue().getID(), en.getValue().getQuantity(), product.getPrice());
                    pro.updateSize(en.getValue().getSize(), en.getValue().getID(), pro.getProductQuantityByProSize(en.getValue().getSize(), en.getValue().getID()) - en.getValue().getQuantity());
                }
            }
        } else {
            ProductManager pro = new ProductManager();
            cart = (Map<Integer, CartItem>) session.getAttribute("cart");
            int total = 0;
            for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                Product product = pro.getProductByID(en.getValue().getID());
                total += product.getPrice() * en.getValue().getQuantity();
            }
            if (oderDAO.insertOder(fullname, phone, address, email, orderDate, total)) {
                for (Map.Entry<Integer, CartItem> en : cart.entrySet()) {
                    Product product = pro.getProductByID(en.getValue().getID());
                    oderDAO.insertOderItem(oderDAO.getOrderID(), en.getValue().getID(), en.getValue().getQuantity(), product.getPrice());
                    pro.updateSize(en.getValue().getSize(), en.getValue().getID(), pro.getProductQuantityByProSize(en.getValue().getSize(), en.getValue().getID()) - en.getValue().getQuantity());
                }
            }
        }
        session.setAttribute("cart", null);
        request.getRequestDispatcher("./cart").include(request, response);
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
