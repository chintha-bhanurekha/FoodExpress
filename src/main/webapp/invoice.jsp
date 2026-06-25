<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.Order"%>
<%@ page import="com.foodexpress.model.OrderItem"%>

<%
Order order = (Order) request.getAttribute("order");
ArrayList<OrderItem> orderItems = (ArrayList<OrderItem>) request.getAttribute("orderItems");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress Invoice</title>

<style>
*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#EEF4FF,#F8FAFF,#F3F0FF);
    min-height:100vh;
    padding:50px;
    color:#1F2937;
}

.invoice{
    max-width:1200px;
    margin:auto;
    background:#fff;
    border-radius:30px;
    padding:45px;
    border:1px solid #E5E7EB;
    box-shadow:
        0 20px 60px rgba(15,23,42,.08),
        0 8px 20px rgba(37,99,235,.08);
}

.header{
    display:flex;
    justify-content:space-between;
    align-items:center;
    padding-bottom:30px;
    border-bottom:2px solid #EEF2FF;
    margin-bottom:40px;
}

.logo{
    font-size:56px;
    font-weight:900;
    letter-spacing:1px;
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

.invoice-title{
    font-size:48px;
    font-weight:900;
    color:#22C55E;
}

.info{
    display:grid;
    grid-template-columns:repeat(2,1fr);
    gap:22px;
    margin-bottom:40px;
}

.info-box{
    background:#F8FAFF;
    border:1px solid #E2E8F0;
    border-radius:18px;
    padding:22px;
    transition:.35s;
}

.info-box:hover{
    transform:translateY(-6px);
    box-shadow:0 15px 30px rgba(37,99,235,.12);
}

.label{
    color:#2563EB;
    font-size:16px;
    font-weight:800;
    text-transform:uppercase;
    margin-bottom:10px;
    letter-spacing:.5px;
}

.info-box{
    font-size:18px;
    font-weight:600;
    color:#334155;
}

table{
    width:100%;
    border-collapse:collapse;
    overflow:hidden;
    border-radius:20px;
    box-shadow:0 8px 20px rgba(0,0,0,.05);
}

th{
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    color:#fff;
    padding:18px;
    font-size:17px;
    font-weight:700;
}

td{
    padding:18px;
    text-align:center;
    font-size:16px;
    border-bottom:1px solid #EDF2F7;
    color:#334155;
}

tr:nth-child(even){
    background:#FAFBFF;
}

tr:hover{
    background:#EEF4FF;
}

.total-box{
    margin-top:35px;
    padding:25px;
    background:linear-gradient(135deg,#F0FDF4,#DCFCE7);
    border-radius:18px;
    text-align:right;
    font-size:40px;
    font-weight:900;
    color:#16A34A;
}

.buttons{
    margin-top:45px;
    display:flex;
    justify-content:center;
    gap:20px;
    flex-wrap:wrap;
}

.btn{
    padding:16px 34px;
    border-radius:14px;
    text-decoration:none;
    font-size:16px;
    font-weight:700;
    transition:.35s;
}

.back-btn{
    background:linear-gradient(135deg,#F59E0B,#FBBF24);
    color:#111827;
}

.back-btn:hover{
    transform:translateY(-5px);
    box-shadow:0 15px 30px rgba(245,158,11,.35);
}

.print-btn{
    background:linear-gradient(135deg,#2563EB,#7C3AED);
    color:white;
}

.print-btn:hover{
    transform:translateY(-5px);
    box-shadow:0 15px 30px rgba(124,58,237,.35);
}

.footer{
    margin-top:45px;
    padding:20px;
    text-align:center;
    border-radius:16px;
    background:linear-gradient(135deg,#0F172A,#312E81);
    color:white;
    font-size:16px;
    font-weight:600;
}

@media(max-width:900px){

.info{
grid-template-columns:1fr;
}

.header{
flex-direction:column;
gap:20px;
text-align:center;
}

.logo{
font-size:42px;
}

.invoice-title{
font-size:36px;
}

.total-box{
font-size:30px;
text-align:center;
}

body{
padding:20px;
}

.invoice{
padding:25px;
}

table{
display:block;
overflow-x:auto;
white-space:nowrap;
}

.buttons{
flex-direction:column;
}

.btn{
width:100%;
text-align:center;
}

}
</style>

</head>
<body>

	<div class="invoice">

		<div class="header">

			<div class="logo">FoodExpress</div>

			<div class="invoice-title">INVOICE</div>

		</div>

		<div class="info">

			<div class="info-box">
				<div class="label">Order ID</div>
				#<%=order.getOrderId()%>
			</div>

			<div class="info-box">
				<div class="label">Restaurant</div>
				<%=order.getRestaurantName()%>
			</div>

			<div class="info-box">
				<div class="label">Payment Method</div>
				<%=order.getPaymentMethod()%>
			</div>

			<div class="info-box">
				<div class="label">Order Date</div>
				<%=order.getOrderDate()%>
			</div>
			
			
			
			
			<div class="info-box">
    <div class="label">Customer Name</div>
    <%=order.getFullName()%>
</div>

<div class="info-box">
    <div class="label">Phone Number</div>
    <%=order.getPhone()%>
</div>

<div class="info-box">
    <div class="label">Delivery Address</div>
    <%=order.getAddress()%>
</div>

<div class="info-box">
    <div class="label">City</div>
    <%=order.getCity()%>
</div>

<div class="info-box">
    <div class="label">Pincode</div>
    <%=order.getPincode()%>
</div>
			
			
			
			
			
			
			
			
			
			

		</div>

		<table>

			<tr>
				<th>Item Name</th>
				<th>Quantity</th>
				<th>Total Price</th>
			</tr>

			<%
			if (orderItems != null) {
				for (OrderItem item : orderItems) {
			%>

			<tr>

				<td><%=item.getItemName()%></td>

				<td><%=item.getQuantity()%></td>

				<td>₹ <%=item.getItemTotal()%></td>

			</tr>

			<%
			}
			}
			%>

		</table>

		<div class="total-box">

			Grand Total : ₹
			<%=order.getTotalAmount()%>

		</div>

		<div class="buttons">

			<a href="orderHistory" class="btn back-btn"> Back To Orders </a> <a
				href="#" onclick="window.print()" class="btn print-btn"> Print
				Invoice </a>

		</div>

	</div>

</body>
</html>