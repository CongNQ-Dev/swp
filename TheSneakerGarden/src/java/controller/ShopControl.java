/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dbmanager.ProductManager;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ShopControl", urlPatterns = {"/shop"})
public class ShopControl extends HttpServlet {

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
        ProductManager manager = new ProductManager();
        ArrayList<Product> list = manager.getAllProduct();
        ArrayList<Product> list2 = new ArrayList<>();
        if (request.getParameter("bId") != null) {
            int bId = Integer.valueOf(request.getParameter("bId"));
            for (int i = 0; i < list.size(); i++) {
                if (list.get(i).getbId() == bId) {
                    list2.add(list.get(i));
                }
            }
            request.setAttribute("listProduct", list2);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else if (request.getParameter("tab") != null) {
            int tab = Integer.valueOf(request.getParameter("tab"));
            request.setAttribute("tab", tab);
            request.setAttribute("listProduct", list);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } else {
            //b2: set data to jsp
            request.setAttribute("listProduct", list);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
            //404 -> url
            //500 -> jsp properties
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
