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
<title>My Profile</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	background: linear-gradient(135deg, #F8FAFC, #EEF2FF);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 40px;
}

.card {
	width: 800px;
	background: white;
	border-radius: 30px;
	padding: 45px;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
	border:1px solid blue;
}

.card:hover {
	transform: translateY(-5px);
}

h1 {
	text-align: center;
	font-size: 56px;
	font-weight: 800;
	margin-bottom: 35px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.profile-row {
	background: #F8FAFC;
	border: 2px solid #E2E8F0;
	padding: 18px 22px;
	border-radius: 16px;
	margin-bottom: 18px;
	font-size: 20px;
	color: #1E293B;
	transition: 0.3s;
}

.profile-row:hover {
	transform: translateX(8px);
	border-color: #2563EB;
	box-shadow: 0 10px 25px rgba(37, 99, 235, 0.12);
}

.label {
	color: #2563EB;
	font-weight: 700;
	margin-right: 8px;
}

.button-group {
	text-align: center;
	margin-top: 35px;
}

.edit-btn {
	display: inline-block;
	padding: 16px 32px;
	text-decoration: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	font-size: 18px;
	font-weight: 700;
	margin-right: 15px;
	transition: 0.3s;
	border:1px solid blue;
}

.edit-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(124, 58, 237, 0.25);
}

.home-btn {
	display: inline-block;
	padding: 16px 32px;
	text-decoration: none;
	border-radius: 14px;
	background: linear-gradient(135deg, #22C55E, #16A34A);
	color: white;
	font-size: 18px;
	font-weight: 700;
	box-shadow: 0 12px 30px rgba(124, 58, 237, 0.25);
	border:1px solid green;
	transition: 0.3s;
}

















.home-btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(34, 197, 94, 0.25);
}
</style>

</head>
<body>

	<div class="card">


		<h1>My Profile</h1>

		<div class="profile-row">
			<span class="label">User ID :</span>
			<%=user.getUserId()%>
		</div>

		<div class="profile-row">
			<span class="label">Name :</span>
			<%=user.getName()%>
		</div>

		<div class="profile-row">
			<span class="label">Email :</span>
			<%=user.getEmail()%>
		</div>

		<div class="profile-row">
			<span class="label">Phone :</span>
			<%=user.getPhone()%>
		</div>

		<div class="profile-row">
			<span class="label">Address :</span>
			<%=user.getAddress()%>
		</div>

		<div class="profile-row">
			<span class="label">Role :</span>
			<%=user.getRole()%>
		</div>

		<div class="button-group">

			
			<a href="editProfile" class="edit-btn"> Edit Profile </a>


<a href="home.jsp" class="home-btn"> Back To Home </a>
			
			
			
			
			
			
			
		</div>


	</div>

</body>
</html>
