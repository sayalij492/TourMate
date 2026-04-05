<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>

<!-- Bootstrap CSS -->
<link rel="stylesheet" 
href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<style>

/* Transparent White Header */
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

/* Hero Section */
.main-section{
    background: url('https://th.bing.com/th/id/R.d991edc31349535969c2b5f42cf0c882?rik=HXIwX2YcUd0PxQ&riu=http%3a%2f%2fbharatbhramanti.com%2fwp-content%2fuploads%2f2018%2f08%2fmaharashtra.jpg&ehk=09%2fzmo0GI76PRwsYxeUMqLpLJp5zjfsBF6UiVsfD%2fso%3d&risl=&pid=ImgRaw&r=0') no-repeat center;
    height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
}

/* Main Heading */
.main-section h1{
    font-size: 50px;
    position: absolute;
    color: #754118;
    top: 395px;
    left: 770px;
    font-weight: bold;
}

/* Explore Now Button */
.explore-btn{
    font-weight: bold;
    color: white !important;
    background-color: #e27528;
    border: none;
    position: absolute;
    top: 545px;
    padding: 8px;
    right: 335px;
}

/* New Sections Styling */
.section-title {
    text-align: center;
    font-size: 35px;
    font-weight: bold;
    color: #e27528;
    margin-top: 60px;
    margin-bottom: 20px;
}

.card-custom {
    border-radius: 10px;
    overflow: hidden;
    border: none;
    box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
}

.card-custom img {
    height: 180px;
    object-fit: cover;
}


.footer-section {
    background:#3b2214;
            color:#fff;
    padding: 35px 10px;
    /* color: white; */
    margin-top: 60px;
    border-top-left-radius: 30px;
    border-top-right-radius: 30px;
}

.footer-title {
    font-size: 28px;
    font-weight: bold;
    margin-bottom: 8px;
}

.footer-tagline {
    font-size: 14px;
    opacity: 0.9;
}

.footer-social a {
    color: white;
    font-size: 22px;
    margin: 0 12px;
    transition: 0.3s;
}

.footer-social a:hover {
    color: #ffe7d1;
    transform: scale(1.2);
}

.footer-copy {
    margin-top: 15px;
    font-size: 13px;
    opacity: 0.8;
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
            <a href="index.jsp" class="nav-link-custom active-tab">Home</a>
            <a href="aboutUs.jsp" class="nav-link-custom">About</a>
            <a href="login.jsp" class="nav-link-custom">Login</a>
            <a href="register.jsp" class="nav-link-custom">Register</a>
        </div>
    </nav>
</header>


<!-- HERO SECTION -->
<section class="main-section">
    <div>
        <h1>Start Your Maharashtra Tour With Us</h1>
        <a href="login.jsp" class="explore-btn">
            Explore Now
        </a>
    </div>
</section>


<!-- WHY CHOOSE US -->
<h2 class="section-title">Why Choose TourMate?</h2>
<div class="container">
    <div class="row text-center">
        <div class="col-md-4">
            <h4>✔ Trusted Information</h4>
            <p>We provide accurate details of forts, temples, museums, waterfalls, and heritage sites.</p>
        </div>

        <div class="col-md-4">
            <h4>✔ Easy to Use</h4>
            <p>Simple interface to explore destinations, routes, history and travel tips.</p>
        </div>

        <div class="col-md-4">
            <h4>✔ 100% Maharashtra</h4>
            <p>Dedicated platform focused only on Maharashtra tourism.</p>
        </div>
       
    </div>
</div>


<!-- TOP CATEGORIES -->
<h2 class="section-title">Top Categories</h2>
<div class="container">
    <div class="row">

        <div class="col-md-3 mb-4">
            <div class="card card-custom">
                <img src="https://tse4.mm.bing.net/th/id/OIP.lUWJ5OtNa_pDLDT1p96DWgHaE5?rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
                <div class="p-3">
                    <h5>Forts</h5>
                    <p>Explore Shivaji Maharaj's historic forts.</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card card-custom">
                <img src="https://1.bp.blogspot.com/-Rgza9hvGQKk/XLbC7E16FSI/AAAAAAABWXs/vFyrEhEbQakCRdLhyo0atz6OJi8dC_10gCEwYBhgL/s1600/2018-04-28.jpg" alt="">
                <div class="p-3">
                    <h5>Temples</h5>
                    <p>Visit ancient temples with rich culture.</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card card-custom">
                <img src="https://www.trawell.in/admin/images/upload/79493472Satara_Thoseghar_Falls_Main.jpg" alt="">
                <div class="p-3">
                    <h5>Waterfalls</h5>
                    <p>Beautiful waterfalls to refresh your adventure.</p>
                </div>
            </div>
        </div>

        <div class="col-md-3 mb-4">
            <div class="card card-custom">
                <img src="https://tse3.mm.bing.net/th/id/OIP.RMubYsB91CHhLMroC-fWDwHaFj?rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
                <div class="p-3">
                    <h5>Heritage</h5>
                    <p>Explore museums & historical structures.</p>
                </div>
            </div>
        </div>
        <div class="col-md-3 mb-4">
    <div class="card card-custom">
        <img src="https://media-cdn.tripadvisor.com/media/attractions-splice-spp-720x480/06/6e/b4/2e.jpg" alt="">
        <div class="p-3">
            <h5>Caves</h5>
            <p>Discover Ajanta, Ellora & ancient rock-cut caves.</p>
        </div>
    </div>
</div>

<div class="col-md-3 mb-4">
    <div class="card card-custom">
        <img src="https://tse1.mm.bing.net/th/id/OIP._Gd1RlIt8JVVZSd-NmD7PQHaE7?rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
        <div class="p-3">
            <h5>Beaches</h5>
            <p>Relax at Alibaug, Tarkarli, and Konkan beaches.</p>
        </div>
    </div>
</div>

<div class="col-md-3 mb-4">
    <div class="card card-custom">
        <img src="https://tse4.mm.bing.net/th/id/OIP.iyBSC7TRC7WLi3xYqU1GRAHaE7?rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
        <div class="p-3">
            <h5>Hill Stations</h5>
            <p>Visit Mahabaleshwar, Lonavala and Matheran.</p>
        </div>
    </div>
</div>
    </div>
</div>


<!-- POPULAR DESTINATIONS -->
<h2 class="section-title">Popular Destinations</h2>
<div class="container mb-5">
    <div class="row">

        <div class="col-md-4 mb-4">
            <div class="card card-custom">
                <img src="https://1.bp.blogspot.com/-fN6jo-4SG30/XyPkGT6yjEI/AAAAAAAADSo/CW34tZt8lhAnFg5xaVht3MPOI99HPHtlwCLcBGAsYHQ/s1350/d53781ce1686e11c2ee25a93f27c0653.jpg" alt="">
                <div class="p-3">
                    <h5>Raigad Fort</h5>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card card-custom">
                <img src="https://www.travellersofindia.com/wp-content/uploads/2023/05/Mahuli_fort_trek_featuredimage_travellersofindia.jpg" alt="">
                <div class="p-3">
                    <h5>Mahuli Fort</h5>
                </div>
            </div>
        </div>

        <div class="col-md-4 mb-4">
            <div class="card card-custom">
                <img src="https://static.toiimg.com/photo/imgsize-117461,msid-76824355/76824355.jpg" alt="">
                <div class="p-3">
                    <h5>Siddhivinayak Temple</h5>
                </div>
            </div>
        </div>
        <div class="col-md-4 mb-4">
    <div class="card card-custom">
        <img src="https://tse2.mm.bing.net/th/id/OIP.E2RN_wesbc_HbsKB5jgMpgAAAA?rs=1&pid=ImgDetMain&o=7&rm=3" alt="">
        <div class="p-3">
            <h5>Pratapgad Fort</h5>
        </div>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card card-custom">
        <img src="https://media-cdn.tripadvisor.com/media/photo-s/04/68/21/67/bhandardara-lake-lake.jpg" alt="">
        <div class="p-3">
            <h5>Bhandardara Lake</h5>
        </div>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card card-custom">
        <img src="https://th.bing.com/th/id/R.c5fe1ee7e2957fb97744eb6ae390146c?rik=fkQLSrHu96L09A&riu=http%3a%2f%2fdhramshala.in%2fwp-content%2fuploads%2f2023%2f10%2fShirdi-Sai-Baba-Temple-Shirdi.jpg&ehk=CEEjqMwQCB5SvThaHxa7EO9y47XsQijkr3VKx0P8IOU%3d&risl=&pid=ImgRaw&r=0" alt="">
        <div class="p-3">
            <h5>Shirdi Sai Temple</h5>
        </div>
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

<script>
    const links = document.querySelectorAll('.nav-link-custom');
    links.forEach(link => {
        link.addEventListener('click', function() {
            links.forEach(l => l.classList.remove('active-tab'));
            this.classList.add('active-tab');
        });
    });
</script>

</body>
</html>
  
   