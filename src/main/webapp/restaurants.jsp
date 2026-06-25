<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Restaurant"%>

<%
ArrayList<Restaurant> restaurants = (ArrayList<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress Restaurants</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: linear-gradient(135deg, #F8FAFC, #EEF2FF);
	color: #1E293B;
	min-height: 100vh;
}

/* Navbar */
/* NAVBAR */
.navbar {
	background: linear-gradient(135deg, #0F172A, #1E293B);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 25px 40px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.15);
	position: sticky;
	top: 0;
	z-index: 1000;
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

/* Hero Section */
.hero {
	text-align: center;
	padding: 90px 20px;
	color: white;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	max-width: 1200px;
	margin: 50px auto;
	border-radius: 30px;
	box-shadow: 0 20px 50px rgba(124, 58, 237, 0.25);
}

.hero h1 {
	font-size: 55px;
	color: white;
	margin-bottom: 15px;
}

.hero p {
	font-size: 18px;
	color: #E0E7FF;
	margin-bottom: 25px;
}

/* Search */
.search-box input[type=text] {
	width: 500px;
	max-width: 90%;
	padding: 16px;
	border: none;
	border-radius: 12px;
	font-size: 16px;
	outline: none;
}

.search-box input[type=submit] {
	padding: 16px 28px;
	border: none;
	border-radius: 12px;
	cursor: pointer;
	font-weight: 600;
	background: linear-gradient(135deg, #F59E0B, #FBBF24);
	color: #0F172A;
}

.search-box input[type=submit]:hover {
	transform: translateY(-2px);
}

/* Show All */
.show-all {
	display: block;
	text-align: center;
	margin: 25px;
	text-decoration: none;
	color: #2563EB;
	font-size: 18px;
	font-weight: 700;
}

/* Section Title */
.section-title {
	text-align: center;
	font-size: 48px;
	font-weight: 800;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	margin-bottom: 35px;
}





/* Restaurant Cards */
.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 30px;
	padding: 20px;
}

.card {
	width: 380px;
	background: white;
	border-radius: 20px;
	overflow: hidden;
	border: 1px solid transparent;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: all 0.4s ease;
	
	
}

.card:hover {
	transform: translateY(-12px) scale(1.02);
	border: 2px solid #7C3AED;
	box-shadow: 0 25px 50px rgba(124, 58, 237, 0.25), 0 0 30px
		rgba(124, 58, 237, 0.18);
}

.card img {
	width: 100%;
	height: 230px;
	object-fit: cover;
	transition: 0.5s;
}

.card:hover img {
	transform: scale(1.08);
}

.card-content {
	padding: 20px;
}

.card h2 {
	color: #2563EB;
	
	
	margin-bottom: 12px;
	font-size: 28px;
	transition: 0.3s;
}

.card:hover h2 {
	color: #7C3AED;
}

.card p {
	
	color:black;
	font-size: 15px;
	margin: 12px 0;
	line-height: 1.6;
}

.rating {
	display: inline-flex;
	align-items: center;
	gap: 6px;
	background: linear-gradient(135deg, #22C55E, #16A34A);
	color: white !important;
	padding: 8px 16px;
	border-radius: 25px;
	font-weight: 700;
	font-size: 14px;
	box-shadow: 0 5px 15px rgba(34, 197, 94, 0.35);
	border-radius: 50px;
}
/* Menu Button */
.menu-btn {
	display: inline-block;
	margin-top: 15px;
	padding: 12px 22px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	text-decoration: none;
	border-radius: 12px;
	font-weight: 700;
	transition: 0.3s;
}

.menu-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 10px 25px rgba(124, 58, 237, 0.35);
	background: linear-gradient(135deg, #7C3AED, #2563EB);
}

/* No Data */
.no-data {
	width: 100%;
	text-align: center;
	color: red;
	font-size: 24px;
	font-weight: 700;
}

/* Footer */
.footer {
	width: 100%;
	margin-top: 70px;
	padding: 28px;
	background: linear-gradient(135deg, #0F172A, #312E81);
	color: #FFFFFF;
	text-align: center;
	font-size: 18px;
	font-weight: 700;
	letter-spacing: 0.5px;
}
</style>

</head>
<body>





	<div class="navbar">

		<div class="logo">FoodExpress</div>

		<div class="nav-links">

			<a href="home.jsp"> Home</a> <a href="restaurants"> Restaurants</a> <a
				href="orderHistory">My Orders</a> <a href="profile"> Profile</a> <a
				href="logout" class="logout-nav"> Logout</a>

		</div>

	</div>











	<div class="hero">


		<h1>Discover The Best Food Near You</h1>

		<p>Order from top-rated restaurants in your city</p>

		<div class="search-box">

			<form action="searchRestaurant" method="get">

				<input type="text" name="keyword" placeholder="Search Restaurant"
					required> <input type="submit" value="Search">

			</form>

		</div>


	</div>

	<a href="restaurants" class="show-all"> Show All Restaurants </a>

	<h2 class="section-title">Popular Restaurants</h2>






	<div class="container">

		<%
		if (restaurants != null && !restaurants.isEmpty()) {

			for (Restaurant r : restaurants) {

				String imageUrl = "images/udupi.jpg";

				String restaurantName = r.getName().toLowerCase();

				if (restaurantName.contains("udupi")) {

			imageUrl = "images/udipi.jpg";

				} else if (restaurantName.contains("chutneys")) {

			imageUrl = "images/chutneys.jpg";

				} else if (restaurantName.contains("a2b")) {

			imageUrl = "images/a2b.jpg";

				} else if (restaurantName.contains("minerva")) {

			imageUrl = "images/minerva.jpg";

				} else if (restaurantName.contains("cream")) {

			imageUrl = "images/creamstone.jpg";

				}

				else if (restaurantName.contains("paradise")) {
			imageUrl = "images/paradise.jpg";
				}

				else if (restaurantName.contains("dominos")) {

			imageUrl = "images/dominos.jpg";

				}

				else if (restaurantName.contains("kfc")) {

			imageUrl = "images/kfc.jpg";

				}

				else if (restaurantName.contains("mcd")) {

			imageUrl = "images/mcdonalds.jpg";

				}
		%>


		<div class="card">

			<img src="<%=imageUrl%>">

			<div class="card-content">

				<h2><%=r.getName()%></h2>

				<p>
					<b>Cuisine :</b>
					<%=r.getCuisineType()%>
				</p>

				<p>
					<b>Delivery Time :</b>
					<%=r.getDeliveryTime()%>
					mins
				</p>


				<p class="rating">
					<span style="color: #FBBF24; font-size: 16px;">&#9733;</span>
					<%=r.getRating()%>
				</p>

				<p>
					<b>Address :</b>
					<%=r.getAddress()%>
				</p>

				<a class="menu-btn"
					href="menu?restaurantId=<%=r.getRestaurantId()%>"> View Menu </a>

			</div>

		</div>


		<%
		}
		} else {
		%>


		<h3 class="no-data">No Restaurants Found</h3>


		<%
		}
		%>

	</div>


	<div class="footer">&copy; 2026 FoodExpress | Discover Amazing
		Restaurants</div>

</body>
</html>
real restrent.jsp ocde
