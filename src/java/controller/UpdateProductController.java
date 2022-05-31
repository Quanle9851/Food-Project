/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sample.product.VegetableDAO;
import sample.product.VegetableDTO;
import sample.product.VegetableError;

/**
 *
 * @author Bao
 */
@WebServlet(name = "UpdateProductController", urlPatterns = {"/UpdateProductController"})
public class UpdateProductController extends HttpServlet {

    private static final String ERROR = "SearchProductController";
    private static final String SUCCESS = "SearchProductController";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        VegetableError vegetableError = new VegetableError();
        try {
            String productID = request.getParameter("productID");
            String productName = request.getParameter("productName");
            String image = request.getParameter("image");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String categoryID = request.getParameter("categoryID");
            String importDate = request.getParameter("importDate");
            String usingDate = request.getParameter("usingDate");
            boolean checkValidation=true;
            
            if(categoryID.equalsIgnoreCase("Rau Cu") || categoryID.equalsIgnoreCase("Hoa Qua")){
                checkValidation=true;
            }else{
                vegetableError.setCategoryError("Category is wrong format!");
                checkValidation = false;
            }
            if(productName.length()<5 || productName.length()>20){
                vegetableError.setProductNameError("Name must be in 5-20");
                checkValidation = false;
            }
            if(price<=0){
                vegetableError.setPriceError("price must be rather than 0!");
                checkValidation = false;
            }
            if (importDate.compareToIgnoreCase(usingDate) > 0) {
                vegetableError.setUsingDateError("using date must be rather than import date!");
                checkValidation = false;
            }
            
            if(checkValidation){
            VegetableDAO dao = new VegetableDAO();
            VegetableDTO product = new VegetableDTO(productID, productName, image, price, quantity, categoryID, importDate, usingDate);
            boolean checkUpdate = dao.update(product);
            if(checkUpdate){
                url=SUCCESS;
            }
            }else{
                request.setAttribute("PRODUCT_ERROR", vegetableError);
            }

        } catch (Exception e) {
            log("Error at UpadateController:" +e.toString());
        }finally{
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
