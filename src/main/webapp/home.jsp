<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodexpress.model.User"%>

<%@ page import="java.sql.*"%>
<%@ page import="com.foodexpress.util.DBConnection"%>

<%
User user = (User) session.getAttribute("user");

if (user == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<%
int restaurantCount = 0;
int menuCount = 0;
int orderCount = 0;

try {

    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 =
        con.prepareStatement("SELECT COUNT(*) FROM restaurants");

    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){
        restaurantCount = rs1.getInt(1);
    }

    PreparedStatement ps2 =
        con.prepareStatement("SELECT COUNT(*) FROM menu");

    ResultSet rs2 = ps2.executeQuery();

    if(rs2.next()){
        menuCount = rs2.getInt(1);
    }

    PreparedStatement ps3 =
        con.prepareStatement(
        "SELECT COUNT(*) FROM orders WHERE user_id=?");

    ps3.setInt(1, user.getUserId());

    ResultSet rs3 = ps3.executeQuery();

    if(rs3.next()){
        orderCount = rs3.getInt(1);
    }

} catch(Exception e){
    e.printStackTrace();
}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress Dashboard</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body{
    background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
    
    
    min-height: 100vh;
}

/* Navbar */
.navbar {
	background: linear-gradient(135deg, #0F172A, #1E293B);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 30px 40px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	position: sticky;
	top: 0;
	z-index: 1000;
}

.logo {
	color: #FBBF24;
	font-size: 48px;
	font-weight: 800;
	letter-spacing: 1px;
}

.logout-nav {
	background: linear-gradient(135deg, #F59E0B, #FBBF24);
	color: #0F172A;
	text-decoration: none;
	padding: 14px 28px;
	border-radius: 12px;
	font-weight: 700;
	transition: 0.3s;
}

.logout-nav:hover {
	box-shadow: 0 10px 20px rgba(245, 158, 11, 0.35);
	transform: translateY(-2px) scale(1.03);
}

/* Main Container */
.container {
	max-width: 1200px;
	margin: auto;
	padding: 60px 20px 40px;
}

/* Hero */
.hero-text {
	text-align: center;
	margin-bottom: 25px;
}

.hero-text h1 {
	font-size: 60px;
	font-weight: 800;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.hero-text p {
	margin-top: 10px;
	color: #0F172A;
	font-size: 22px;
	font-weight: 500;
}

/* Welcome Card */
.welcome-card {
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	border-radius: 24px;
	width: 100%;
	padding: 60px;
	text-align: center;
	margin-bottom: 35px;
	box-shadow: 0 20px 50px rgba(124, 58, 237, 0.25);
	padding: 60px;
}

.welcome-card h1 {
	color: white;
	font-size: 48px;
	margin-bottom: 12px;
}

.welcome-card p {
	color: rgb(0, 0, 0);
	font-size: 18px;
}

/* Info Cards */
.info-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
	gap: 20px;
	margin-bottom: 30px;
}

.info-card {
	background: white;
	border-radius: 20px;
	padding: 25px;
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
	border:1px solid blue;
}

.info-card:hover {
	transform: translateY(-8px);
	box-shadow: 0 20px 40px rgba(37, 99, 235, 0.15);
}

.info-card h3 {
	color: blue;
	margin-bottom: 12px;
	font-size: 18px;
}

.info-card p {
	color: #1E293B;
	font-size: 22px;
	font-weight: 700;
}

/* Section Title */
.section-title {
	text-align: center;
	font-size: 44px;
	margin: 55px 0 35px;
	
	
	color:orange;
	font-weight: 800;
}

/* Menu Cards */
.menu-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
	gap: 25px;
}

.menu-card {
	background: white;
	border-radius: 20px;
	border:1px solid blue;
	padding: 30px;
	
	text-align: center;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
	min-height: 140px;
}

.menu-card:hover {


	transform: translateY(-10px);
	box-shadow: 0 25px 50px rgba(124, 58, 237, 0.20);
}

.menu-card h3 {
	
	color:black;
	margin-bottom: 18px;
	font-size: 28px;
	font-weight: 700;
}

.menu-card a {
	display: inline-block;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	text-decoration: none;
	padding: 12px 28px;
	border-radius: 12px;
	font-weight: 600;
	transition: 0.3s;
}

.menu-card a:hover {
	transform: scale(1.05);
}

/* Footer */
.footer{
    margin-top:25px;
   	background: linear-gradient(135deg, #0F172A, #1E293B);
    color:white;
    position:relative;
    overflow:hidden;
}

.footer-wave{
    height:8px;
    background:linear-gradient(90deg,#FBBF24,#F59E0B,#FBBF24);
}

.footer-content{
    max-width:1200px;
    margin:auto;
    padding:55px 20px;
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(230px,1fr));
    gap:40px;
}

.footer-box h2,
.footer-box h3{
    color:#FBBF24;
    margin-bottom:18px;
}

.footer-box p{
    color:#E5E7EB;
    line-height:1.8;
    margin:8px 0;
}

.footer-box a{
    display:block;
    color:#E5E7EB;
    text-decoration:none;
    margin:10px 0;
    transition:.3s;
}

.footer-box a:hover{
    color:#FBBF24;
    transform:translateX(8px);
}

.social-icons{
    display:flex;
    gap:15px;
    margin-top:20px;
}

.social-icons span{
    width:50px;
    height:50px;
    display:flex;
    align-items:center;
    justify-content:center;
    border-radius:50%;
    background:rgba(255,255,255,.12);
    font-size:22px;
    cursor:pointer;
    transition:.3s;
}

.social-icons span:hover{
    background:#FBBF24;
    transform:translateY(-8px) scale(1.1);
}

.copyright{
    text-align:center;
    padding:22px;
    border-top:1px solid rgba(255,255,255,.15);
    color:#CBD5E1;
    font-size:18;
}

.navbar {
	background: linear-gradient(135deg, #0F172A, #1E293B);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 25px 40px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
}

.logo {
	color: #FBBF24;
	font-size: 48px;
	font-weight: 800;
}

.nav-links {
	display: flex;
	align-items: center;
	gap: 12px;
}

.nav-links a {
	text-decoration: none;
	color: white;
	font-size: 16px;
	font-weight: 600;
	padding: 12px 18px;
	border-radius: 12px;
	transition: all 0.3s ease;
}

.nav-links a:hover {
	background: #2563EB;
	transform: translateY(-2px);
}

.logout-nav {
	background: linear-gradient(135deg, #F59E0B, #FBBF24);
	color: #0F172A !important;
	font-weight: 700;
}

.logout-nav:hover {
	box-shadow: 0 10px 20px rgba(245, 158, 11, 0.35);
}
</style>

</head>
<body>

	<div class="navbar">

		<div class="logo">🍽️ FoodExpress</div>

		<div class="nav-links">

			<a href="home.jsp">🏠 Home</a> <a href="restaurants">🍽
				Restaurants</a> <a href="orderHistory">📦 My Orders</a> <a
				href="profile">👤 Profile</a> <a href="logout" class="logout-nav">🚪
				Logout</a>

		</div>

	</div>

	<div class="container">







		<div class="hero-text">
			<h1>🍽️ FoodExpress</h1>
			<p>Fast • Fresh • Delivered</p>
		</div>





		<div class="welcome-card">

			<h1>
				Welcome
				<%=user.getName()%>
			</h1>

			<p>Login Successful</p>

		</div>

		<div class="info-grid">

			<div class="info-card">

				<h3>Email</h3>

				<p>
					<%=user.getEmail()%>
				</p>

			</div>

			<div class="info-card">

				<h3>Role</h3>

				<p>
					<%=user.getRole()%>
				</p>

			</div>

		</div>

		<div class="info-grid">

			<div class="info-card">

				<h3>🏪 Total Restaurants</h3>

				<p><%=restaurantCount%></p>

			</div>

			<div class="info-card">

				<h3>🍽️ Total Menu Items</h3>

				<p><%=menuCount%></p>

			</div>

			<div class="info-card">

				<h3>📦 Total Orders</h3>
				<p><%=orderCount%></p>

			</div>

		</div>

		<h2 class="section-title">User Services</h2>

		<div class="menu-grid">

			<div class="menu-card">

				<h3>🏪 Restaurants</h3>

				<a href="restaurants"> View Restaurants </a>

			</div>

			<div class="menu-card">

				<h3>📦 Orders</h3>

				<a href="orderHistory"> My Orders </a>

			</div>

			<div class="menu-card">

				<h3>👤 Profile</h3>

				<a href="profile"> My Profile </a>

			</div>

		</div>

		<%
		if ("ADMIN".equals(user.getRole())) {
		%>

		<h2 class="section-title">Admin Panel</h2>

		<div class="menu-grid">

			<div class="menu-card">

				<h3>Dashboard</h3>

				<a href="dashboard">Open</a>

			</div>

			<div class="menu-card">

				<h3>Add Restaurant</h3>

				<a href="addRestaurant">Open</a>

			</div>

			<div class="menu-card">

				<h3>Add Menu</h3>

				<a href="addMenu">Open</a>

			</div>

			<div class="menu-card">

				<h3>Manage Restaurants</h3>

				<a href="manageRestaurants">Open</a>

			</div>

			<div class="menu-card">

				<h3>Manage Menu</h3>

				<a href="manageMenu">Open</a>

			</div>

			<div class="menu-card">

				<h3>Manage Orders</h3>

				<a href="manageOrders">Open</a>

			</div>

		</div>

		<%
		}
		%>





	</div>









<div class="footer">

    <div class="footer-wave"></div>

    <div class="footer-content">

        <div class="footer-box">
            <h2>🍽️ FoodExpress</h2>
            <p>Fast • Fresh • Delivered</p>
            <p>Delicious food at your doorstep.</p>
        </div>

        <div class="footer-box">
            <h3>Quick Links</h3>
            <a href="home.jsp">🏠 Home</a>
            <a href="restaurants">🍽 Restaurants</a>
            <a href="orderHistory">📦 My Orders</a>
            <a href="profile">👤 Profile</a>
        </div>

        <div class="footer-box">
            <h3>Contact</h3>
            <p>📧 support@foodexpress.com</p>
            <p>📞 +91 98765 43210</p>
            <p>📍 Bengaluru, India</p>
        </div>

        <div class="footer-box">
            <h3>Follow Us</h3>

            <div class="social-icons">
                <span>📘</span>
                <span>📸</span>
                <span>🐦</span>
                <span>▶️</span>
            </div>

        </div>

    </div>

    <div class="copyright">
        © 2026 FoodExpress | All Rights Reserved | Made with ❤️ in India
    </div>

</div>








</body>
</html>