package com.foodexpress.controller;

import java.io.IOException;


import com.foodexpress.dao.UserDAO;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");

		User user = new User();

		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setAddress(address);
		user.setRole("CUSTOMER");

		UserDAO dao = new UserDAO();

		boolean status = dao.registerUser(user);

		if (status) {
			response.sendRedirect("login.jsp");
		} else {
			response.getWriter().println("Registration Failed");
		}
	}
}