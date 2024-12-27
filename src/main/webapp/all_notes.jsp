<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Category" %>
<%@ page import="com.entities.Note" %>
<%@ page import="com.entities.Users" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Expenses</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<h1>Your Expenses</h1>
		<br>

		<!-- Fetch available categories from the database -->
		<%
			Session seion = FactoryProvider.getFactory().openSession();
			List<Category> categories = seion.createQuery("from Category", Category.class).list();
			Users currentUser = (Users) request.getSession().getAttribute("currentUser");

			String selectedCategoryId = request.getParameter("category");
			String searchQuery = request.getParameter("search");

			// Build the query based on category or search input
			String hql = "FROM Note WHERE user = :user";
			if (selectedCategoryId != null && !selectedCategoryId.isEmpty()) {
				hql += " AND category.categoryId = :categoryId";
			}
			if (searchQuery != null && !searchQuery.isEmpty()) {
				hql += " AND (title LIKE :searchQuery OR content LIKE :searchQuery)";
			}

			// Create query object
			org.hibernate.query.Query<Note> query = seion.createQuery(hql, Note.class);
			query.setParameter("user", currentUser);

			if (selectedCategoryId != null && !selectedCategoryId.isEmpty()) {
				query.setParameter("categoryId", Integer.parseInt(selectedCategoryId));
			}
			if (searchQuery != null && !searchQuery.isEmpty()) {
				query.setParameter("searchQuery", "%" + searchQuery + "%");
			}

			// Fetch notes
			List<Note> notes = query.list();
			seion.close();
		%>

		<!-- Filter form: Category and Search -->
		<form action="all_notes.jsp" method="get">
			<div class="form-row">
				<!-- Category dropdown -->
				<div class="form-group col-md-4">
					<label for="category">Filter by Category</label>
					<select class="form-control" name="category" id="category">
						<option value="">-- All Categories --</option>
						<%
							for (Category category : categories) {
								// Maintain the selected category in the dropdown
								String selected = (selectedCategoryId != null && selectedCategoryId.equals(String.valueOf(category.getCategoryId()))) ? "selected" : "";
						%>
								<option value="<%= category.getCategoryId() %>" <%= selected %>><%= category.getCategoryName() %></option>
						<%
							}
						%>
					</select>
				</div>

				<!-- Search bar -->
				<div class="form-group col-md-6">
					<label for="search">Search Expenses</label>
					<input type="text" class="form-control" name="search" id="search" placeholder="Search by title or content" value="<%= searchQuery != null ? searchQuery : "" %>">
				</div>

				<!-- Submit button -->
				<div class="form-group col-md-2 align-self-end">
					<button type="submit" class="btn btn-primary">Apply Filters</button>
				</div>
			</div>
		</form>

		<!-- Display filtered notes -->
		<div class="row">
			<div class="col-12">
				<%
					if (notes.isEmpty()) {
						out.println("<p class='text-muted'>No expenses found.</p>");
					} else {
						for (Note note : notes) {
				%>
					<div class="card mt-3">
						<img class="card-img-top m-4 mx-auto" style="max-width:100px;" src="img/notepad.png" alt="Card image cap">
						<div class="card-body px-5">
							<h5 class="card-title"><%= note.getTitle() %></h5>
							<p class="card-text"><%= note.getContent() %></p>
							<p><b class="text-primary"><%= note.getAddedDate() %></b></p>
							<div class="container text-center mt-2">
								<a href="DeleteServlet?note_id=<%= note.getId() %>" class="btn btn-danger">Delete</a>
								<a href="edit.jsp?note_id=<%= note.getId() %>" class="btn btn-primary">Update</a>
							</div>
						</div>
					</div>
				<%
						}
					}
				%>
			</div>
		</div>

	</div>

</body>
</html>
