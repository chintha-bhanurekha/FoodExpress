<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
int userCount = (Integer) request.getAttribute("userCount");
int restaurantCount = (Integer) request.getAttribute("restaurantCount");
int orderCount = (Integer) request.getAttribute("orderCount");
double revenue = (Double) request.getAttribute("revenue");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{


background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
    min-height:100vh;
    padding:40px;
    color:#1E293B;
}

/* Header */

h1{
    text-align:center;
    font-size:58px;
    font-weight:800;
    margin-bottom:10px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.subtitle{
    text-align:center;
    color:black;
    font-size:20px;
    font-weight:20px;
    margin-bottom:50px;
}

/* Cards Container */

.container{
    max-width:1300px;
    margin:auto;

    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(280px,1fr));
    gap:30px;
}

/* Dashboard Card */

.card{
    background:white;
    border-radius:25px;
    padding:35px;
    text-align:center;

    border:1px solid rgb(0, 0, 255);

    box-shadow:
        0 10px 30px rgba(124,58,237,0.12);

    transition:all 0.35s ease;
}

.card:hover{

    transform:translateY(-12px) scale(1.03);

    border-color:#7C3AED;

    box-shadow:
        0 0 25px rgba(124,58,237,0.35),
        0 20px 50px rgba(124,58,237,0.25);
}

/* Icons */

.icon{
    font-size:55px;
    margin-bottom:15px;
}

/* Titles */

.card h2{
    color:light-green;
    font-size:24px;
    font-weight:700;
    margin-bottom:15px;
}

/* Numbers */

.count{
    font-size:62px;
    font-weight:800;
    

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* Revenue */

.revenue{
    font-size:50px;
    font-weight:800;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* Back Button */

.back-btn{
    display:block;
    width:260px;
    margin:55px auto;

    text-align:center;
    text-decoration:none;

    padding:16px;

    color:white;
    font-size:17px;
    font-weight:700;

    border-radius:14px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    transition:all 0.3s ease;
     border:1px solid rgb(0, 0, 255);
    
}

.back-btn:hover{

    transform:translateY(-4px);

    box-shadow:
        0 15px 30px rgba(124,58,237,0.35);
}

/* Responsive */

@media(max-width:768px){

    body{
        padding:20px;
    }

    h1{
        font-size:42px;
    }

    .card{
        padding:25px;
    }

    .count{
        font-size:48px;
    }

    .revenue{
        font-size:40px;
    }

    .icon{
        font-size:45px;
    }
}
</style>

</head>
<body>

	<h1>Admin Dashboard</h1>

	<p class="subtitle">FoodExpress Management Overview</p>

	<div class="container">

		

		
		
		
		
		
		<div class="card">
    <div class="icon">👥</div>
    <h2>Total Users</h2>
    <div class="count"><%=userCount%></div>
</div>

<div class="card">
    <div class="icon">🏪</div>
    <h2>Total Restaurants</h2>
    <div class="count"><%=restaurantCount%></div>
</div>

<div class="card">
    <div class="icon">📦</div>
    <h2>Total Orders</h2>
    <div class="count"><%=orderCount%></div>
</div>

<div class="card">
    <div class="icon">💰</div>
    <h2>Total Revenue</h2>
    <div class="revenue">₹ <%=revenue%></div>
</div>
		
		
		
		
		
		
		
		
		
		</div>
		

	</div>
	<a href="home.jsp" class="back-btn">🏠 Back To Home</a>

	

</body>
</html>
