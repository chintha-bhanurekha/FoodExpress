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
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: #071226;
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 30px;
}

.container {
	width: 600px;
	background: #0D1B33;
	padding: 35px;
	border-radius: 20px;
	border: 1px solid #14284A;
	box-shadow: 0 10px 30px rgba(0, 0, 0, 0.4);
}

h1 {
	text-align: center;
	color: #ff5722;
	margin-bottom: 30px;
	font-size: 42px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	color: #22C55E;
	margin-bottom: 8px;
	font-weight: bold;
}

input {
	width: 100%;
	padding: 14px;
	border: none;
	outline: none;
	border-radius: 10px;
	background: #122547;
	color: white;
	font-size: 16px;
}

input:focus {
	border: 2px solid #ff5722;
}

.btn {
	width: 100%;
	padding: 14px;
	background: #ff5722;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
	margin-top: 10px;
}

.btn:hover {
	background: #e64a19;
}

.back-btn {
	display: block;
	text-align: center;
	margin-top: 20px;
	padding: 14px;
	background: #22C55E;
	color: white;
	text-decoration: none;
	border-radius: 10px;
	font-weight: bold;
}

.back-btn:hover {
	background: #16A34A;
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