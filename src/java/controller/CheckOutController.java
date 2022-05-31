/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import sample.product.VegetableDTO;
import sample.product.VegetableError;
import sample.shopping.Cart;
import sample.shopping.OrderDAO;
import sample.users.UserDTO;

/**
 *
 * @author Bao
 */
@WebServlet(name = "CheckOutController", urlPatterns = {"/CheckOutController"})
public class CheckOutController extends HttpServlet {

    private static final String ERROR = "login.jsp";
    private static final String SUCCESS = "checkout.jsp";
    private static final String CART_EMPTY = "UploadController";
    private static final String QUANTITY_ERROR = "cart.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        HttpSession session = request.getSession();
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        Cart cart = (Cart) session.getAttribute("CART");
        List<VegetableError> listError = new ArrayList<>();
        List<VegetableDTO> listProduct = new ArrayList<>();
        OrderDAO dao = new OrderDAO();
        Random generator = new Random();
        double total = 0;
        String url = ERROR;

        try {
            boolean check = true;
            boolean checkError = true;
            if (cart == null) {
                request.setAttribute("MESSAGE", "Your cart has empty add product to check out!");
                checkError = false;
                url = CART_EMPTY;
            }
            if (cart.getCart().size() < 1) {
                request.setAttribute("MESSAGE", "Your cart has empty add product to check out!");
                checkError = false;
                url = CART_EMPTY;
            }
            if (loginUser == null) {
                request.setAttribute("ERROR", "Your need to login before check out product!");
                checkError = false;
                url = ERROR;
            }
            if (checkError) {
                for (VegetableDTO vegetable : cart.getCart().values()) {
                    String vegetableID = vegetable.getVegetableID();
                    String vegetableName = vegetable.getVegetableName();
                    int quantity = vegetable.getQuantity();
                    double price = vegetable.getPrice() * quantity;
                    boolean checkQuantity = dao.checkQuantity(vegetableID, quantity);
                    if (checkQuantity) {
                        listProduct.add(new VegetableDTO(vegetableID, vegetableName, "", price, quantity, "", "", ""));
                        total += price;
                        request.setAttribute("LIST_CHECKOUT", listProduct);
                    } else {
                        listError.add(new VegetableError("", "", "", "", vegetable.getVegetableName() + " quantity has not enought!", "", "", ""));
                        url = QUANTITY_ERROR;
                        check = false;
                    }
                }
            } else {
                check = false;
            }
            if (check) {
                String orderID = "";
                boolean checkID = false;
                do {
                    orderID = String.valueOf(generator.nextInt(9999999));
                    checkID = dao.checkOrderID(orderID);
                } while (checkID = false);
                boolean checkCreate = dao.createOrder(orderID, total, loginUser.getUserID());
                if (checkCreate) {
                    boolean success = true;
                    for (VegetableDTO product : listProduct) {
                        String detailID = "";
                        do {
                            detailID = String.valueOf(generator.nextInt(9999999));
                            checkID = dao.checkDetailID(detailID);
                        } while (checkID = false);
                        checkCreate = dao.createOrderDetail(detailID, orderID, product);
                        int quanpro = dao.getQuantity(product.getVegetableID());
                        int updateQuan = quanpro - product.getQuantity();
                        boolean checkUpdate = dao.updateQuantity(updateQuan, product.getVegetableID());
                        if (checkUpdate = false) {
                            success = false;
                        }
                    }
                    if (success) {
                        url = SUCCESS;
                    }
                }
            }
            request.setAttribute("LIST_ERROR", listError);
        } catch (Exception e) {
            log("Error at CheckOutController: " + e.toString());
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
