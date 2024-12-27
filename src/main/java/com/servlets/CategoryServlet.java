package com.servlets;

import com.entities.Category;
import com.entities.Users;
import com.helper.FactoryProvider;
import org.hibernate.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import org.hibernate.Session;



 import java.io.IOException;

public class CategoryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryName = request.getParameter("categoryName");
        HttpSession httpSession = request.getSession();
        Users currentUser = (Users) httpSession.getAttribute("currentUser");

        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Save the category to the database
        try (Session session = FactoryProvider.getFactory().openSession()) {
            Transaction tx = session.beginTransaction();
            Category category = new Category();
            category.setCategoryName(categoryName);
            category.setUser(currentUser);

            session.save(category);
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_category.jsp?error=Failed to create category");
            return;
        }

        response.sendRedirect("add_category.jsp?success=Category created successfully");
    }
}

