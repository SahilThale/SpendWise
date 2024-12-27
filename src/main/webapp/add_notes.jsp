<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List" %>
<%@ page import="com.entities.Category" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="com.helper.FactoryProvider" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_js_css.jsp"%>
</head>
<body>

	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>

		<h1>Please Fill Your Expense Detail</h1>
		<br>

		<!-- Fetch available categories from the database -->
		<%
			Session seion = FactoryProvider.getFactory().openSession();
			List<Category> categories = seion.createQuery("from Category", Category.class).list();
			seion.close();
		%>

		<!-- this is add form  -->

		<form action="SaveNoteServlet" method="post">

			<div class="form-group">
				<label for="title">Expense Title</label> 
				<input 
				name="title"
				required 
				type="text"
				class="form-control" 
				id="title" 
				aria-describedby="emailHelp"
				placeholder="Enter here" />
			</div>

			<div class="form-group">
				<label for="content">Expense Content</label>
				<textarea 
				name="content"
				required 
				id="content"
				placeholder="Enter your content here"				 
				class="form-control" 
				style="height: 300px;"		
					></textarea>
			</div>

			<!-- Category selection dropdown -->
			<div class="form-group">
				<label for="category">Select Category</label>
				<select class="form-control" name="category" id="category" required>
					<option value="">-- Select Category --</option>
					<%
						for (Category category : categories) {
					%>
							<option value="<%= category.getCategoryId() %>"><%= category.getCategoryName() %></option>
					<%
						}
					%>
				</select>
			</div>

			<div class="container text-center">
				<button type="submit" class="btn btn-primary" style="background:#000000;">Add</button>
			</div>

		</form>

	</div>

</body>
</html>
