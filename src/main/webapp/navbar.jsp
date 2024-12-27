<%@page import="javax.servlet.http.HttpSession"%>
<nav class="navbar navbar-expand-lg navbar-dark" style="background: #000000;">
    <a class="navbar-brand" href="index.jsp">Expense Tracker</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home
                    <span class="sr-only">(current)</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="add_notes.jsp">Add Expense</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="all_notes.jsp">Show Expenses</a>
            </li>

            <!-- Show 'Add Category' option only if the user is logged in -->
            <%
            HttpSession sessions = request.getSession(false); // Get the current session
            if (sessions != null && sessions.getAttribute("currentUser") != null) {
                // The user is logged in, show the 'Add Category' link
            %>
            <li class="nav-item">
                <a class="nav-link" href="add_category.jsp">Add Category</a>
            </li>
            <%
            }
            %>
        </ul>

        <!-- Search form -->
        <form class="form-inline my-2 my-lg-0" action="all_notes.jsp" method="get">
            <input class="form-control mr-sm-2" type="search" name="searchQuery" placeholder="Search by title or content"
                aria-label="Search" value="<%= request.getParameter("searchQuery") != null ? request.getParameter("searchQuery") : "" %>">
            <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
        </form>

        <!-- Authentication Links (Login/Logout) -->
        <ul class="navbar-nav ml-auto">
            <%
            if (session != null && session.getAttribute("currentUser") != null) {
                // The user is logged in, show the 'Logout' option
            %>
            <li class="nav-item">
                <a class="nav-link" href="LogoutServlet">Logout</a>
            </li>
            <%
            } else {
                // The user is not logged in, show the 'Login' option
            %>
            <li class="nav-item">
                <a class="nav-link" href="login.jsp">Login</a>
            </li>
            <%
            }
            %>
        </ul>
    </div>
</nav>
