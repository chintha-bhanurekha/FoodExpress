<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodexpress.model.Menu"%>

<%
Menu menu = (Menu) request.getAttribute("menu");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Menu</title>

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

/* Container */

.container{
    width:650px;
    background:#fff;
    border-radius:25px;
    padding:40px;
    box-shadow:0 20px 50px rgba(124,58,237,.15);
    border:1px solid blue;
}

/* Heading */

h1{
    text-align:center;
    font-size:42px;
    font-weight:800;
    margin-bottom:35px;

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
    font-size:16px;
    font-weight:700;
    color:#334155;
}

input,
textarea,
select{
    width:100%;
    padding:14px;
    font-size:16px;

    border:2px solid #CBD5E1;
    border-radius:12px;

    outline:none;

    transition:.3s;

    background:#F8FAFC;
}

input:focus,
textarea:focus,
select:focus{

    border-color:#2563EB;

    background:#fff;

    box-shadow:0 0 12px rgba(37,99,235,.20);
}

textarea{
    resize:none;
}

/* Update Button */

.btn{

    width:100%;

    padding:15px;

    border:none;

    border-radius:12px;

    background:linear-gradient(135deg,#2563EB,#7C3AED);

    color:white;

    font-size:18px;

    font-weight:700;

    cursor:pointer;

    transition:.3s;
}

.btn:hover{

    transform:translateY(-3px);

    box-shadow:0 15px 30px rgba(124,58,237,.30);
}

/* Back Button */

.back-btn{

    display:block;

    text-align:center;

    margin-top:18px;

    text-decoration:none;

    padding:15px;

    border-radius:12px;

    background:linear-gradient(135deg,#F59E0B,#FBBF24);

    color:#0F172A;

    font-size:17px;

    font-weight:700;

    transition:.3s;
}

.back-btn:hover{

    transform:translateY(-3px);

    box-shadow:0 10px 25px rgba(245,158,11,.35);
}

/* Responsive */

@media(max-width:700px){

    body{
        padding:20px;
    }

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

		<h1>Edit Menu</h1>

		<form action="editMenu" method="post">

			<input type="hidden" name="menuId" value="<%=menu.getMenuId()%>">

			<div class="form-group">
				<label>Item Name</label> <input type="text" name="itemName"
					value="<%=menu.getItemName()%>">
			</div>

			<div class="form-group">
				<label>Description</label> <input type="text" name="description"
					value="<%=menu.getDescription()%>">
			</div>

			<div class="form-group">
				<label>Price</label> <input type="text" name="price"
					value="<%=menu.getPrice()%>">
			</div>

			<div class="form-group">
				<label>Category</label> <input type="text" name="category"
					value="<%=menu.getCategory()%>">
			</div>

			<input type="submit" value="Update Menu" class="btn">

		</form>

		<a href="manageMenu" class="back-btn"> Back To Menu </a>

	</div>

</body>
</html>