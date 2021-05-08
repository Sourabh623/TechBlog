package com.sf.blog.servlets;

import com.email.durgesh.Email;
import com.sf.blog.dao.ContactDao;
import com.sf.blog.entities.Contact;
import com.sf.blog.entities.Message;
import com.sf.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ContactServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            String name = request.getParameter("name");
            String surname = request.getParameter("surname");
            String email = request.getParameter("email");
            Long number = Long.parseLong(request.getParameter("number"));
            String message = request.getParameter("message");

            //create contact object and setting the data
            Contact contact = new Contact(name, surname, email, number, message);

            ContactDao cdao = new ContactDao(ConnectionProvider.getConnection());

            if (cdao.AddContact(contact)) {

                //set email from contact from
                try {
                    Email e = new Email("email_here", "password_your_email_here");

                    e.setFrom("sourabhfulmali623@gmail.com", "Tech Blog:");

                    e.setSubject(email);

                    e.setContent(message, "text/html");

                    e.addRecipient("sourabhfulmali08@gmail.com");

                    e.send();

                    //set the message
                    Message m = new Message("Email Succeessfully Send", "success", "alert-success");

                    HttpSession se = request.getSession();

                    se.setAttribute("msg", m);

                    response.sendRedirect("contact.jsp");

                } catch (Exception e) {
                    out.println("<h1>" + e + "</h1>");
                    e.printStackTrace();
                }

            } else {

                Message m = new Message("Message not send", "error", "alert-danger");
                HttpSession s = request.getSession();
                s.setAttribute("msg", m);
                response.sendRedirect("contact.jsp");
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
