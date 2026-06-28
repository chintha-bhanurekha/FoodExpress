<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="com.foodexpress.model.User"%>

<%
User user = (User) session.getAttribute("user");
%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
	
	
	background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
}

.container {
	width: 700px;
	background: white;
	border-radius: 30px;
	padding: 45px;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
		border:1px solid blue;

}

.container:hover {
	transform: translateY(-5px);
}

h1 {
	text-align: center;
	font-size: 52px;
	font-weight: 800;
	margin-bottom: 35px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.form-group {
	margin-bottom: 22px;
}

label {
	display: block;
	margin-bottom: 10px;
	color: #2563EB;
	font-size: 18px;
	font-weight: 700;
}

input {
	width: 100%;
	padding: 16px 18px;
	border: 2px solid #E2E8F0;
	border-radius: 14px;
	background: #F8FAFC;
	color: #1E293B;
	font-size: 17px;
	transition: 0.3s;
}

input:focus {
	outline: none;
	border-color: #2563EB;
	box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.10);
}

.update-btn {
	width: 100%;
	padding: 16px;
	border: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	font-size: 18px;
	font-weight: 700;
	cursor: pointer;
	transition: 0.3s;
		border:1px solid blue;

}

.update-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(124, 58, 237, 0.25);
}

.back-btn {
	display: block;
	text-align: center;
	margin-top: 18px;
	padding: 16px;
	text-decoration: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #22C55E, #16A34A);
	color: white;
	font-size: 18px;
	font-weight: 700;
	transition: 0.3s;
		border:1px solid  #22C55E;

}

.back-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(34, 197, 94, 0.25);
}
</style>

</head>
<body>

	<div class="container">


		<h1>Edit Profile</h1>

		<form action="editProfile" method="post">

			<div class="form-group">
				<label>Name</label> <input type="text" name="name"
					value="<%=user.getName()%>" required>
			</div>

			<div class="form-group">
				<label>Phone</label> <input type="text" name="phone"
					value="<%=user.getPhone()%>" required>
			</div>

			<div class="form-group">
				<label>Address</label> <input type="text" name="address"
					value="<%=user.getAddress()%>" required>
			</div>

			<input type="submit" value="Update Profile" class="update-btn">

		</form>

		<a href="profile" class="back-btn"> Back To Profile </a>

	</div>

</body>
</html>
