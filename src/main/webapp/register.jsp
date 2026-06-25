<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>

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

.container {
	width: 550px;
	background: white;
	padding: 40px;
	border-radius: 30px;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.08);
	transition: 0.3s;
}

.container:hover {
	transform: translateY(-5px);
}

h1 {
	text-align: center;
	font-size: 48px;
	font-weight: 800;
	margin-bottom: 30px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	color: #2563EB;
	font-size: 17px;
	font-weight: 700;
}

input, textarea {
	width: 100%;
	padding: 15px;
	border: 2px solid #E2E8F0;
	border-radius: 14px;
	background: #F8FAFC;
	color: #1E293B;
	font-size: 16px;
	transition: 0.3s;
}

input:focus, textarea:focus {
	outline: none;
	border-color: #2563EB;
	box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.10);
}

textarea {
	resize: none;
}

.btn {
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
}

.btn:hover {
	transform: translateY(-4px);
	box-shadow: 0 12px 30px rgba(124, 58, 237, 0.25);
}

.login-link {
	text-align: center;
	margin-top: 25px;
	color: #64748B;
	font-size: 16px;
}

.login-link a {
	text-decoration: none;
	color: #2563EB;
	font-weight: 700;
}

.login-link a:hover {
	color: #7C3AED;
}
</style>

</head>
<body>

	<div class="container">

		<h1>User Registration</h1>

		<form action="register" method="post">

			<div class="form-group">
				<label>Name</label> <input type="text" name="name" required>
			</div>

			<div class="form-group">
				<label>Email</label> <input type="email" name="email" required>
			</div>

			<div class="form-group">
				<label>Password</label> <input type="password" name="password"
					required>
			</div>

			<div class="form-group">
				<label>Phone</label> <input type="text" name="phone" required>
			</div>

			<div class="form-group">
				<label>Address</label>
				<textarea name="address" rows="3"></textarea>
			</div>

			<input type="submit" value="Register" class="btn">

		</form>

		<div class="login-link">
			Already have an account? <a href="login.jsp">Login</a>
		</div>

	</div>

</body>
</html>