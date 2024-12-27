<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>ExpenseTracker - Manage Your Finances</title>
<%@include file="all_js_css.jsp"%>

<style>
.hero-section {
    min-height: 100vh;
    background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
    padding: 4rem 0;
}
.feature-card {
    transition: transform 0.3s ease;
    margin: 1rem;
    padding: 1.5rem;
}
.feature-card:hover {
    transform: translateY(-5px);
}
.cta-button {
    padding: 1rem 2rem;
    font-size: 1.2rem;
    border-radius: 30px;
    transition: all 0.3s ease;
    background: #007bff;
    color: white;
    border: none;
}
.cta-button:hover {
    background: #0056b3;
    transform: scale(1.05);
}
</style>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="navbar.jsp"%>
		
		<div class="hero-section">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-6">
						<h1 class="display-4 font-weight-bold mb-4">Take Control of Your Finances</h1>
						<p class="lead mb-4">Track, manage, and analyze your expenses with our intuitive expense tracking solution.</p>
						<a href="add_notes.jsp" class="cta-button text-decoration-none">Start Tracking Now</a>
					</div>
					<div class="col-lg-6">
						<img src="img/notepad.png" alt="Expense Tracking" class="img-fluid" style="max-width: 500px;">
					</div>
				</div>
				
				<div class="row mt-5">
					<div class="col-md-4">
						<div class="card feature-card shadow-sm">
							<div class="card-body text-center">
								<i class="fas fa-chart-line fa-3x mb-3 text-primary"></i>
								<h3>Easy Tracking</h3>
								<p>Record your expenses quickly and efficiently</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card feature-card shadow-sm">
							<div class="card-body text-center">
								<i class="fas fa-chart-pie fa-3x mb-3 text-primary"></i>
								<h3>Visual Reports</h3>
								<p>Get insights with detailed visual analytics</p>
							</div>
						</div>
					</div>
					<div class="col-md-4">
						<div class="card feature-card shadow-sm">
							<div class="card-body text-center">
								<i class="fas fa-mobile-alt fa-3x mb-3 text-primary"></i>
								<h3>Access Anywhere</h3>
								<p>Track expenses on any device, anytime</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>