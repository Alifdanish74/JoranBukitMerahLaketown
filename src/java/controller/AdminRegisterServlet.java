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

import bean.AdminRegisterBean;
import dao.AdminRegisterDao;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Alif Danish
 * FOR LAKETOWN
 */
public class AdminRegisterServlet extends HttpServlet {

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
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
        
        String username = request.getParameter("name");
        String password = request.getParameter("password");
        String fullname = request.getParameter("fullname");
        
        AdminRegisterBean adminregisterBean = new AdminRegisterBean();
        adminregisterBean.setName(username);
        adminregisterBean.setPassword(password);
        adminregisterBean.setFullname(fullname);
        
        AdminRegisterDao adminregisterDao = new AdminRegisterDao();
        String userRegistered = "null";
        
    
        try{
            userRegistered = adminregisterDao.registerUser(adminregisterBean);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(AdminRegisterServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        if(userRegistered.equals("SUCCESS")){
            request.setAttribute("errMessage", "You have successfully register as admin");
            request.getRequestDispatcher("/adminlogin.jsp").forward(request, response);//forwarding the request
        }
        else{
            request.getRequestDispatcher("/adminregister.jsp").forward(request, response);
        }
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
