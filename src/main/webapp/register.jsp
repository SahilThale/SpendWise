<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Register</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="form-container">
	<%@include file="navbar.jsp"%>
		<br>
		<h2>Register</h2>
		<form action="RegisterServlet" method="POST">
			<div class="input-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" required>
			</div>
			<div class="input-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required>
			</div>
			<div class="input-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required>
			</div>
			<div class="input-group">
				<label for="confirm_password">Confirm Password</label> <input
					type="password" id="confirm_password" name="confirm_password"
					required>
			</div>
			<button type="submit" class="btn">Register</button>
		</form>
		<p>
			Already have an account? <a href="login.jsp">Login here</a>
		</p>
	</div>
</body>
</html>