package com.servlets;

import com.entities.Users;
import com.helper.FactoryProvider;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");  // Password entered by the user

        Session session = null;
        try {
            session = FactoryProvider.getFactory().openSession();
            Transaction tx = session.beginTransaction();

            // Fetch user based on email
            Users user = (Users) session.createQuery("FROM Users WHERE email = :email")
                                        .setParameter("email", email)
                                        .uniqueResult();
            tx.commit();

            // Directly compare the passwords (both should be in plain text)
            if (user != null && user.getPassword().equals(password)) {
                // Successful login
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("currentUser", user);
                response.sendRedirect("index.jsp");
            } else {
                // Invalid login attempt
                response.sendRedirect("login.jsp?error=Invalid email or password");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=An error occurred. Please try again.");
        } finally {
            if (session != null) {
                session.close();
            }
        }
    }
}
