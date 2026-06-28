<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Restaurant"%>

<%
ArrayList<Restaurant> restaurants = (ArrayList<Restaurant>) request.getAttribute("restaurants");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Manage Restaurants</title>

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


	min-height: 100vh;
	padding: 30px;
	
}

h1 {
	text-align: center;
	font-size: 52px;
	font-weight: 800;
	margin-bottom: 10px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.subtitle {
	text-align: center;
	color:black;
	font-weight:30px;
	font-size: 18px;
	margin-bottom: 35px;
}

/* Table */
table {
	width: 100%;
	border-collapse: collapse;
	background: white;
	border-radius: 20px;
	
	overflow: hidden;
	box-shadow: 0 15px 40px rgba(124, 58, 237, 0.12);
}

th {
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	padding: 18px;
	font-size: 16px;
	font-weight: 700;
}

td {
	padding: 18px;
	text-align: center;
	border-bottom: 1px solid #E2E8F0;
	color: black;
	transition: 0.3s;
}

tr:hover {
	background: #F8FAFC;
}

/* Rating Badge */
.rating {
	background: linear-gradient(135deg, #22C55E, #16A34A);
	color: white;
	padding: 8px 15px;
	border-radius: 25px;
	font-weight: 700;
	box-shadow: 0 5px 15px rgba(34, 197, 94, 0.25);
}

/* Delete Button */
.delete-btn {
	text-decoration: none;
	background: linear-gradient(135deg, #EF4444, #DC2626);
	color: white;
	padding: 10px 18px;
	border-radius: 10px;
	font-weight: 700;
	transition: 0.3s;
}

.delete-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(239, 68, 68, 0.30);
}

/* Home Button */
.btn-container {
	text-align: center;
}

.home-btn {
	display: inline-block;
	margin-top: 30px;
	text-decoration: none;
	padding: 14px 28px;
	border-radius: 12px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	font-size: 16px;
	font-weight: 700;
	transition: 0.3s;
}

.home-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 12px 25px rgba(124, 58, 237, 0.35);
}

/* No Data */
.no-data {
	padding: 25px;
	color: #EF4444;
	font-size: 20px;
	font-weight: 700;
}

/* Responsive */
@media ( max-width :900px) {
	body {
		padding: 15px;
	}
	table {
		display: block;
		overflow-x: auto;
	}
	h1 {
		font-size: 40px;
	}
}
</style>

</head>
<body>

	<h1>Manage Restaurants</h1>

	<p class="subtitle">Manage all restaurant records from one place</p>

	<table>

		<tr>
			<th>ID</th>
			<th>Name</th>
			<th>Cuisine</th>
			<th>Delivery Time</th>
			<th>Rating</th>
			<th>Address</th>
			<th>Action</th>
		</tr>

		<%
		if (restaurants != null && !restaurants.isEmpty()) {

			for (Restaurant r : restaurants) {
		%>

		<tr>


			<td><%=r.getRestaurantId()%></td>

			<td><%=r.getName()%></td>

			<td><%=r.getCuisineType()%></td>

			<td><%=r.getDeliveryTime()%> mins</td>
			<td><span class="rating">⭐ <%=r.getRating()%></span></td>

			<td><%=r.getAddress()%></td>

			<td><a class="delete-btn"
				href="deleteRestaurant?restaurantId=<%=r.getRestaurantId()%>">

					Delete </a></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>


			<td colspan="7" class="no-data">No Restaurants Found</td>

		</tr>

		<%
		}
		%>

	</table>

	<div class="btn-container">

		<a href="home.jsp" class="home-btn"> 🏠 Back To Home </a>

	</div>

</body>
</html>
