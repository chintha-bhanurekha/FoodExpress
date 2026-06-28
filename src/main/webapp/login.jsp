<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FoodExpress Login</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
background: linear-gradient(135deg, #FFF8F2, #FFE9D6);
    color: #2C2C2C;
    }

.login-card {
	width: 450px;
	background: white;
	padding: 45px;
	border-radius: 25px;
	border:1px solid blue;
	box-shadow: 0 20px 50px rgba(124, 58, 237, 0.15);
	text-align: center;
}

.login-card h1 {
	font-size: 50px;
	font-weight: 800;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	margin-bottom: 10px;
}

.login-card h2 {
	color: #0F172A;
	font-size: 38px;
	margin-bottom: 30px;
}

.input-group {
	margin-bottom: 22px;
	text-align: left;
}

.input-group label {
	display: block;
	margin-bottom: 8px;
	color: #F59E0B;
	font-size: 18px;
	font-weight: 700;
}

.input-group input {
	width: 100%;
	padding: 15px;
	border: 2px solid #E2E8F0;
	border-radius: 12px;
	font-size: 16px;
	transition: 0.3s;
}

.input-group input:focus {
	outline: none;
	border-color: #2563EB;
	box-shadow: 0 0 10px rgba(37, 99, 235, 0.15);
}

.login-btn {
	width: 100%;
	padding: 15px;
	border: none;
	border-radius: 12px;
	background: linear-gradient(135deg, #2563EB, #7C3AED);
	color: white;
	font-size: 18px;
	font-weight: 600;
	cursor: pointer;
	transition: 0.3s;
}

.login-btn:hover {
	transform: translateY(-3px);
	box-shadow: 0 10px 25px rgba(124, 58, 237, 0.25);
}

.footer-text {
	margin-top: 22px;
	color: black;
	font-size: 15px;
	font-weight: 500;
}

.register-link {
	margin-top: 20px;
	text-align: center;
	color: #64748B;
	font-size: 15px;
}

.register-link a {
	color: #2563EB;
	text-decoration: none;
	font-weight: 700;
	margin-left: 5px;
	transition: 0.3s;
}

.register-link a:hover {
	color: #7C3AED;
}
</style>

</head>
<body>

	<div class="login-card">

		<h1>🍽️ FoodExpress</h1>
		<h2>User Login</h2>

		<form action="login" method="post">

			<div class="input-group">
				<label>Email</label> <input type="email" name="email"
					placeholder="Enter Email Address" required>
			</div>

			<div class="input-group">
				<label>Password</label> <input type="password" name="password"
					placeholder="Enter Password" required>
			</div>

			<input type="submit" value="Login" class="login-btn">

		</form>


		<div class="register-link">
			New User? <a href="register.jsp">Create Account</a>
		</div>

		<div class="footer-text">Welcome to FoodExpress 🚀</div>




	</div>

</body>
</html>