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
import javax.servlet.http.Part;
import java.text.SimpleDateFormat;
import bean.UpdateKolamBean;
import dao.UpdateKolamDao;
import java.text.ParseException;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
/**
 *
 * @author Alif Danish
 */
@WebServlet(name = "UpdateKolamServlet", urlPatterns = { "/UpdateKolamServlet" })
@MultipartConfig( maxFileSize = 16177216 )
public class UpdateKolamServlet extends HttpServlet {

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
            out.println("<title>Servlet EditPondServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet EditPondServlet at " + request.getContextPath() + "</h1>");
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
        
        String id = request.getParameter("id");
        String pondname = request.getParameter("pondname");
        String description = request.getParameter("description");
        String fee = request.getParameter("fee");
        
        Part image = request.getPart("image");
        
        UpdateKolamBean updatekolamBean = new UpdateKolamBean();
        
        updatekolamBean.setId(id);
        updatekolamBean.setPondname(pondname);
        updatekolamBean.setPondDesc(description);
        updatekolamBean.setFee(fee);
        
        if(image != null){
            System.out.println(image.getName());
            System.out.println(image.getSize());
            System.out.println(image.getContentType());
            
            updatekolamBean.setImage((Part) image);

        }
        
        UpdateKolamDao updatekolamDao = new UpdateKolamDao();
        String pondRegistered = "null";
        
        try{
            pondRegistered = updatekolamDao.editPond(updatekolamBean);
        }catch(ClassNotFoundException ex){
            Logger.getLogger(EditEventServlet.class.getName()).log(Level.SEVERE,null,ex);
        }
        if(pondRegistered.equals("SUCCESS")){
            request.setAttribute("errMessage", "You have successfully edited a new fishing pond");
            request.getRequestDispatcher("/viewPond.jsp").forward(request, response);//forwarding the request
        }
        else{
            request.getRequestDispatcher("/viewPond.jsp").forward(request, response);
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
