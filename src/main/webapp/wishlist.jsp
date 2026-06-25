<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Menu"%>

<%
ArrayList<Menu> wishlist = (ArrayList<Menu>) request.getAttribute("wishlist");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Wishlist</title>

<style>

*{
	margin:0;
	padding:0;
	box-sizing:border-box;
	font-family:'Segoe UI',sans-serif;
}

body{
	background:linear-gradient(135deg,#F8FAFC,#EEF2FF);
	min-height:100vh;
	color:#1E293B;
}

/* ================= NAVBAR ================= */

.navbar{
	background:linear-gradient(135deg,#0F172A,#1E293B);
	display:flex;
	justify-content:space-between;
	align-items:center;
	padding:25px 40px;
	box-shadow:0 5px 20px rgba(0,0,0,.18);
	position:sticky;
	top:0;
	z-index:1000;
}

.logo{
	color:#FBBF24;
	font-size:46px;
	font-weight:800;
}

.nav-links{
	display:flex;
	align-items:center;
	gap:15px;
}

.nav-links a{
	text-decoration:none;
	color:white;
	font-size:16px;
	font-weight:600;
	padding:12px 18px;
	border-radius:12px;
	transition:.3s;
}

.nav-links a:hover{
	background:#2563EB;
	transform:translateY(-3px);
	box-shadow:0 10px 25px rgba(37,99,235,.35);
}

.logout-nav{
	background:linear-gradient(135deg,#F59E0B,#FBBF24);
	color:#0F172A!important;
	font-weight:700;
}

.logout-nav:hover{
	box-shadow:0 12px 25px rgba(245,158,11,.35);
}

/* ================= HEADER ================= */

.hero{
	max-width:1250px;
	margin:40px auto;
	padding:70px 30px;
	text-align:center;
	border-radius:28px;
	background:linear-gradient(135deg,#2563EB,#7C3AED);
	box-shadow:0 20px 45px rgba(124,58,237,.25);
}

.hero h1{
	font-size:56px;
	color:white;
	margin-bottom:15px;
	font-weight:800;
}

.hero p{
	color:#E2E8F0;
	font-size:20px;
}

/* ================= CONTAINER ================= */

.container{
	display:flex;
	flex-wrap:wrap;
	justify-content:center;
	gap:35px;
	padding:20px 40px 60px;
}

/* ================= CARD ================= */

.card{
	width:360px;
	background:white;
	border-radius:22px;
	overflow:hidden;
	border:2px solid transparent;
	box-shadow:0 10px 30px rgba(0,0,0,.08);
	transition:.35s;
}

.card:hover{
	transform:translateY(-12px) scale(1.03);
	border-color:#7C3AED;
	box-shadow:
	0 22px 45px rgba(124,58,237,.22),
	0 0 25px rgba(124,58,237,.18);
}

.food-img{
	width:100%;
	height:240px;
	object-fit:cover;
	transition:.4s;
}

.card:hover .food-img{
	transform:scale(1.08);
}

.card-content{
	padding:22px;
}

.card h2{
	color:#2563EB;
	font-size:30px;
	margin-bottom:12px;
	font-weight:700;
}

.card p{
	color:#475569;
	font-size:16px;
	line-height:1.6;
	margin:10px 0;
}

/* ================= PRICE ================= */

.price{
	display:inline-block;
	margin-top:10px;
	background:linear-gradient(135deg,#22C55E,#16A34A);
	color:white!important;
	padding:10px 18px;
	border-radius:30px;
	font-size:18px;
	font-weight:700;
}

/* ================= BUTTONS ================= */

.btn-group{
	margin-top:18px;
	display:flex;
	gap:10px;
}

.cart-btn{

	flex:1;
	padding:12px;
	border:none;
	border-radius:12px;
	cursor:pointer;
	font-size:15px;
	font-weight:700;
	color:white;
	background:linear-gradient(135deg,#2563EB,#7C3AED);
	transition:.3s;
}

.cart-btn:hover{

	transform:translateY(-4px);

	box-shadow:
	0 12px 25px rgba(37,99,235,.35);
}

.remove-btn{

	flex:1;
	padding:12px;
	border:none;
	border-radius:12px;
	cursor:pointer;
	font-size:15px;
	font-weight:700;
	color:white;
	background:linear-gradient(135deg,#EF4444,#DC2626);
	transition:.3s;
}

.remove-btn:hover{

	transform:translateY(-4px);

	box-shadow:
	0 12px 25px rgba(239,68,68,.35);
}

/* ================= EMPTY ================= */

.no-data{
	width:100%;
	text-align:center;
	font-size:32px;
	font-weight:700;
	color:#EF4444;
	padding:80px 0;
}

/* ================= FOOTER ================= */

.footer{
	margin-top:60px;
	background:linear-gradient(135deg,#0F172A,#312E81);
	color:white;
	text-align:center;
	padding:28px;
	font-size:16px;
	font-weight:600;
}

</style>

</head>

<body>

<div class="navbar">

	<div class="logo">🍽️ FoodExpress</div>

	<div class="nav-links">

		<a href="home.jsp">🏠 Home</a>

		<a href="restaurants">🍽 Restaurants</a>

		<a href="wishlist">❤️ Wishlist</a>

		<a href="orderHistory">📦 My Orders</a>

		<a href="profile">👤 Profile</a>

		<a href="logout" class="logout-nav">🚪 Logout</a>

	</div>

</div>

<div class="hero">

	<h1>❤️ My Wishlist</h1>

	<p>Your favourite dishes saved for later</p>

</div>

<div class="container">

































<%
if (wishlist != null && !wishlist.isEmpty()) {

    for (Menu m : wishlist) {

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
        } else if (itemName.contains("chicken biryani")) {
            imageUrl = "images/chickenbiryani.jpg";
        } else if (itemName.contains("mutton biryani")) {
            imageUrl = "images/muttonbiryani.jpg";
        } else if (itemName.contains("veg biryani")) {
            imageUrl = "images/vegbiryani.jpg";
        } else if (itemName.contains("margherita pizza")) {
            imageUrl = "images/margheritapizza.jpg";
        } else if (itemName.contains("farmhouse pizza")) {
            imageUrl = "images/farmhousepizza.jpg";
        } else if (itemName.contains("garlic bread")) {
            imageUrl = "images/garlicbread.jpg";
        } else if (itemName.contains("zinger burger")) {
            imageUrl = "images/zingerburger.jpg";
        } else if (itemName.contains("chicken bucket")) {
            imageUrl = "images/chickenbucket.jpg";
        } else if (itemName.contains("french fries")) {
            imageUrl = "images/frenchfries.jpg";
        } else if (itemName.contains("mcaloo tikki")) {
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
            Rs. <%=m.getPrice()%>
        </p>

        <div class="btn-group">

            <form action="cart" method="post" style="flex:1;">

                <input type="hidden" name="menuId"
                    value="<%=m.getMenuId()%>">

                <input type="submit"
                    value="🛒 Add To Cart"
                    class="cart-btn">

            </form>

            <form action="removeWishlist" method="post" style="flex:1;">

                <input type="hidden" name="menuId"
                    value="<%=m.getMenuId()%>">

                <input type="submit"
                    value="❌ Remove"
                    class="remove-btn">

            </form>

        </div>

    </div>

</div>

<%
    }

} else {
%>

<h2 class="no-data">
    ❤️ Your Wishlist is Empty
</h2>

<%
}
%>

</div>

<div class="footer">

    © 2026 FoodExpress | Wishlist ❤️

</div>

</body>
</html>