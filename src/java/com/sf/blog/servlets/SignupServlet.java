package com.sf.blog.servlets;

import com.sf.blog.dao.UserDao;
import com.sf.blog.entities.Message;
import com.sf.blog.entities.User;
import com.sf.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@MultipartConfig
public class SignupServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            //fetch form all data
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String gender = request.getParameter("gender");
            String about = request.getParameter("user_about");
           
          

            //create user construtor
            User user = new User(name, email, password, gender, about);

            //create userdao obeject
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            //save data to the db
             
            
            if(dao.saveUser(user)){  
                
            Message msg=new Message("Signup Successfully Done", "success", "alert-success");       
            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);
            response.sendRedirect("signup_page.jsp");
            }
            else{
            Message msg=new Message("Something went wrong", "error", "alert-danger");   
            HttpSession s = request.getSession();
            s.setAttribute("msg", msg);
            response.sendRedirect("signup_page.jsp");
            }
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
