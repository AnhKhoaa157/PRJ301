/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ExamsDAO;
import dto.ExamsDTO;
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
@WebServlet(name = "ExamController", urlPatterns = {"/ExamController"})
public class ExamController extends HttpServlet {
    private static final String DASHBOARD_PAGE="dashboard.jsp";
    private static final String LOGIN_PAGE = "login.jsp";
    private ExamsDAO examsDAO = new ExamsDAO();

    private String processViewExams(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = DASHBOARD_PAGE;
        HttpSession session = request.getSession();
        if (AuthUtils.isLoggedIn(session)) {
            url = "exam.jsp"; // Trang mới để hiển thị danh sách bài kiểm tra
            String categoryIDStr = request.getParameter("categoryID");

            if (categoryIDStr != null) {
                try {
                    int categoryID = Integer.parseInt(categoryIDStr); // Lấy đúng categoryID kiểu int
                    List<ExamsDTO> examsList = examsDAO.searchExams(categoryID);
                    request.setAttribute("examsList", examsList);
                } catch (NumberFormatException e) {
                    request.setAttribute("error", "Invalid category ID");
                }
            } else {
                request.setAttribute("error", "Category ID is missing");
            }
        }
        return url;
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = DASHBOARD_PAGE;
        try{
            String action = request.getParameter("action");
            System.out.println("action" + action);
            if(action == null){
                url = DASHBOARD_PAGE;
            } else {
                if(action.equals("viewExams")){
                    url = processViewExams(request,response);
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
