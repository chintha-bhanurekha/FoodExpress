<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Add Restaurant</title>

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
    padding:30px;
}

/* Form Container */

.container{
    width:650px;
    background:#FFFFFF;

    border-radius:25px;
    padding:40px;

    border:1px solid #E2E8F0;

    box-shadow:
    0 15px 40px rgba(124,58,237,0.12);

    transition:0.3s;
}

.container:hover{
    transform:translateY(-5px);

    box-shadow:
    0 25px 60px rgba(124,58,237,0.18);
}

/* Heading */

h1{
    text-align:center;
    margin-bottom:35px;

    font-size:46px;
    font-weight:800;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    -webkit-background-clip:text;
    -webkit-text-fill-color:transparent;
}

/* Form */

.form-group{
    margin-bottom:22px;
}

label{
    display:block;
    margin-bottom:8px;

    color:#2563EB;

    font-size:16px;
    font-weight:700;
}

input{
    width:100%;
    padding:15px;

    border:2px solid #E2E8F0;
    border-radius:12px;

    background:#F8FAFC;

    color:#1E293B;
    font-size:16px;

    transition:0.3s;
}

input:focus{
    outline:none;

    border-color:#7C3AED;

    box-shadow:
    0 0 15px rgba(124,58,237,0.15);
}

/* Add Restaurant Button */

.submit-btn{
    width:100%;
    border:none;

    padding:16px;
    margin-top:10px;

    border-radius:12px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    color:white;

    font-size:18px;
    font-weight:700;

    cursor:pointer;
    transition:0.3s;
}

.submit-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 12px 30px rgba(124,58,237,0.30);
}

/* Home Button */

.home-btn{
    display:block;

    text-align:center;
    text-decoration:none;

    margin-top:18px;
    padding:16px;

    border-radius:12px;

    background:linear-gradient(135deg,#F59E0B,#FBBF24);

    color:#0F172A;

    font-size:17px;
    font-weight:700;

    transition:0.3s;
}

.home-btn:hover{
    transform:translateY(-3px);

    box-shadow:
    0 12px 30px rgba(245,158,11,0.35);
}

/* Responsive */

@media(max-width:768px){

    .container{
        width:100%;
        padding:25px;
    }

    h1{
        font-size:34px;
    }
}
</style>

</head>
<body>

	<div class="container">

		
		<h1>Add Restaurant</h1>

		<form action="addRestaurant" method="post">

			<div class="form-group">
				<label>Restaurant Name</label> <input type="text" name="name"
					required>
			</div>

			<div class="form-group">
				<label>Cuisine Type</label> <input type="text" name="cuisineType"
					required>
			</div>

			<div class="form-group">
				<label>Delivery Time (Minutes)</label> <input type="number"
					name="deliveryTime" required>
			</div>

			<div class="form-group">
				<label>Address</label> <input type="text" name="address" required>
			</div>

			<div class="form-group">
				<label>Rating</label> <input type="text" name="rating" required>
			</div>

			<input type="submit" value="Add Restaurant" class="submit-btn">

		</form>

		<a href="home.jsp" class="home-btn"> Back To Home </a> 

	</div>

</body>
</html>
