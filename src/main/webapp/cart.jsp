<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList"%>
<%@ page import="com.foodexpress.model.CartItem"%>

<%
ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

double grandTotal = 0;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress Cart</title>

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

    padding:50px;

    
}

/* Heading */

h1{

    text-align:center;

    font-size:60px;

    font-weight:900;

    margin-bottom:45px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* Container */

.cart-container{

    width:100%;

    max-width:1200px;

    margin:auto;
}

/* Card */

.cart-card{

    background:#fff;

    border-radius:28px;

    padding:35px;

    margin-bottom:30px;

    border:1px solid #EEF2FF;

    box-shadow:
    0 15px 40px rgba(0,0,0,.08);

    transition:.35s;
}

.cart-card:hover{

    transform:
    translateY(-8px)
    scale(1.02);

    box-shadow:
    0 25px 60px rgba(124,58,237,.18);
}

/* Item Name */

.item-name{

    font-size:36px;

    font-weight:800;

    color:#2563EB;

    margin-bottom:18px;
}

.cart-card p{

    font-size:20px;

    color:#475569;

    margin:15px 0;
}

/* Total */

.item-total{

    color:#16A34A !important;

    font-size:30px !important;

    font-weight:900;

    margin-top:20px;
}

/* Quantity */

.qty-plus,
.qty-minus{

    display:inline-flex;

    justify-content:center;
    align-items:center;

    width:45px;
    height:45px;

    border-radius:50%;

    color:white;

    text-decoration:none;

    font-size:24px;

    font-weight:bold;

    transition:.3s;
}

.qty-plus{

    background:linear-gradient(135deg,#22C55E,#16A34A);
}

.qty-minus{

    background:linear-gradient(135deg,#EF4444,#DC2626);
}

.qty-plus:hover,
.qty-minus:hover{

    transform:scale(1.15);

    box-shadow:0 8px 18px rgba(0,0,0,.15);
}

/* Quantity Number */

span{

    display:inline-block;

    min-width:60px;

    text-align:center;

    font-size:24px;

    font-weight:800;

    color:#0F172A;
}

/* Remove */

.remove-btn{

    display:inline-block;

    margin-top:22px;

    padding:14px 30px;

    border-radius:14px;

    text-decoration:none;

    color:white;

    font-weight:700;

    background:linear-gradient(135deg,#EF4444,#B91C1C);

    transition:.3s;
}

.remove-btn:hover{

    transform:translateY(-4px);

    box-shadow:
    0 12px 30px rgba(239,68,68,.35);
}

/* Summary */

.summary-box{

    background:#fff;

    border-radius:30px;

    padding:45px;

    text-align:center;

    margin-top:35px;

    box-shadow:
    0 18px 45px rgba(0,0,0,.08);
}

.summary-box h2{

    font-size:48px;

    font-weight:900;

    color:#16A34A;

    margin-bottom:35px;
}

/* Checkout Button */

.place-btn{

    width:340px;

    padding:18px;

    border:none;

    border-radius:16px;

    cursor:pointer;

    color:white;

    font-size:20px;

    font-weight:800;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    transition:.35s;
}

.place-btn:hover{

    transform:translateY(-5px);

    box-shadow:
    0 18px 35px rgba(124,58,237,.30);
}

/* Continue Shopping */

.shopping-btn{

    display:inline-block;

    margin-top:25px;

    padding:18px 34px;

    border-radius:16px;

    text-decoration:none;

    font-weight:800;

    color:#111827;

    background:linear-gradient(135deg,#FBBF24,#F59E0B);

    transition:.35s;
}

.shopping-btn:hover{

    transform:translateY(-5px);

    box-shadow:
    0 18px 35px rgba(245,158,11,.35);
}

/* Empty */

.empty-cart{

    background:white;

    border-radius:30px;

    padding:60px;

    text-align:center;

    font-size:40px;

    font-weight:800;

    color:#EF4444;

    box-shadow:
    0 18px 45px rgba(0,0,0,.08);
}

/* Footer */

.footer{

    margin-top:60px;

    padding:22px;

    border-radius:20px;

    text-align:center;

    color:white;

    font-weight:700;

    background:linear-gradient(135deg,#0F172A,#312E81);
}

/* Mobile */

@media(max-width:768px){

body{

padding:20px;

}

h1{

font-size:42px;

}

.cart-card{

padding:22px;

}

.item-name{

font-size:28px;

}

.summary-box h2{

font-size:34px;

}

.place-btn{

width:100%;

}

.shopping-btn{

width:100%;

text-align:center;

}
}



</style>

</head>
<body>

	<h1>Your Cart</h1>

	<div class="cart-container">

		<%
		if (cart == null || cart.isEmpty()) {
		%>

		<div class="empty-cart">Your Cart Is Empty</div>

		<div style="text-align: center;">
			<a href="restaurants" class="shopping-btn"> Continue Shopping </a>
		</div>

		<%
		} else {

		for (CartItem item : cart) {

			double total = item.getPrice() * item.getQuantity();

			grandTotal += total;
		%>

		<div class="cart-card">

			<div class="item-name">
				<%=item.getItemName()%>
			</div>

			<p>
				<b>Price :</b> Rs.
				<%=item.getPrice()%>
			</p>




			<p>
				<b>Quantity :</b>
				
				<a href="updateQuantity?menuId=<%=item.getMenuId()%>&action=decrease"
   class="qty-minus">-</a>

<span style="margin:0 15px;font-size:22px;font-weight:bold;">
    <%=item.getQuantity()%>
</span>

<a href="updateQuantity?menuId=<%=item.getMenuId()%>&action=increase"
   class="qty-plus">+</a>
					
					
			</p>







			<p class="item-total">
				Item Total : Rs.
				<%=total%>
			</p>

			<a class="remove-btn" href="removeItem?menuId=<%=item.getMenuId()%>">

				Remove Item </a>

		</div>

		<%
		}
		%>

		<div class="summary-box">

			<h2>
				Grand Total : Rs.
				<%=grandTotal%>
			</h2>

			<form action="checkout.jsp" method="get">

    <input type="submit"
           value="Proceed To Checkout"
           class="place-btn">

</form>

			<br> <a href="restaurants" class="shopping-btn"> Continue
				Shopping </a>

		</div>

		<%
		}
		%>

	</div>

</body>
</html>