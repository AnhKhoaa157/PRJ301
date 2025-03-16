/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamCategoriesDAO;
import dao.ExamsDAO;
import dto.ExamCategoriesDTO;
import dto.ExamsDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {
    private static final String LOGIN_PAGE = "login.jsp";
    private ExamCategoriesDAO examsctDAO = new ExamCategoriesDAO();
    
    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String txtUserName = request.getParameter("txtUserName");
        String strPassword = request.getParameter("txtPassword");
        if(AuthUtils.isValidLogin(txtUserName, strPassword)){
            url="dashboard.jsp";
            UserDTO user = AuthUtils.getUser(txtUserName);
            request.getSession().setAttribute("user",user); 
            
            //Search
            processSearch(request, response);
        }else {
            request.setAttribute("message", "Incorrect UserID or Password");
            url="login.jsp";  
        }
        return url;
    }
    
    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if(AuthUtils.isLoggedIn(session)){
            request.getSession().invalidate();
            url = "login.jsp";
        }
        return url;
    }
    
    public String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if(AuthUtils.isLoggedIn(session)){
            String searchTerm = request.getParameter("searchTerm");
            if(searchTerm == null){
                searchTerm = "";
            } else {
                searchTerm = searchTerm.trim();
            }
            url = "examCategories.jsp";
            List<ExamCategoriesDTO> examsCategories = examsctDAO.searchExamCategories(searchTerm);
            request.setAttribute("examsCategories", examsCategories);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try{
            String action = request.getParameter("action");
            System.out.println("action" + action);
            if(action == null){
                url = LOGIN_PAGE;
            } else {
                if(action.equals("login")){
                    url = processLogin(request, response);
                } else  if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")){
                    url = processSearch(request, response);
//                } else if (action.equals("delete")){
//                    url = processDelete(request, response);
//                } else if (action.equals("add")){
//                    url = processAdd(request, response);
//                } else if (action.equals("update")) {
//                    url = processUpdate(request, response);
                }    
            } 
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
