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

import bean.DaftarEventBean;
import dao.DaftarEventDao;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Alif Danish
 */
public class DaftarEventServlet extends HttpServlet {

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
            out.println("<title>Servlet DaftarEventServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DaftarEventServlet at " + request.getContextPath() + "</h1>");
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
        
        String eventname = request.getParameter("eventname");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String phoneNo = request.getParameter("phoneNo");
        String rod = request.getParameter("rod");
        
        DaftarEventBean eventBean = new DaftarEventBean();
        
        eventBean.setEventname(eventname);
        eventBean.setFullname(fullname);
        eventBean.setEmail(email);
        eventBean.setPhoneno(phoneNo);
        eventBean.setRod(rod);
        
        DaftarEventDao eventDao = new DaftarEventDao();
        String daftareventRegistered = "null";
        
        try{
            daftareventRegistered = eventDao.daftarEvent(eventBean);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(RegisterKolamServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        if(daftareventRegistered.equals("SUCCESS")){
            request.setAttribute("errMessage", "You have successfully registered for " + eventname);
            request.getRequestDispatcher("/successevent.jsp").forward(request, response);//forwarding the request
        }
        else{
            request.getRequestDispatcher("/daftarevent.jsp").forward(request, response);
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
