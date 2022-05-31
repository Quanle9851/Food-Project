/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Bao
 */
public class MainController extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String LOGIN = "Login";
    private static final String LOGIN_CONTROLLER = "LoginController";
    private static final String LOGOUT = "Logout";
    private static final String LOGOUT_CONTROLLER = "LogoutController";
    private static final String SEARCH = "Search";
    private static final String SEARCH_CONTROLLER = "SearchController";
    private static final String SEARCHPRODUCT = "SearchProduct";
    private static final String SEARCHPRODUCT_CONTROLLER = "SearchProductController";
    private static final String CREATE = "Create";
    private static final String CREATE_CONTROLLER = "CreateController";
    private static final String CREATEPRODUCT = "CreateProduct";
    private static final String CREATEPRODUCT_CONTROLLER = "CreateProductController";
    private static final String DELETEPRODUCT = "DeleteProduct";
    private static final String DELETEPRODUCT_CONTROLLER = "DeleteProductController";
    private static final String UPDATEPRODUCT = "UpdateProduct";
    private static final String UPDATEPRODUCT_CONTROLLER = "UpdateProductController";
    private static final String UPDATEUSER = "UpdateUser";
    private static final String UPDATEUSER_CONTROLLER = "UpdateUserController";
    private static final String UPLOAD = "Upload";
    private static final String UPLOAD_CONTROLLER = "UploadController";
    private static final String ADDPRODUCT = "AddProduct";
    private static final String ADDPRODUCT_CONTROLLER = "AddController";
    private static final String EDITPRODUCT = "EditProduct";
    private static final String EDITPRODUCT_CONTROLLER = "EditController";
    private static final String REMOVEPRODUCT = "RemoveProduct";
    private static final String REMOVEPRODUCT_CONTROLLER = "RemoveController";
    private static final String CHECKOUT = "CheckOut";
    private static final String CHECKOUT_CONTROLLER = "CheckOutController";
    private static final String SHOW = "Show";
    private static final String SHOW_CONTROLLER = "ShowProductController";
    private static final String REMOVE_CART = "RemoveCart";
    private static final String REMOVECART_CONTROLLER = "RemoveCartController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String action = request.getParameter("action");
            if (LOGIN.equals(action)) {
                url = LOGIN_CONTROLLER;
            } else if (LOGOUT.equals(action)) {
                url = LOGOUT_CONTROLLER;
            } else if (SEARCHPRODUCT.equals(action)) {
                url = SEARCHPRODUCT_CONTROLLER;
            } else if (CREATE.equals(action)) {
                url = CREATE_CONTROLLER;
            } else if (DELETEPRODUCT.equals(action)) {
                url = DELETEPRODUCT_CONTROLLER;
            } else if (UPDATEPRODUCT.equals(action)) {
                url = UPDATEPRODUCT_CONTROLLER;
            } else if (UPDATEUSER.equals(action)) {
                url = UPDATEUSER_CONTROLLER;
            } else if (UPLOAD.equals(action)) {
                url = UPLOAD_CONTROLLER;
            } else if (CREATEPRODUCT.equals(action)) {
                url = CREATEPRODUCT_CONTROLLER;
            } else if (ADDPRODUCT.equals(action)) {
                url = ADDPRODUCT_CONTROLLER;
            } else if (EDITPRODUCT.equals(action)) {
                url = EDITPRODUCT_CONTROLLER;
            } else if (REMOVEPRODUCT.equals(action)) {
                url = REMOVEPRODUCT_CONTROLLER;
            } else if (CHECKOUT.equals(action)) {
                url = CHECKOUT_CONTROLLER;
            } else if (SHOW.equals(action)) {
                url = SHOW_CONTROLLER;
            } else if (REMOVE_CART.equals(action)) {
                url = REMOVECART_CONTROLLER;
            } else if (SEARCH.equals(action)) {
                url = SEARCH_CONTROLLER;
            }
        } catch (Exception e) {
            log("Error at Main Controller: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
