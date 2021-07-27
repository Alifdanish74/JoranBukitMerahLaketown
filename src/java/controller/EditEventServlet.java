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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

import bean.EditEventBean;
import dao.EditEventDao;
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
@WebServlet(name = "EditEventServlet", urlPatterns = { "/EditEventServlet" })
@MultipartConfig( maxFileSize = 16177216 )
public class EditEventServlet extends HttpServlet {

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
            out.println("<title>Servlet EditEventServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditEventServlet at " + request.getContextPath() + "</h1>");
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
        List errorMsgs = new LinkedList();
        
        String eventname = request.getParameter("eventname");
        String description = request.getParameter("desc");
        String tarikh = request.getParameter("tarikh");
        String location = request.getParameter("location");
        
        Part image = request.getPart("image");
        
        Date eventDate = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            //surround below line with try catch block as below code throws checked exception
             eventDate = sdf.parse(tarikh);
        } catch (ParseException ex) {
            Logger.getLogger(EditEventServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        EditEventBean editeventBean = new EditEventBean();
        editeventBean.setEventname(eventname);
        editeventBean.setEventDesc(description);
        editeventBean.setLocation(location);
        editeventBean.setTarikh(eventDate);
        
        if(image != null){
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
            
            editeventBean.setImage((Part) image);

        }
        
        EditEventDao editeventDao = new EditEventDao();
        String eventRegistered = "null";
        
        try{
            eventRegistered = editeventDao.editEvent(editeventBean);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(EditEventServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        if(eventRegistered.equals("SUCCESS")){
            request.setAttribute("errMessage", "You have successfully added an event");
            request.getRequestDispatcher("/viewEvent.jsp").forward(request, response);//forwarding the request
        }
        else{
            request.getRequestDispatcher("/viewEvent.jsp").forward(request, response);
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
