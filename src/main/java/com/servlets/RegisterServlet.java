package com.servlets;

import com.entities.Users;
import com.helper.FactoryProvider;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;


import java.io.IOException;

public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Get data from the form
	    String username = request.getParameter("username");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");

	    // Basic validation
	    if (username == null || username.isEmpty() || email == null || email.isEmpty() || password == null || password.isEmpty()) {
	        response.sendRedirect("register.jsp?error=All fields are required");
	        return;
	    }

	    // Check if email already exists
	    Session session = FactoryProvider.getFactory().openSession();
	    Users existingUser = (Users) session.createQuery("FROM Users WHERE email = :email")
	                                      .setParameter("email", email)
	                                      .uniqueResult();

	    if (existingUser != null) {
	        session.close();
	        response.sendRedirect("register.jsp?error=Email already registered");
	        return;
	    }

	    // Create and save the new user
	    Users user = new Users();
	    user.setUsername(username);
	    user.setEmail(email);
	    user.setPassword(password);

	    Transaction tx = session.beginTransaction();
	    session.save(user);
	    tx.commit();
	    session.close();

	    // Redirect to login page
	    response.sendRedirect("login.jsp?success=Registration successful");
	}

}
