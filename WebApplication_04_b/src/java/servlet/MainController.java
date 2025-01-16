/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

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
//        try(PrintWriter out = response.getWriter()){
//            String txtUsername = request.getParameter("txtUsername");
//            String txtPassword = request.getParameter("txtPassword");
//            if(txtUsername.trim().length()==0 || txtPassword.trim().length()==0){
//                out.println("Please enter username or password!");
//                return;
//            }
//
//            if(txtPassword.trim().length()<8){
//                out.println("Password must be 8 characters!");
//                return;
//            }
//            
//            if(txtUsername.equals("admin") && txtPassword.equals("12345678")){
//                out.print("Login successfully!");
//                return;
//            } else {
//                out.print("Invalid");
//                return;
//            }
//        }
        PrintWriter out = response.getWriter();
        String txtUsername = request.getParameter("txtUsername");
        String txtPassword = request.getParameter("txtPassword");
        if(txtUsername.trim().length()==0){
            out.println("Please enter username");
            return;
        }
        if(txtPassword.trim().length()==0 && txtPassword.trim().length()<8){
            out.println("Password must be greater than 8 characters!");
            return;
        }
        
        if(txtUsername.equals("admin") && txtPassword.equals("12345678")){
            out.println("Login successfully");
            return;
        } else {
            out.println("Invalid");
            return;
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
