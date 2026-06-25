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
<title>Manage Orders</title>

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
    animation:fadeIn 0.6s ease;
}

@keyframes fadeIn{
    from{
        opacity:0;
        transform:translateY(20px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

h1{
    text-align:center;
    font-size:56px;
    font-weight:800;
    margin-bottom:10px;
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.subtitle{
    text-align:center;
    color:#64748B;
    font-size:18px;
    margin-bottom:25px;
}

.order-count{
    font-size:24px;
    font-weight:700;
    color:#000;
    margin-bottom:15px;
    padding-left:5px;
}

table{
    width:100%;
    border-collapse:collapse;
    background:#fff;
    border-radius:20px;
    overflow:hidden;
    box-shadow:0 15px 40px rgba(0,0,0,0.08);
}

th{
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    color:white;
    padding:18px;
    font-size:16px;
    font-weight:700;
    text-align:center;
}

td{
    padding:20px;
    text-align:center;
    color:#000;
    font-size:18px;
    border-bottom:1px solid #E2E8F0;
}

tr:nth-child(even){
    background:#FAFBFF;
}

tr:hover{
    background:#F8FAFC;
}

.amount{
    color:#16A34A;
    font-size:20px;
    font-weight:800;
}

.pending,
.confirmed,
.preparing,
.delivered,
.cancelled{
    padding:10px 20px;
    border-radius:30px;
    color:white;
    font-size:14px;
    font-weight:700;
    display:inline-block;
}

.pending{
    background:linear-gradient(135deg,#F59E0B,#FBBF24);
}

.confirmed{
    background:linear-gradient(135deg,#2563EB,#3B82F6);
}

.preparing{
    background:linear-gradient(135deg,#7C3AED,#8B5CF6);
}

.delivered{
    background:linear-gradient(135deg,#22C55E,#16A34A);
}

.cancelled{
    background:linear-gradient(135deg,#EF4444,#DC2626);
}

.confirm-btn,
.prepare-btn,
.deliver-btn{
    text-decoration:none;
    color:white;
    padding:10px 15px;
    border-radius:10px;
    font-weight:700;
    margin:0 3px;
    display:inline-block;
    transition:0.3s;
}

.confirm-btn{
    background:linear-gradient(135deg,#2563EB,#3B82F6);
}

.prepare-btn{
    background:linear-gradient(135deg,#7C3AED,#8B5CF6);
}

.deliver-btn{
    background:linear-gradient(135deg,#22C55E,#16A34A);
}

.confirm-btn:hover,
.prepare-btn:hover,
.deliver-btn:hover{
    transform:translateY(-3px);
}

.btn-container{
    text-align:center;
}

.home-btn{
    display:inline-block;
    margin-top:30px;
    text-decoration:none;
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    color:white;
    padding:15px 30px;
    border-radius:12px;
    font-weight:700;
    transition:0.3s;
}

.home-btn:hover{
    transform:translateY(-3px);
    box-shadow:0 10px 25px rgba(124,58,237,0.3);
}

.no-data{
    color:red;
    font-size:20px;
    font-weight:700;
    padding:30px;
}

@media(max-width:1000px){

    body{
        padding:15px;
    }

    table{
        display:block;
        overflow-x:auto;
    }

    h1{
        font-size:40px;
    }

    td,
    th{
        padding:14px;
    }
}
</style>

</head>
<body>

	<h1>Manage Orders</h1>

	<p class="subtitle">Track and manage all customer orders</p>



<div class="order-count">
    📦 Total Orders : <%=orders.size()%>
</div>
	<table>

		<tr>
			<th>Order ID</th>
			<th>Restaurant</th>
			<th>Total Amount</th>
			<th>Status</th>
			<th>Update Status</th>
		</tr>

		<%
		if (orders != null && !orders.isEmpty()) {

			for (Order order : orders) {
		%>

		<tr>


			<td><%=order.getOrderId()%></td>

			<td><%=order.getRestaurantName()%></td>

			<td>Rs. <%=order.getTotalAmount()%></td>

			<td>
				<%
				String status = order.getStatus();

				if ("PENDING".equals(status)) {
				%> <span class="pending"> ⏳PENDING</span> <%
 } else if ("CONFIRMED".equals(status)) {
 %> <span class="confirmed">✅ CONFIRMED</span> <%
 } else if ("PREPARING".equals(status)) {
 %> <span class="preparing">👨‍🍳 PREPARING</span> <%
 } else if ("DELIVERED".equals(status)) {
 %> <span class="delivered">🚚 DELIVERED</span> <%
 } else if ("CANCELLED".equals(status)) {
 %> <span class="cancelled">❌ CANCELLED</span> <%
 }
 %>

			</td>

			<td><a class="confirm-btn"
				href="updateOrderStatus?orderId=<%=order.getOrderId()%>&status=CONFIRMED">

					Confirm </a> <a class="prepare-btn"
				href="updateOrderStatus?orderId=<%=order.getOrderId()%>&status=PREPARING">

					Preparing </a> <a class="deliver-btn"
				href="updateOrderStatus?orderId=<%=order.getOrderId()%>&status=DELIVERED">

					Delivered </a></td>

		</tr>

		<%
		}
		} else {
		%>

		<tr>


			<td colspan="5" class="no-data">No Orders Found</td>

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
