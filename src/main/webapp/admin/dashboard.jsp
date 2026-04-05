<%@ page import="java.sql.*" %>
<%
    if(session.getAttribute("role")==null || 
       !"ADMIN".equals(session.getAttribute("role"))){
        response.sendRedirect("../login.jsp");
        return;
    }
%>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - TourMate</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
body{ font-family:'Poppins',sans-serif; background:#f6f6f6; }
header{ background: rgba(255,255,255,0.60); padding:10px 25px; position:fixed; top:0; width:100%; z-index:1000; }
.logo{ height:60px; }
.nav-link-custom{ color:#e27528; font-weight:500; margin-left:20px; text-decoration:none; }
.sidebar { width:250px; position:fixed; top:70px; left:0; bottom:0; background:#3b2214; color:#fff; padding:20px; }
.sidebar a{ color:#fff; display:block; padding:10px 8px; border-radius:6px; text-decoration:none; margin-bottom:6px; }
.sidebar a:hover{ background:#5a371f; text-decoration:none; }
.content { margin-left:270px; padding:100px 30px 40px 30px; }
.card-small{ border-radius:12px; box-shadow:0 6px 18px rgba(0,0,0,0.08); padding:18px; background:#fff; }
.table-wrap{ background:#fff; padding:20px; border-radius:12px; box-shadow:0 6px 18px rgba(0,0,0,0.06); }
.btn-del{ background:#ff4b4b; color:#fff; border:none; padding:6px 10px; border-radius:8px; }
.btn-del:hover{ opacity:0.9; }
.form-inline .form-control{ margin-right:8px; }
.footer-section{ background:#3b2214; color:#fff; padding:20px; margin-top:40px; border-radius:10px; }
</style>
</head>
<body>

<!-- Translator Icon -->
<div id="translate_icon" style="position: fixed; top:10px; right:30px; z-index:3000; cursor:pointer;">
    <i class="fa fa-language" style="font-size:20px; color:#e27528;"></i>
</div>
<div id="google_translate_element" style="position: fixed; top:45px; right:20px; z-index:2000; display:none;"></div>
<script type="text/javascript">
function googleTranslateElementInit(){ new google.translate.TranslateElement({pageLanguage:'en'}, 'google_translate_element'); }
document.getElementById("translate_icon").onclick = function(){ var box=document.getElementById("google_translate_element"); box.style.display=(box.style.display==='none')?'block':'none'; };
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
<script src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<!-- Header -->
<header>
    <nav class="d-flex justify-content-between align-items-center">
        <img src="images/logo.jpg" class="logo" alt="Logo">
        <div>
            <a href="index.jsp" class="nav-link-custom">View Site</a>
            <a href="#" class="nav-link-custom">Admin</a>
            <a href="logout.jsp" class="nav-link-custom">Logout</a>
        </div>
    </nav>
</header>

<!-- Left Sidebar -->
<div class="sidebar">
    <h4>Admin Menu</h4>
    <a href="#dashboard">Dashboard</a>
    <a href="#places">Manage Places</a>
    <a href="#spots">Manage Spots</a>
    <a href="#users">Manage Users</a>
</div>

<!-- Main Content -->
<div class="content">
    <div id="dashboard" class="mb-4">
        <div class="d-flex justify-content-between">
            <div class="card-small mr-3" style="width:30%;">
                <h5>Total Places</h5>
                <h2>
                <%
                    // count places
                    int totalPlaces = 0;
                    Connection c1=null; PreparedStatement p1=null; ResultSet r1=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        c1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                        p1 = c1.prepareStatement("SELECT COUNT(*) FROM places");
                        r1 = p1.executeQuery();
                        if(r1.next()) totalPlaces = r1.getInt(1);
                    } catch(Exception e){} finally { try{ if(r1!=null) r1.close(); }catch(Exception e){} try{ if(p1!=null) p1.close(); }catch(Exception e){} try{ if(c1!=null) c1.close(); }catch(Exception e){} }
                    out.print(totalPlaces);
                %>
                </h2>
            </div>
            <div class="card-small mr-3" style="width:30%;">
                <h5>Total Spots</h5>
                <h2>
                <%
                    int totalSpots=0;
                    Connection c2=null; PreparedStatement p2=null; ResultSet r2=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        c2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                        p2 = c2.prepareStatement("SELECT COUNT(*) FROM spots");
                        r2 = p2.executeQuery();
                        if(r2.next()) totalSpots = r2.getInt(1);
                    } catch(Exception e){} finally { try{ if(r2!=null) r2.close(); }catch(Exception e){} try{ if(p2!=null) p2.close(); }catch(Exception e){} try{ if(c2!=null) c2.close(); }catch(Exception e){} }
                    out.print(totalSpots);
                %>
                </h2>
            </div>
            <div class="card-small" style="width:30%;">
                <h5>Total Users</h5>
                <h2>
                <%
                    int totalUsers=0;
                    Connection c3=null; PreparedStatement p3=null; ResultSet r3=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        c3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                        p3 = c3.prepareStatement("SELECT COUNT(*) FROM users");
                        r3 = p3.executeQuery();
                        if(r3.next()) totalUsers = r3.getInt(1);
                    } catch(Exception e){} finally { try{ if(r3!=null) r3.close(); }catch(Exception e){} try{ if(p3!=null) p3.close(); }catch(Exception e){} try{ if(c3!=null) c3.close(); }catch(Exception e){} }
                    out.print(totalUsers);
                %>
                </h2>
            </div>
        </div>
    </div>

    <!-- Manage Places -->
    <div id="places" class="mb-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h3>Places</h3>
            <!-- Add place form (toggle) -->
            <button class="btn btn-sm btn-primary" onclick="document.getElementById('addPlace').classList.toggle('d-none')">Add Place</button>
        </div>

        <div id="addPlace" class="table-wrap mb-3 d-none">
            <form method="post" class="form-inline" action="adminDashboard.jsp">
                <input type="hidden" name="action" value="add_place">
                <input class="form-control" name="place_name" placeholder="Place Name" required>
                <input class="form-control" name="place_desc" placeholder="Short description" required>
                <input class="form-control" name="place_region" placeholder="Region (eg. Pune)" required>
                <button class="btn btn-success">Save</button>
            </form>
        </div>

        <div class="table-wrap">
            <table class="table table-striped">
                <thead><tr><th>ID</th><th>Name</th><th>Region</th><th>Action</th></tr></thead>
                <tbody>
                <%
                    String action = request.getParameter("action");
                    if("add_place".equalsIgnoreCase(action)){
                        String pn = request.getParameter("place_name");
                        String pd = request.getParameter("place_desc");
                        String pr = request.getParameter("place_region");
                        Connection ac=null; PreparedStatement ap=null;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            ac = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                            ap = ac.prepareStatement("INSERT INTO places(name,description,region) VALUES(?,?,?)");
                            ap.setString(1,pn); ap.setString(2,pd); ap.setString(3,pr);
                            ap.executeUpdate();
                            out.println("<script>window.location='adminDashboard.jsp#places';</script>");
                        }catch(Exception e){ out.println("<tr><td colspan='4'>Error: "+e.getMessage()+"</td></tr>"); }
                        finally{ try{ if(ap!=null) ap.close(); }catch(Exception e){} try{ if(ac!=null) ac.close(); }catch(Exception e){} }
                    }

                    if("delete_place".equalsIgnoreCase(request.getParameter("action"))){
                        String id = request.getParameter("id");
                        Connection dc=null; PreparedStatement dp=null;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            dc = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                            dp = dc.prepareStatement("DELETE FROM places WHERE id=?");
                            dp.setInt(1, Integer.parseInt(id));
                            dp.executeUpdate();
                            out.println("<script>window.location='adminDashboard.jsp#places';</script>");
                        }catch(Exception e){ out.println("<tr><td colspan='4'>Delete error: "+e.getMessage()+"</td></tr>"); }
                        finally{ try{ if(dp!=null) dp.close(); }catch(Exception e){} try{ if(dc!=null) dc.close(); }catch(Exception e){} }
                    }

                    // list places
                    Connection lc=null; PreparedStatement lp=null; ResultSet lr=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        lc = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");
                        lp = lc.prepareStatement("SELECT id,name,region FROM places ORDER BY id DESC");
                        lr = lp.executeQuery();
                        while(lr.next()){
                            out.println("<tr>");
                            out.println("<td>"+lr.getInt("id")
                                                        +"</td>");
                            out.println("<td>"+lr.getString("name")+"</td>");
                            out.println("<td>"+lr.getString("region")+"</td>");
                            out.println("<td><a href='adminDashboard.jsp?action=delete_place&id="+lr.getInt("id")+"' class='btn-del'>Delete</a></td>");
                            out.println("</tr>");
                        }
                    }catch(Exception e){
                        out.println("<tr><td colspan='4'>Error loading places: "+e.getMessage()+"</td></tr>");
                    }finally{
                        try{ if(lr!=null) lr.close(); }catch(Exception e){}
                        try{ if(lp!=null) lp.close(); }catch(Exception e){}
                        try{ if(lc!=null) lc.close(); }catch(Exception e){}
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Manage Spots -->
    <div id="spots" class="mb-4">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h3>Spots</h3>
            <button class="btn btn-sm btn-primary" onclick="document.getElementById('addSpot').classList.toggle('d-none')">Add Spot</button>
        </div>

        <!-- Add Spot Form -->
        <div id="addSpot" class="table-wrap mb-3 d-none">
            <form method="post" class="form-inline" action="adminDashboard.jsp">
                <input type="hidden" name="action" value="add_spot">
                <input class="form-control" name="place_id" placeholder="Place ID" required>
                <input class="form-control" name="spot_name" placeholder="Spot Name" required>
                <input class="form-control" name="spot_desc" placeholder="Description" required>
                <button class="btn btn-success">Save</button>
            </form>
        </div>

        <!-- Spot Table -->
        <div class="table-wrap">
            <table class="table table-striped">
                <thead><tr><th>ID</th><th>Place ID</th><th>Spot Name</th><th>Action</th></tr></thead>
                <tbody>
                <%
                    // Add spot
                    if("add_spot".equalsIgnoreCase(action)){
                        String pid = request.getParameter("place_id");
                        String sn = request.getParameter("spot_name");
                        String sd = request.getParameter("spot_desc");

                        Connection sc=null; PreparedStatement sp=null;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            sc = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");

                            sp = sc.prepareStatement("INSERT INTO spots(place_id,name,description) VALUES(?,?,?)");
                            sp.setInt(1, Integer.parseInt(pid));
                            sp.setString(2, sn);
                            sp.setString(3, sd);
                            sp.executeUpdate();

                            out.println("<script>window.location='adminDashboard.jsp#spots';</script>");
                        }catch(Exception e){
                            out.println("<tr><td colspan='4'>Error: "+e.getMessage()+"</td></tr>");
                        }finally{
                            try{ if(sp!=null) sp.close(); }catch(Exception e){}
                            try{ if(sc!=null) sc.close(); }catch(Exception e){}
                        }
                    }

                    // Delete spot
                    if("delete_spot".equalsIgnoreCase(request.getParameter("action"))){
                        String id = request.getParameter("id");
                        Connection dc=null; PreparedStatement dp=null;
                        try{
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            dc = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");

                            dp = dc.prepareStatement("DELETE FROM spots WHERE id=?");
                            dp.setInt(1, Integer.parseInt(id));
                            dp.executeUpdate();

                            out.println("<script>window.location='adminDashboard.jsp#spots';</script>");
                        }catch(Exception e){
                            out.println("<tr><td colspan='4'>Delete error: "+e.getMessage()+"</td></tr>");
                        }
                    }

                    // Load spots
                    Connection sConn=null; PreparedStatement sPs=null; ResultSet sRs=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        sConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");

                        sPs = sConn.prepareStatement("SELECT id,place_id,name FROM spots ORDER BY id DESC");
                        sRs = sPs.executeQuery();

                        while(sRs.next()){
                            out.println("<tr>");
                            out.println("<td>"+sRs.getInt("id")+"</td>");
                            out.println("<td>"+sRs.getInt("place_id")+"</td>");
                            out.println("<td>"+sRs.getString("name")+"</td>");
                            out.println("<td><a class='btn-del' href='adminDashboard.jsp?action=delete_spot&id="+sRs.getInt("id")+"'>Delete</a></td>");
                            out.println("</tr>");
                        }
                    }catch(Exception e){
                        out.println("<tr><td colspan='4'>Error loading spots: "+e.getMessage()+"</td></tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Manage Users -->
    <div id="users" class="mb-4">
        <h3>Users</h3>
        <div class="table-wrap">
            <table class="table table-striped">
                <thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Action</th></tr></thead>
                <tbody>
                <%
                    Connection uConn=null; PreparedStatement uPs=null; ResultSet uRs=null;
                    try{
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        uConn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tourmate","root","VICK2909");

                        uPs = uConn.prepareStatement("SELECT id,name,email FROM users WHERE role='user'");
                        uRs = uPs.executeQuery();

                        while(uRs.next()){
                            out.println("<tr>");
                            out.println("<td>"+uRs.getInt("id")+"</td>");
                            out.println("<td>"+uRs.getString("name")+"</td>");
                            out.println("<td>"+uRs.getString("email")+"</td>");
                            out.println("<td><a class='btn-del' href='deleteUser.jsp?id="+uRs.getInt("id")+"'>Delete</a></td>");
                            out.println("</tr>");
                        }
                    }catch(Exception e){
                        out.println("<tr><td colspan='4'>Error loading users: "+e.getMessage()+"</td></tr>");
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer-section text-center">
        <p>© 2025 TourMate Admin • Designed with ❤ in Maharashtra</p>
    </div>

</div> <!-- end content -->

</body>
</html>