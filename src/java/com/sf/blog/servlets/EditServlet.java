/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.sf.blog.servlets;

import com.sf.blog.dao.UserDao;
import com.sf.blog.entities.Message;
import com.sf.blog.entities.User;
import com.sf.blog.helper.ConnectionProvider;
import com.sf.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Admin
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

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
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fetch form new data
            String userName = request.getParameter("user_name");
            String userAbout = request.getParameter("user_about");
            String userEmail = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            Part part = request.getPart("image");
            String imageName = part.getSubmittedFileName();// ye method file ka name return krega with extension
            //old session fetch krenge
            HttpSession s = request.getSession();

            //old session ki value ko old user me store krenge
            User user = (User) s.getAttribute("currentUser");
            //ab user me new data replace krenge
            user.setName(userName);
            user.setAbout(userAbout);
            user.setEmail(userEmail);
            user.setPassword(userPassword);
            String oldFile=user.getProfile();
            user.setProfile(imageName);

            //ab user ka data set ho gaya new wala ab usko database me update krna hai
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());

            boolean ans = userDao.updateUser(user);

            if (ans) {
                
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                
                if(path!=null){
                }
                //delete code
                String pathOldFile = request.getRealPath("/") + "pics" + File.separator + oldFile;
                
                if(!oldFile.equals("default.png")){ 
                Helper.deleteFile(pathOldFile);
                }

                if (Helper.saveFile(part.getInputStream(), path))  {
                    
                    Message msg = new Message("update successfully done", "success", "alert-success");
                    s.setAttribute("msg", msg);
                    

                } else {
                    
                    Message msg = new Message("profile not updated", "error", "alert-danger");
                    s.setAttribute("msg", msg);
                }

            } else {
                Message msg = new Message("something went wrong", "error", "alert-danger");
                    s.setAttribute("msg", msg);
            }
            
            response.sendRedirect("profile.jsp");

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
