<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.OrderItem"%>

<%
ArrayList<OrderItem> orderItems = (ArrayList<OrderItem>) request.getAttribute("orderItems");

double grandTotal = 0;
int totalItems = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Details</title>

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
   
}

h1{
    text-align:center;
    font-size:58px;
    font-weight:800;
    margin-bottom:40px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

table{
    width:95%;
    margin:auto;

    border-collapse:collapse;

    background:white;

    border-radius:25px;

    overflow:hidden;

    box-shadow:
    0 15px 40px rgba(0,0,0,0.08);
}

th{
    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    color:white;

    padding:18px;

    font-size:15px;

    text-transform:uppercase;

    letter-spacing:1px;
}

td{
    padding:18px;

    text-align:center;

    border-bottom:1px solid #E2E8F0;

    color:black;

    transition:0.3s;
}

tr:hover td{
    background:#EEF2FF;
}

.total-box{
    width:450px;

    margin:40px auto;

    background:white;

    padding:35px;

    border-radius:24px;

    text-align:center;

    box-shadow:
    0 15px 40px rgba(124,58,237,0.15);

    transition:0.3s;
}

.total-box:hover{
    transform:translateY(-5px);
}

.total-box h2{
    font-size:38px;
    margin-bottom:15px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.total-box p{
    font-size:20px;
    color:rgb(0, 0, 0)0, 0);
}

.amount{
    margin-top:15px;

    font-size:52px;

    font-weight:800;

    color:#22C55E;
}



.back-btn{
    display:block;

    width:250px;

    margin:25px auto;

    text-align:center;

    padding:16px;

    text-decoration:none;

    border-radius:14px;

    font-size:18px;

    font-weight:700;

    color:#0F172A;

    background:linear-gradient(
    135deg,
    #F59E0B,
    #FBBF24);

    transition:0.3s;
}

.back-btn:hover{
    transform:translateY(-4px);

    box-shadow:
    0 10px 25px rgba(245,158,11,0.3);
}

.no-data{
    text-align:center;

    padding:30px;

    color:#EF4444;

    font-size:24px;

    font-weight:700;
}

.footer{
    width:95%;

    margin:50px auto 0;

    padding:22px;

    text-align:center;

    color:white;

    border-radius:16px;

    background:linear-gradient(
    135deg,
    #0F172A,
    #312E81);

    font-weight:600;
}
</style>

</head>
<body>

	<h1>Order Details</h1>

	<table>

		<tr>
			<th>Order Item ID</th>
			<th>Item Name</th>
			<th>Quantity</th>
			<th>Total Price</th>
		</tr>

		<%
		if (orderItems != null && !orderItems.isEmpty()) {

			for (OrderItem item : orderItems) {

				grandTotal += item.getItemTotal();
				totalItems += item.getQuantity();
		%>

		<tr>

			<td><%=item.getOrderItemId()%></td>

			<td><%=item.getItemName()%></td>

			<td><%=item.getQuantity()%></td>

			<td>Rs. <%=item.getItemTotal()%></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>
			<td colspan="4" class="no-data">No Items Found</td>
		</tr>

		<%
		}
		%>

	</table>

	<%
	if (orderItems != null && !orderItems.isEmpty()) {
	%>

	<div class="total-box">

		<h2>Order Summary</h2>

		<p style="color: black; margin-bottom: 12px;">
			Total Items :
			<%=totalItems%>
		</p>

		<div class="amount">
			Rs.
			<%=grandTotal%>
		</div>

	</div>

	<%
	}
	%>

	<a href="orderHistory" class="back-btn"> Back To Orders </a>

</body>
</html>