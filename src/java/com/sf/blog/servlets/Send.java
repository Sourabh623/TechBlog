package com.sf.blog.servlets;

import com.email.durgesh.Email;
import com.sf.blog.entities.Message;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Send extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
              
              PrintWriter out= response.getWriter();
              response.setContentType("text/html");
        
        try {
            
            String s = request.getParameter("n1");
            String from = request.getParameter("n2");
            String pass = request.getParameter("n3");
            String companyname = request.getParameter("n4");
            String subject = request.getParameter("n5");
            String content = request.getParameter("n6");
            String receiver = request.getParameter("n7");
            
            Email mail = new Email(s, pass);
            
            mail.setFrom(from, companyname);
            
            mail.setSubject(subject);
            
            mail.setContent(content, "text/html");
            
            mail.addRecipient(receiver);
            //send the email
            mail.send();
            
            //set the message
            Message m=new Message("Email Succeessfully Send", "success", "alert-success");
            
            HttpSession se=request.getSession();
            
            se.setAttribute("msg", m);
            
            response.sendRedirect("admin_dashboard.jsp");
            
            
           
        } catch (Exception ex) {
          
            ex.printStackTrace();
            //set the message
            Message m=new Message("something went wrong", "error", "alert-danger");
            
            HttpSession se=request.getSession();
            
            se.setAttribute("msg", m);
            
            response.sendRedirect("admin_dashboard.jsp");
            
            
        }
    }

}
