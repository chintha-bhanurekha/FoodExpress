<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>


*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

   background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
}

.card{
    width:650px;

    background:white;

    padding:55px;

    border-radius:30px;

    text-align:center;

    box-shadow:
    0 20px 50px rgba(124,58,237,0.18);

    transition:all 0.3s ease;
}

.card:hover{
    transform:translateY(-8px);

    box-shadow:
    0 30px 60px rgba(124,58,237,0.25);
}

.tick{
    width:130px;
    height:130px;

    margin:auto;

    border-radius:50%;

    background:linear-gradient(
    135deg,
    #22C55E,
    #16A34A);

    color:white;

    font-size:75px;
    font-weight:700;

    display:flex;
    justify-content:center;
    align-items:center;

    box-shadow:
    0 15px 35px rgba(34,197,94,0.35);

    margin-bottom:30px;
}

h1{
    font-size:48px;
    font-weight:800;

    color:#0F172A;

    margin-bottom:18px;
}

p{
    color:#64748B;

    font-size:20px;

    line-height:1.6;

    margin-bottom:35px;
}

.order-btn{
    display:inline-block;

    padding:15px 30px;

    text-decoration:none;

    border-radius:12px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    color:white;

    font-size:17px;
    font-weight:700;

    margin-right:12px;

    transition:0.3s;
}

.order-btn:hover{
    transform:translateY(-4px);

    box-shadow:
    0 12px 25px rgba(124,58,237,0.30);
}

.home-btn{
    display:inline-block;

    padding:15px 30px;

    text-decoration:none;

    border-radius:12px;

    background:linear-gradient(
    135deg,
    #F59E0B,
    #FBBF24);

    color:#0F172A;

    font-size:17px;
    font-weight:700;

    transition:0.3s;
}

.home-btn:hover{
    transform:translateY(-4px);

    box-shadow:
    0 12px 25px rgba(245,158,11,0.30);
}

</style>

</head>
<body>

	<div class="card">

		<div class="tick">✓</div>

		<h1>Order Placed Successfully</h1>

		<p>Your order has been confirmed and is being processed.</p>

		<a href="orderHistory" class="order-btn"> View Orders </a> <a
			href="restaurants" class="home-btn"> Order More Food </a>

	</div>

</body>
</html>