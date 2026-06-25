<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>


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

    padding:50px;

    background:
    linear-gradient(135deg,#F8FAFC,#EEF2FF,#E0EAFF);

}

/* Checkout Card */

.checkout-container{

    width:100%;
    max-width:760px;

    background:#fff;

    border-radius:30px;

    padding:45px;

    border:1px solid blue;

    box-shadow:
    0 20px 55px rgba(0,0,0,.08);

    transition:.35s;
    
    

}

.checkout-container:hover{

    transform:translateY(-6px);

    box-shadow:
    0 28px 65px rgba(124,58,237,.18);
}

/* Heading */

.checkout-container h1{

    text-align:center;

    font-size:64px;

    font-weight:900;

    margin-bottom:40px;

    background:
    linear-gradient(135deg,#2563EB,#7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* Input */

.input-group{

    margin-bottom:24px;
}

.input-group label{

    display:block;

    margin-bottom:10px;

    font-size:17px;

    font-weight:700;

    color:#1E293B;
}

.input-group input,
.input-group textarea{

    width:100%;

    padding:16px 18px;

    border:2px solid #E2E8F0;

    border-radius:16px;

    font-size:16px;

    outline:none;

    transition:.35s;

    background:#F8FAFC;
}

.input-group input:focus,
.input-group textarea:focus{

    border-color:#7C3AED;

    background:white;

    box-shadow:
    0 0 18px rgba(124,58,237,.18);
}

.input-group textarea{

    resize:none;
}

/* Payment */

.payment-box{

    margin-top:30px;

    padding:28px;

    border-radius:20px;

    background:#F8FAFC;

    border:2px solid #E2E8F0;
}

.payment-box h3{

    font-size:24px;

    margin-bottom:20px;

    color:#2563EB;

    font-weight:800;
}

.payment-box label{

    display:block;

    margin:18px 0;

    padding:14px 18px;

    background:white;

    border-radius:14px;

    cursor:pointer;

    border:2px solid transparent;

    transition:.3s;

    font-size:17px;

    font-weight:600;

    color:#334155;
}

.payment-box label:hover{

    border-color:#7C3AED;

    background:#EEF2FF;
}

.payment-box input[type=radio]{

    margin-right:12px;

    transform:scale(1.2);
}

/* Button */

.place-btn{

    width:100%;

    margin-top:35px;

    padding:18px;

    border:none;

    border-radius:16px;

    cursor:pointer;

    font-size:21px;

    font-weight:800;

    color:white;

    background:
    linear-gradient(135deg,#2563EB,#7C3AED);

    transition:.35s;
}

.place-btn:hover{

    transform:translateY(-5px);

    box-shadow:
    0 18px 35px rgba(124,58,237,.30);
}

/* Placeholder */

::placeholder{

    color:#94A3B8;
}

/* Mobile */

@media(max-width:768px){

body{

padding:20px;

}

.checkout-container{

padding:28px;

}

.checkout-container h1{

font-size:40px;

}

.payment-box h3{

font-size:22px;

}

.place-btn{

font-size:18px;

}

}




.total-box{

margin-top:30px;

padding:25px;

background:linear-gradient(135deg,#EEF2FF,#F8FAFC);

border-radius:18px;

text-align:center;

border:2px solid #E2E8F0;

}

.total-box h2{

font-size:28px;

font-weight:800;

color:#16A34A;

margin-bottom:10px;

}

.total-box p{

font-size:16px;

color:#64748B;

}

.payment-box label{

display:flex;

align-items:center;

padding:18px;

margin-top:15px;

background:white;

border-radius:15px;

cursor:pointer;

transition:.3s;

border:2px solid transparent;

}

.payment-box label:hover{

border-color:#7C3AED;

background:#EEF2FF;

transform:translateY(-2px);

}

.payment-box input{

margin-right:15px;

transform:scale(1.2);

}






</style>


</head>

<body>





<div class="checkout-container">

    <h1>Checkout</h1>

    <form action="placeOrder" method="post">

<div style="display:grid;
grid-template-columns:1fr 1fr;
gap:25px;">

    <div class="input-group">
        <label>Full Name</label>
        <input type="text"
               name="fullName"
               placeholder="Enter your full name"
               required>
    </div>

    <div class="input-group">
        <label>Phone Number</label>
        <input type="text"
               name="phone"
               placeholder="Enter phone number"
               required>
    </div>

    <div class="input-group">
        <label>City</label>
        <input type="text"
               name="city"
               placeholder="Enter city"
               required>
    </div>

    <div class="input-group">
        <label>Pincode</label>
        <input type="text"
               name="pincode"
               placeholder="Enter pincode"
               required>
    </div>

</div>

<div class="input-group">

<label>Delivery Address</label>

<textarea
name="address"
rows="4"
placeholder="Enter complete delivery address"
required></textarea>

</div>

<div class="payment-box">

<h3>Select Payment Method</h3>

<label>

<input
type="radio"
name="paymentMethod"
value="COD"
checked>

Cash On Delivery

</label>

<label>

<input
type="radio"
name="paymentMethod"
value="UPI">

UPI Payment

</label>

<label>

<input
type="radio"
name="paymentMethod"
value="CARD">

Credit / Debit Card

</label>

</div>

<div class="total-box">

<h2>Ready to Place Your Order?</h2>

<p>Please verify your delivery details before placing the order.</p>

</div>

<input
type="submit"
value="🍽 Place Order"
class="place-btn">

</form>
</div>








</body>

</html>