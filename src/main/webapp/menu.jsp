<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Menu"%>

<%
ArrayList<Menu> menuList = (ArrayList<Menu>) request.getAttribute("menuList");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Restaurant Menu</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
	padding: 30px;
	
}

/* PAGE TITLE */
h1 {
	text-align: center;
	font-size: 58px;
	font-weight: 800;
	color: #0F172A;
	margin-bottom: 30px;
}

/* SEARCH SECTION */
.search-box {
	max-width: 900px;
	margin: 0 auto 35px;
	padding: 45px; ```
	background: white;
	border: 1px solid black;
	border-radius: 30px;
	box-shadow: 0 20px 50px rgba(124, 58, 237, 0.15);
	text-align: center;
	transition: 0.4s;
	```
}

.search-box:hover {
	transform: translateY(-5px);
	box-shadow: 0 25px 60px rgba(124, 58, 237, 0.25);
}

.search-box input[type=text] {
	width: 380px;
	padding: 16px; ```
	border: none;
	outline: none;
	background: #F8FAFC;
	border-radius: 12px;
	font-size: 16px;
	```
}

.search-box input[type=submit] {
	padding: 16px 28px; ```
	border: none;
	border-radius: 12px;
	cursor: pointer;
	background: linear-gradient(135deg, #F59E0B, #FBBF24);
	color: #0F172A;
	font-size: 16px;
	font-weight: 700;
	transition: 0.3s;
	```
}

.search-box input[type=submit]:hover {
	transform: translateY(-3px);
}

/* BACK LINK */
.back-link {
	display: block;
	text-align: center; ```
	color: #2563EB;
	text-decoration: none;
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 40px;
	transition: 0.3s;
	```
}

.back-link:hover {
	color: #7C3AED;
	letter-spacing: 1px;
}

/* CARDS */
.container {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	gap: 35px;
}

.card {
	width: 340px; ```
	background: white;
	border-radius: 22px;
	border: 1px solid blue;
	overflow: hidden;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
	transition: all 0.4s ease;
	```
}

.card:hover {
	transform: translateY(-15px) scale(1.03); 
	border: 2px solid #7C3AED;
	box-shadow: 0 25px 50px rgba(124, 58, 237, 0.25);
	```
}

/* IMAGE */
.food-img {
	width: 100%;
	height: 240px; ```
	object-fit: cover;
	transition: 0.5s ease;
	```
}

.card:hover .food-img {
	transform: scale(1.12);
}

/* CONTENT */
.card-content {
	padding: 22px;
}

.card h2 {
	color: #2563EB;
	font-size: 32px;
	margin-bottom: 12px;
	transition: 0.3s;
	
}

.card:hover h2 {
	color: #7C3AED;
}

.card p {
	color: black;
	font-size: 16px;
	margin: 10px 0;
	line-height: 1.5;
}

/* PRICE */
.price {
	display: inline-block;
	background: #22C55E;
	color: white;
	padding: 10px 18px;
	border-radius: 30px;
	font-size: 20px;
	font-weight: 700;
	margin-top: 10px;
	transition: 0.3s;
}

.card:hover .price {
	transform: scale(1.08);
}

/* BUTTON */
.add-btn {
	margin-top: 18px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	border: none;
	padding: 12px 24px;
	border-radius: 12px;
	font-size: 16px;
	font-weight: 600;
	cursor: pointer;
	transition: all 0.3s ease;
}






.add-btn:hover {
	transform: translateY(-4px);
	background: linear-gradient(135deg, #7C3AED, #2563EB);
	box-shadow: 0 10px 25px rgba(124, 58, 237, 0.35);
}

/* NO DATA */
.no-data {
	width: 100%;
	text-align: center;
	color: #EF4444;
	font-size: 28px;
	font-weight: 700;
}

/* FOOTER */
.footer {
	width: 100%;
	margin-top: 70px;
	padding: 25px;
	text-align: center;
	background: linear-gradient(135deg, #0F172A, #312E81);
	color: white;
	font-size: 16px;
	font-weight: 600;
	box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.15);
	```
}
</style>

</head>
<body>

	<h1>🍽️ Restaurant Menu</h1>

	<div class="search-box">


		<form action="searchMenu" method="get">

			<input type="text" name="keyword" placeholder="Search Menu Item"
				required> <input type="submit" value="Search">

		</form>


	</div>

	<a href="restaurants" class="back-link"> Back To Restaurants </a>

	<div class="container">

		<%
		if (menuList != null && !menuList.isEmpty()) {

			for (Menu m : menuList) {
				String imageUrl = "images/default.jpg";

				String itemName = m.getItemName().toLowerCase();

				if (itemName.contains("masala dosa")) {

			imageUrl = "images/masaladosa.jpg";

				} else if (itemName.contains("idli vada")) {
			imageUrl = "images/idlivada.jpg";

				} else if (itemName.contains("ghee dosa")) {

			imageUrl = "images/gheedosa.jpg";

				} else if (itemName.contains("pesarattu")) {

			imageUrl = "images/pesarattu.jpg";

				} else if (itemName.contains("mini tiffin")) {

			imageUrl = "images/tiffin.jpg";

				} else if (itemName.contains("south meals")) {

			imageUrl = "images/meals.jpg";

				} else if (itemName.contains("filter coffee")) {

			imageUrl = "images/coffee.jpg";

				} else if (itemName.contains("veg sandwich")) {

			imageUrl = "images/sandwich.jpg";

				} else if (itemName.contains("chocolate ice cream")) {

			imageUrl = "images/icecream.jpg";

				} else if (itemName.contains("brownie sundae")) {

			imageUrl = "images/brownie.jpg";

				}

				else if (itemName.contains("chicken biryani")) {

			imageUrl = "images/chickenbiryani.jpg";

				} else if (itemName.contains("mutton biryani")) {

			imageUrl = "images/muttonbiryani.jpg";

				} else if (itemName.contains("veg biryani")) {

			imageUrl = "images/vegbiryani.jpg";

				}

				else if (itemName.contains("margherita pizza")) {
			imageUrl = "images/margheritapizza.jpg";
				} else if (itemName.contains("farmhouse pizza")) {
			imageUrl = "images/farmhousepizza.jpg";
				} else if (itemName.contains("garlic bread")) {
			imageUrl = "images/garlicbread.jpg";
				}

				else if (itemName.contains("zinger burger")) {

			imageUrl = "images/zingerburger.jpg";

				} else if (itemName.contains("chicken bucket")) {

			imageUrl = "images/chickenbucket.jpg";

				} else if (itemName.contains("french fries")) {

			imageUrl = "images/frenchfries.jpg";

				}

				else if (itemName.contains("mcaloo tikki")) {

			imageUrl = "images/mcalootikki.png";

				} else if (itemName.contains("mcveggie burger")) {

			imageUrl = "images/mcveggieburger.jpg";

				} else if (itemName.contains("mcfries")) {

			imageUrl = "images/mcfries.jpg";

				}
		%>

		<div class="card">

			<img src="<%=imageUrl%>" class="food-img">
			<div class="card-content">

				<h2><%=m.getItemName()%></h2>

				<p>
					<b>Description :</b>
					<%=m.getDescription()%>
				</p>

				<p>
					<b>Category :</b>
					<%=m.getCategory()%>
				</p>

				<p class="price">
					Rs.
					<%=m.getPrice()%>
				</p>

				<form action="cart" method="post">

					<input type="hidden" name="menuId" value="<%=m.getMenuId()%>">

					<input type="submit" value="+ Add To Cart" class="add-btn">

				</form>
				
				
				
				
			
				
				
				

			</div>


		</div>

		<%
		}
		} else {
		%>

		<h3 class="no-data">No Menu Items Found</h3>

		<%
		}
		%>

	</div>


	<div class="footer">© 2026 FoodExpress | Fresh Food Delivered
		Fast 🚀</div>

</body>
</html>
