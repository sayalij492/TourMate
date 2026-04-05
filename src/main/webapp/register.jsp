<%@ page import="java.sql.*,
                 jakarta.mail.*,
                 jakarta.mail.internet.*,
                 java.util.*" %>

<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register - TourMate</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>
body{ background:#fff7ee; font-family:'Poppins',sans-serif; }

header{ background:rgba(255,255,255,0.60); padding:10px 25px; position:fixed; top:0; width:100%; z-index:1000; }

.logo{ height:70px; right:2.7%; position:relative; }

.nav-link-custom{ color:#e27528; font-weight:500; margin-left:20px; padding-bottom:5px; border-bottom:2px solid transparent; text-decoration:none; }
.nav-link-custom:hover{ border-bottom:2px solid #e27528; }
.active-tab{ border-bottom:2px solid #e27528; }

.card-box{ width:64%; position:relative; top:8em; left:17em; background:white; border-radius:25px; 
           box-shadow:0px 5px 20px rgba(0,0,0,0.15); padding:40px; display:flex; justify-content:space-between; }
.left-box{ width:45%; }
.right-box img{ width:380px; }
.title{ font-size:40px; font-weight:bold; color:#633820; }
.btn-custom{ width:100%; background:#e27528; border:none; color:white; padding:10px; font-size:18px; border-radius:8px; }
.btn-custom:hover{ background:#e66a00; }
.link{ color:#e27528; font-weight:600; }

.footer-section{ background:#3b2214; color:#fff; padding:35px 10px;
                 margin-top:160px; border-top-left-radius:30px; border-top-right-radius:30px; }
.footer-social a{ color:white; margin:0 10px; font-size:20px; }
</style>

<script>
function validateForm() {
    let name = document.forms["regForm"]["name"].value.trim();
    let email = document.forms["regForm"]["email"].value.trim();
    let pwd = document.forms["regForm"]["password"].value;

    if(name=="" || email=="" || pwd==""){
        alert("All fields are required");
        return false;
    }

    var re = /\S+@\S+\.\S+/;
    if(!re.test(email)){
        alert("Please enter a valid email");
        return false;
    }

    if(pwd.length < 6){
        alert("Password must be at least 6 characters");
        return false;
    }
    return true;
}
</script>

</head>
<body>

<!-- 🌎 Google Translator Icon -->
<div id="translate_icon" 
     style="position: fixed; top: 10px; right: 30px; z-index: 3000; cursor:pointer;">
    <i class="fa fa-language" style="font-size:27px; color:#e27528;"></i>
</div>

<div id="google_translate_element" 
     style="position: fixed; top: 65px; right: 20px; z-index: 2000; display:none;">
</div>

<script>
function googleTranslateElementInit() {
    new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
}

document.getElementById("translate_icon").onclick = function() {
    var box = document.getElementById("google_translate_element");
    box.style.display = (box.style.display === "none") ? "block" : "none";
};
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>


<!-- HEADER -->
<header>
    <nav class="d-flex justify-content-between align-items-center">
        <img src="images/logo.jpg" class="logo" alt="Logo">
        <div>
            <a href="index.jsp" class="nav-link-custom">Home</a>
            <a href="aboutUs.jsp" class="nav-link-custom">About</a>
            <a href="login.jsp" class="nav-link-custom">Login</a>
            <a href="register.jsp" class="nav-link-custom active-tab">Register</a>
        </div>
    </nav>
</header>

<div class="card-box">
    <div class="left-box">
        <h1 class="title">Create Account</h1><br>

        <form name="regForm" method="post" onsubmit="return validateForm()">
            <input type="text" name="name" placeholder="Full Name" class="form-control mb-3">
            <input type="email" name="email" placeholder="Email" class="form-control mb-3">
            <input type="password" name="password" placeholder="Password" class="form-control mb-3">
            <button class="btn-custom" type="submit">Register</button>
        </form>

        <br>
        <p>Already have an account? <a href="login.jsp" class="link">Login</a></p>
    </div>

    <div class="right-box">
        <img src="https://cdn-icons-png.flaticon.com/512/201/201623.png" alt="travel">
    </div>
</div>

<%
/* --------------- BACKEND: REGISTER + SEND EMAIL ---------------- */

if("POST".equalsIgnoreCase(request.getMethod())) {

    String name  = request.getParameter("name");
    String email = request.getParameter("email");
    String pass  = request.getParameter("password");

    if(name==null || email==null || pass==null || name.trim().isEmpty()
       || email.trim().isEmpty() || pass.isEmpty()) {
        out.println("<script>alert('All fields are required');</script>");
    } else {

        Connection con = null;
        PreparedStatement ps = null, check = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/tourmate","root","VICK2909"
            );

            /* Check duplicate email */
            check = con.prepareStatement("SELECT id FROM users WHERE email=?");
            check.setString(1, email);
            rs = check.executeQuery();

            if(rs.next()) {
                out.println("<script>alert('Email already registered'); window.location='login.jsp';</script>");
            }
            else {
                /* Insert new user */
                ps = con.prepareStatement("INSERT INTO users(name,email,password) VALUES(?,?,?)");
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, pass);
                ps.executeUpdate();

                /* ------------- SEND EMAIL ------------- */
                String host = "smtp.gmail.com";
                String mailUser = "sayalij492@gmail.com";
                String appPass  = "mvoxaxmmithgivzh";

                Properties props = new Properties();
                props.put("mail.smtp.host", host);
                props.put("mail.smtp.auth", "true");
                props.put("mail.smtp.starttls.enable", "true");
                props.put("mail.smtp.port", "587");

                Session mailSession = Session.getInstance(props,
                    new jakarta.mail.Authenticator() {
                        protected jakarta.mail.PasswordAuthentication getPasswordAuthentication() {
                            return new jakarta.mail.PasswordAuthentication(mailUser, appPass);
                        }
                });

                try {
                    MimeMessage msg = new MimeMessage(mailSession);
                    msg.setFrom(new InternetAddress(mailUser));
                    msg.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
                    msg.setSubject("Registration Successful - TourMate");

                    msg.setText(
                        "Dear " + name + ",\n\n" +
                        "Thank you for registering with TourMate!\n" +
                        "Your account has been created successfully.\n\n" +
                        "You can now login and explore amazing tourist places of Maharashtra.\n\n" +
                        "Warm Regards,\nTeam TourMate"
                    );

                    Transport.send(msg);
                } catch(Exception e) {
                    out.println("<script>alert('Registered but email sending failed'); window.location='login.jsp';</script>");
                    return;
                }

                response.sendRedirect("login.jsp?msg=Registration Successful! Login now.");
            }

        } catch(Exception e){
            out.println("<script>alert('Server error: "+e.getMessage().replace("'","")+"');</script>");
        } finally {
            try{ if(rs!=null) rs.close(); }catch(Exception e){}
            try{ if(check!=null) check.close(); }catch(Exception e){}
            try{ if(ps!=null) ps.close(); }catch(Exception e){}
            try{ if(con!=null) con.close(); }catch(Exception e){}
        }
    }
}
%>

<!-- FOOTER -->
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
 