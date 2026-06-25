<%@ page import="com.foodexpress.model.Order"%>

<%
Order order = (Order) request.getAttribute("order");

String status = order.getStatus();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Tracking</title>

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
    display:flex;
    justify-content:center;
    align-items:center;
    padding:40px;
}

.container{
    width:950px;
    background:white;
    padding:60px;
    border-radius:30px;

    box-shadow:
    0 20px 50px rgba(0,0,0,0.08);

    transition:0.3s;
}

.container:hover{
    transform:translateY(-5px);
}

h1{
    text-align:center;

    font-size:60px;
    font-weight:800;

    margin-bottom:20px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

h2{
    text-align:center;

    color:#0F172A;

    font-size:38px;

    margin-bottom:15px;

    font-weight:700;
}

p{
    text-align:center;

    color:#64748B;

    font-size:22px;

    margin-bottom:45px;
}

.track{
    display:flex;

    justify-content:space-between;

    gap:30px;

    margin:50px 0;
}

.step{
    flex:1;

    padding:28px 20px;

    border-radius:20px;

    background:#E2E8F0;

    color:#64748B;

    font-size:20px;
    font-weight:700;

    text-align:center;

    transition:all 0.3s ease;

    cursor:pointer;
}

.step:hover{
    transform:translateY(-6px);

    box-shadow:
    0 12px 25px rgba(0,0,0,0.08);
}

.active{
    background:linear-gradient(
    135deg,
    #22C55E,
    #16A34A);

    color:white;

    box-shadow:
    0 12px 30px rgba(34,197,94,0.30);
}

.back-btn{
    display:inline-block;

    margin-top:25px;

    padding:16px 38px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    color:white;

    text-decoration:none;

    border-radius:14px;

    font-size:18px;
    font-weight:700;

    transition:all 0.3s ease;

    box-shadow:
    0 10px 25px rgba(124,58,237,0.25);
}

.back-btn:hover{
    transform:translateY(-5px);

    box-shadow:
    0 15px 35px rgba(124,58,237,0.35);
}

.status-delivered{
    color:#22C55E;
    font-weight:700;
}

.status-confirmed{
    color:#2563EB;
    font-weight:700;
}

.status-preparing{
    color:#7C3AED;
    font-weight:700;
}

.status-cancelled{
    color:#EF4444;
    font-weight:700;
}
</style>

</head>
<body>

	<div class="container">

		<h1>Order Tracking</h1>

		<h2>
			Order #<%=order.getOrderId()%></h2>

		<p>
			Status :
			<%=status%></p>

		<div class="track">

			<div
				class="step <%=status.equals("CONFIRMED") || status.equals("PREPARING") || status.equals("DELIVERED") ? "active" : ""%>">
				CONFIRMED</div>

			<div
				class="step <%=status.equals("PREPARING") || status.equals("DELIVERED") ? "active" : ""%>">
				PREPARING</div>

			<div class="step <%=status.equals("DELIVERED") ? "active" : ""%>">
				DELIVERED</div>

		</div>

		<br>
		<br> <a href="orderHistory"
			style="background: #ff5722; padding: 12px 20px; color: white; text-decoration: none; border-radius: 8px;">
			Back To Orders </a>

	</div>

</body>
</html>