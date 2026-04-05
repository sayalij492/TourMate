<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Login - TourMate</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{
    background:#fff7ee;
    font-family:'Poppins',sans-serif;
}
header{
    background: rgba(255, 255, 255, 0.60);
    padding: 10px 25px;
    position: fixed;
    top:0;
    width:100%;
    z-index: 1000;
}
.logo { height: 70px; right: 2.7%; position: relative; }
.nav-link-custom {
    color: #e27528;
    font-weight: 500;
    margin-left: 20px;
    padding-bottom: 5px;
    border-bottom: 2px solid transparent;
    text-decoration: none;
}
.nav-link-custom:hover { border-bottom: 2px solid #e27528; }
.active-tab { border-bottom: 2px solid #e27528; }

.card-box{
    width: 62%;
    position: relative;
    top: 8em;
    left:18em;
    background:white;
    border-radius:25px;
    padding:40px;
    display:flex;
    justify-content:space-between;
    box-shadow:0 5px 20px rgba(0,0,0,0.15);
}
.left-box img{ width:380px; }
.right-box{ width:45%; }
.title{ font-size:45px; font-weight:bold; color:#633820; }
.btn-custom{
    width:100%;
    background:#e27528;
    border:none;
    color:white;
    padding:10px;
    font-size:18px;
    border-radius:8px;
}
.btn-custom:hover{ background:#e66a00; }
.link{ color:#e27528; font-weight:600; }

.footer-section {
    background:#3b2214;
    color:#fff;
    padding: 35px 10px;
    margin-top: 160px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
}
.footer-social a{
    color:white;
    margin:0 10px;
    font-size:20px;
}
</style>

<script>
function checkLogin(){
    let email = document.forms["loginForm"]["email"].value;
    let pwd = document.forms["loginForm"]["password"].value;
    if(email=="" || pwd==""){
        alert("Please fill all fields");
        return false;
    }
}
</script>
</head>

<body>

<header>
    <nav class="d-flex justify-content-between align-items-center">
        <img src="images/logo.jpg" class="logo" alt="Logo">
        <div>
            <a href="index.jsp" class="nav-link-custom">Home</a>
            <a href="aboutUs.jsp" class="nav-link-custom">About</a>
            <a href="login.jsp" class="nav-link-custom active-tab">Login</a>
            <a href="register.jsp" class="nav-link-custom">Register</a>
        </div>
    </nav>
</header>

<div class="card-box">
    <div class="left-box">
        <img src="https://cdn-icons-png.flaticon.com/512/201/201623.png">
    </div>

    <div class="right-box">
        <h1 class="title">Login</h1>

        <form name="loginForm" method="post" onsubmit="return checkLogin()">
            <input type="email" name="email" placeholder="Email" class="form-control mb-3">
            <input type="password" name="password" placeholder="Password" class="form-control mb-3">
            <button class="btn-custom" type="submit">Log In</button>
        </form>

        <br>
        <p>Don't have an account? <a href="register.jsp" class="link">Sign up</a></p>
    </div>
</div>

<%
if ("POST".equalsIgnoreCase(request.getMethod())) {

    String email = request.getParameter("email");
    String pass  = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/tourmate","root","VICK2909");

        PreparedStatement ps = con.prepareStatement(
            "SELECT id, name, role FROM users WHERE email=? AND password=?");
        ps.setString(1, email);
        ps.setString(2, pass);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            session.setAttribute("userId", rs.getInt("id"));
            session.setAttribute("userName", rs.getString("name"));
            session.setAttribute("role", rs.getString("role"));

            if ("ADMIN".equals(rs.getString("role"))) {
                response.sendRedirect("admin/dashboard.jsp");
            } else {
                response.sendRedirect("users/dashboard.jsp");
            }

        } else {
            out.println("<script>alert('Invalid Email or Password');</script>");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Server Error');</script>");
    }
}
%>

<footer class="footer-section">
    <div class="container text-center">
        <h3 class="footer-title">TourMate</h3>
        <p class="footer-tagline">Explore Maharashtra Like Never Before</p>
        <div class="footer-social">
            <a href="#"><i class="fab fa-facebook"></i></a>
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-youtube"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
        </div>
        <p class="footer-copy">© 2025 TourMate</p>
    </div>
</footer>

</body>
</html>
 