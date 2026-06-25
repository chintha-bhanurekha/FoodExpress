<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Order"%>

<%
ArrayList<Order> orders = (ArrayList<Order>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Orders</title>

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
    padding:30px;
    color:#1E293B;
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
    font-weight:700;
}

td{
    padding:18px;
    text-align:center;
    border-bottom:1px solid #E2E8F0;
    color:#334155;
}

tbody tr{
    transition:0.3s;
}

tbody tr:hover{
    background:#EEF2FF;
}

.view-btn{
    display:inline-block;

    padding:8px 12px;
    margin:3px;

    background:linear-gradient(
    135deg,
    #2563EB,
    #7C3AED);

    color:white;
    text-decoration:none;

    border-radius:8px;

    font-size:13px;
    font-weight:600;

    transition:0.3s;
}

.view-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 8px 20px rgba(124,58,237,0.25);
}

.cancel-btn{
    display:inline-block;

    padding:8px 12px;
    margin:3px;

    background:linear-gradient(
    135deg,
    #EF4444,
    #DC2626);

    color:white;
    text-decoration:none;

    border-radius:8px;

    font-size:13px;
    font-weight:600;

    transition:0.3s;
}

.cancel-btn:hover{
    transform:translateY(-3px);
}

.back-btn{
    display:inline-block;

    margin-top:30px;

    background:linear-gradient(
    135deg,
    #F59E0B,
    #FBBF24);

    color:#0F172A;

    text-decoration:none;

    padding:14px 28px;

    border-radius:12px;

    font-weight:700;

    transition:0.3s;
}

.back-btn:hover{
    transform:translateY(-4px);
}

.pending{
    color:#F59E0B;
    font-weight:800;
}

.confirmed{
    color:#2563EB;
    font-weight:800;
}

.preparing{
    color:#7C3AED;
    font-weight:800;
}

.delivered{
    color:#22C55E;
    font-weight:800;
}

.cancelled{
    color:#EF4444;
    font-weight:800;
}

.footer{
    width:95%;
    margin:50px auto 0;

    background:linear-gradient(
    135deg,
    #0F172A,
    #312E81);

    color:white;

    text-align:center;

    padding:20px;

    border-radius:15px;

    font-weight:600;
}
</style>

</head>
<body>

	<h1>My Orders</h1>

	<table>

		<tr>
			<th>Order ID</th>
			<th>Restaurant Name</th>
			<th>Total Amount</th>
			<th>Status</th>
			<th>Payment</th>
			<th>Order Date</th>
			<th>Actions</th>
		</tr>

		<%
		if (orders != null && !orders.isEmpty()) {

			for (Order order : orders) {
		%>

		<tr>

			<td><%=order.getOrderId()%></td>

			<td><%=order.getRestaurantName()%></td>

			<td>₹ <%=order.getTotalAmount()%></td>

			<td>
				<%
				String status = order.getStatus();

				if ("PENDING".equals(status)) {
				%> <span class="pending">PENDING</span> <%
 } else if ("CONFIRMED".equals(status)) {
 %> <span class="confirmed"> CONFIRMED</span> <%
 } else if ("PREPARING".equals(status)) {
 %> <span class="preparing"> PREPARING</span> <%
 } else if ("DELIVERED".equals(status)) {
 %> <span class="delivered"> DELIVERED</span> <%
 } else if ("CANCELLED".equals(status)) {
 %> <span class="cancelled"> CANCELLED</span> <%
 }
 %>
			</td>

			<td><%=order.getPaymentMethod()%></td>

			<td><%=order.getOrderDate()%></td>

			<td><a class="view-btn"
				href="orderDetails?orderId=<%=order.getOrderId()%>"> View Items
			</a> <a class="view-btn" href="invoice?orderId=<%=order.getOrderId()%>">
					View Invoice </a> <a class="view-btn"
				href="orderTracking?orderId=<%=order.getOrderId()%>"> Track
					Order </a> <%
 if ("PENDING".equals(order.getStatus())) {
 %> <a class="cancel-btn"
				href="cancelOrder?orderId=<%=order.getOrderId()%>"> Cancel Order
			</a> <%
 }
 %></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>
			<td colspan="7">No Orders Found</td>
		</tr>

		<%
		}
		%>

	</table>

	<br>

	<a href="home.jsp" class="back-btn"> Back To Home </a>

</body>
</html>