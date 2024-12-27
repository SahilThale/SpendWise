package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.entities.Users; // Import User class
import com.entities.Category; // Import Category class
import com.helper.FactoryProvider;

public class SaveNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveNoteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Fetch title and content from the request
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // Fetch category ID from the request
            int categoryId = Integer.parseInt(request.getParameter("category"));

            // Get the logged-in user from session
            HttpSession httpSession = request.getSession();
            Users currentUser = (Users) httpSession.getAttribute("currentUser");

            if (currentUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // Get the selected category from the database
            Session s = FactoryProvider.getFactory().openSession();
            Category category = s.get(Category.class, categoryId); // Fetch category by ID

            // Create Note object with user and category
            Note note = new Note(title, content, new Date(), currentUser, category);

            // Hibernate save operation
            Transaction tx = s.beginTransaction();
            s.save(note);
            tx.commit();
            s.close();

            // Send response
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h1 style='text-align:center;'>Note is added successfully</h1>");
            out.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
