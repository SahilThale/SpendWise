<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.entities.Category"%>
<%@ page import="com.helper.FactoryProvider"%>
<%@ page import="org.hibernate.Session"%>
<%@ page import="org.hibernate.Transaction"%>


<!DOCTYPE html>
<html>
<head>

<title>Add Category</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<div class="container">
	<%@include file="navbar.jsp"%>
		<br>
		<h2 class="my-4">Add a New Category</h2>

		<form action="CategoryServlet" method="post">
			<div class="form-group">
				<label for="categoryName">Category Name:</label> <input type="text"
					name="categoryName" class="form-control" id="categoryName" required>
			</div>
			<button type="submit" class="btn btn-primary">Add Category</button>
		</form>

		<!-- Optional: Display success or error message -->
		<c:if test="${param.success != null}">
			<div class="alert alert-success mt-3">${param.success}</div>
		</c:if>
		<c:if test="${param.error != null}">
			<div class="alert alert-danger mt-3">${param.error}</div>
		</c:if>
	</div>

</body>
</html>
