/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.controllers;

import dbmanager.OrderManager;
import dbmanager.ProductManager;
import dbmanager.ReviewManager;
import dbmanager.UserManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.CartItem;
import model.Category;
import model.Order;
import model.Product;
import model.Review;
import model.User;

/**
 *
 * @author Admin
 */
@WebServlet(name = "DetailControl", urlPatterns = {"/product-detail"})
public class DetailControl extends HttpServlet {

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
        int pID = Integer.valueOf(request.getParameter("id"));
        //int rating = Integer.valueOf(request.getParameter("rating"));
        ProductManager manager = new ProductManager();
        Product p = manager.getProductByID(pID);
        ReviewManager reviewManager = new ReviewManager();
        ArrayList<Review> listReviewByRating1 = reviewManager.getAllReviewByRating(1, pID);
        ArrayList<Review> listReviewByRating2 = reviewManager.getAllReviewByRating(2, pID);
        ArrayList<Review> listReviewByRating3 = reviewManager.getAllReviewByRating(3, pID);
        ArrayList<Review> listReviewByRating4 = reviewManager.getAllReviewByRating(4, pID);
        ArrayList<Review> listReviewByRating5 = reviewManager.getAllReviewByRating(5, pID);

        UserManager userManager = new UserManager();
        ArrayList<User> userList = userManager.getAllUser();

        HttpSession session = request.getSession();
        ArrayList<CartItem> listItem = new ArrayList<>();
        ArrayList<Order> listOrder = new ArrayList<>();
        OrderManager order = new OrderManager();
        if (session.getAttribute("user") != null) {
            User userSession = (User) session.getAttribute("user");
            listOrder = order.getAllOrderByUserID(userSession.getUserId());
            for (int i = 0; i < listOrder.size(); i++) {
                listItem.addAll(order.getAllProductByOrderID(listOrder.get(i).getOrderId()));
            }
            request.setAttribute("listOrderHistory", listOrder);
            request.setAttribute("orderDetails", listItem);
        }
        
        request.setAttribute("listReviewByRating1", listReviewByRating1);
        request.setAttribute("listReviewByRating2", listReviewByRating2);
        request.setAttribute("listReviewByRating3", listReviewByRating3);
        request.setAttribute("listReviewByRating4", listReviewByRating4);
        request.setAttribute("listReviewByRating5", listReviewByRating5);
        request.setAttribute("userList", userList);
        request.setAttribute("detail", p);
        request.getRequestDispatcher("./view/customer/product-detail.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
        //int reviewID = Integer.parseInt(request.getParameter("reviewID"));
        int pID = Integer.parseInt(request.getParameter("id"));
        long millis = System.currentTimeMillis();
        java.sql.Date reviewDate = new java.sql.Date(millis);
        User userSession = (User) session.getAttribute("user");
        int customerID = userSession.getUserId();
        String feedback = request.getParameter("feedback");
        double rating = Double.parseDouble(request.getParameter("rating"));
        ReviewManager reviewManager = new ReviewManager();
        if (request.getParameter("action") != null) {
            if ("add".equals(request.getParameter("action"))) {
                reviewManager.addReview(pID, customerID, feedback, reviewDate, rating);
            }
            if ("update".equals(request.getParameter("action"))) {

            }
        }
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
