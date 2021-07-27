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

import bean.DaftarKolamBean;
import dao.DaftarKolamDao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author Alif Danish
 */
public class DaftarKolamServlet extends HttpServlet {

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
            out.println("<title>Servlet DaftarKolamServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DaftarKolamServlet at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        
        String pondname = request.getParameter("pondname");
        String fullname = request.getParameter("fullname");
        String phoneno = request.getParameter("phoneNo");
        String email = request.getParameter("email");
        String date = request.getParameter("bookingdate");
        
        Date bookingDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        
        try {
            //surround below line with try catch block as below code throws checked exception
             bookingDate = sdf.parse(date);
        } catch (ParseException ex) {
            Logger.getLogger(EditEventServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        DaftarKolamBean daftarkolamBean = new DaftarKolamBean();
        
        daftarkolamBean.setPondname(pondname);
        daftarkolamBean.setFullname(fullname);
        daftarkolamBean.setEmail(email);
        daftarkolamBean.setPhoneno(phoneno);
        daftarkolamBean.setBookingdate(bookingDate);
        
        DaftarKolamDao daftarkolamDao = new DaftarKolamDao();
        String kolamRegistered = "null";
        
        try{
            kolamRegistered = daftarkolamDao.daftarKolam(daftarkolamBean);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(EditEventServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        if(kolamRegistered.equals("SUCCESS")){
            request.setAttribute("errMessage", "You have successfully booking for " + pondname);
            request.getRequestDispatcher("/successkolam.jsp").forward(request, response);//forwarding the request
        }
        else{
            request.getRequestDispatcher("/daftarkolam.jsp").forward(request, response);
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
