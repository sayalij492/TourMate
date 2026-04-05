<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us - TourMate</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>


header{
    background: rgba(255, 255, 255, 0.60);
    padding: 10px 25px;
    position: fixed;
    top:0;
    width:100%;
    z-index: 1000;
}

/* Logo */
.logo {
    height: 70px;
    right: 2.7%;
    position: relative;
}

/* Navbar link styles */
.nav-link-custom {
    color: #e27528;
    font-weight: 500;
    margin-left: 20px;
    padding-bottom: 5px;
    border-bottom: 2px solid transparent;
    text-decoration: none;
}

.nav-link-custom:hover {
    border-bottom: 2px solid #e27528;
} 

/* Active Tab Underline */
.active-tab {
    border-bottom: 2px solid #e27528;
}

/* About Us Page Styling */
.about-header {
   background-image: url('https://img.freepik.com/premium-vector/landmark-travel-icon-set_24640-43425.jpg');
    height: 70vh;
    background-repeat: no-repeat;       
    background-position: center;        
    background-size: contain;            
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #3b2214;
    /* box-shadow: inset 0 0 0 2000px rgba(0,0,0,0.35); */
}

.about-header h1{
    font-size: 50px;
    top: 50%;
    position: relative;
    font-weight: bold;
    text-shadow: 0px 3px 6px rgba(0,0,0,0.4);
}

.section-title {
    text-align: center;
    font-size: 35px;
    font-weight: bold;
    color: #e27528;
    margin-top: 60px;
    margin-bottom: 20px;
}

/* About Content */
.about-box{
    background: #fff;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0px 4px 12px rgba(0,0,0,0.1);
    margin-bottom: 40px;
}

/* Icons Styling */
.icon-big{
    font-size: 50px;
    color: #e27528;
    margin-bottom: 10px;
}

/* Team Cards */
.team-card{
    border:none;
    box-shadow:0px 4px 10px rgba(0,0,0,0.1);
    border-radius: 15px;
    transition: transform 0.3s;
    margin-bottom: 30px;
}

.team-card:hover{
    transform: translateY(-5px);
}

.team-card h5{
    color: #3b2214; /* Footer background color */
    font-weight: bold;
}

/* Footer */
.footer-section {
    background:#3b2214;
    color:#fff;
    padding: 35px 10px;
    margin-top: 60px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
}

.footer-social a{
    color:white;
    margin:0 10px;
    font-size:20px;
}
</style>
</head>

<body>

<!-- Translator Icon -->
<div id="translate_icon" 
     style="position: fixed; top: 10px; right: 30px; z-index: 3000; cursor:pointer;">
    <i class="fa fa-language" style="font-size:27px; color:#e27528;"></i>
</div>

<div id="google_translate_element" 
     style="position: fixed; top: 65px; right: 20px; z-index: 2000; display:none;">
</div>

<script type="text/javascript">
function googleTranslateElementInit() {
    new google.translate.TranslateElement(
        {pageLanguage: 'en'},
        'google_translate_element'
    );
}

document.getElementById("translate_icon").onclick = function() {
    var box = document.getElementById("google_translate_element");
    box.style.display = (box.style.display === "none") ? "block" : "none";
};
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<!-- Header -->
<header>
    <nav class="d-flex justify-content-between align-items-center">
        <img src="images/logo.jpg" class="logo" alt="Logo">

        <div>
            <a href="index.jsp" class="nav-link-custom">Home</a>
            <a href="about.jsp" class="nav-link-custom active-tab">About</a>
            <a href="login.jsp" class="nav-link-custom">Login</a>
            <a href="register.jsp" class="nav-link-custom">Register</a>
        </div>
    </nav>
</header>

<!-- HERO / BANNER -->
<div class="about-header">
    <h1>About TourMate</h1>
</div>

<!-- WHO WE ARE -->
<h2 class="section-title">Who We Are</h2>
<div class="container">
    <div class="about-box">
        <p style="font-size:18px; color:#333; line-height:1.7;">
            TourMate is a dedicated tourism platform designed specially for those who want to 
            explore the true beauty of Maharashtra. From ancient forts of Chhatrapati Shivaji Maharaj 
            to peaceful beaches, waterfalls, temples, caves and heritage sites — we bring every 
            destination to your fingertips.
        </p>
        <p style="font-size:18px; color:#333; line-height:1.7;">
            Our mission is to provide trusted, easy-to-understand and authentic travel information 
            to help travelers experience Maharashtra like never before.
        </p>
    </div>
</div>

<!-- OUR MISSION / VISION -->
<h2 class="section-title">Our Mission & Vision</h2>
<div class="container">
    <div class="row text-center">

        <div class="col-md-4">
            <i class="fas fa-bullseye icon-big"></i>
            <h4>Our Mission</h4>
            <p>To guide every tourist with accurate travel information.</p>
        </div>

        <div class="col-md-4">
            <i class="fas fa-eye icon-big"></i>
            <h4>Our Vision</h4>
            <p>To become Maharashtra’s most trusted digital tourism companion.</p>
        </div>

        <div class="col-md-4">
            <i class="fas fa-map-marked-alt icon-big"></i>
            <h4>Our Goal</h4>
            <p>To cover every fort, cave, beach, temple and hidden gem of Maharashtra.</p>
        </div>

    </div>
</div>

<!-- OUR TEAM -->
<h2 class="section-title">Meet The Creators</h2>
<div class="container mb-5">
    <div class="row justify-content-center">

        <!-- Sayali -->
        <div class="col-md-3">
            <div class="team-card p-3 text-center bg-white">
                <h5>Sayali Jadhav</h5>
                <p><i class="fas fa-laptop-code"></i> <strong>Developer & Designer</strong></p>
                <p style="font-size:14px;">Created TourMate for easy and trusted travel guidance.</p>
            </div>
        </div>

        <!-- Sanika -->
        <div class="col-md-3">
            <div class="team-card p-3 text-center bg-white">
                <h5>Sanika Patil</h5>
                <p><i class="fas fa-book-reader"></i> <strong>Content Researcher</strong></p>
                <p style="font-size:14px;">Collected accurate and authentic travel data.</p>
            </div>
        </div>

        <!-- Kashish -->
        <div class="col-md-3">
            <div class="team-card p-3 text-center bg-white">
                <h5>Kashish Mulani</h5>
                <p><i class="fas fa-pencil-ruler"></i> <strong>UI Helper</strong></p>
                <p style="font-size:14px;">Helped improve layout and user interface.</p>
            </div>
        </div>

        <!-- Mansi -->
        <div class="col-md-3">
            <div class="team-card p-3 text-center bg-white">
                <h5>Mansi Kadam</h5>
                <p><i class="fas fa-check-circle"></i> <strong>Reviewer</strong></p>
                <p style="font-size:14px;">Reviewed pages for correctness & usability.</p>
            </div>
        </div>

    </div>
</div>


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

        <p class="footer-copy">© 2025 TourMate | Maharashtra Tourism Guide</p>
    </div>
</footer>

<!-- JS -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
