package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.UserDAO;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UserDAO dao = new UserDAO();

		User user = dao.loginUser(email, password);

		if (user != null) {

			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			
			
			if ("ADMIN".equalsIgnoreCase(user.getRole())) {
			    response.sendRedirect("dashboard");
			} else {
			    response.sendRedirect("home.jsp");
			}

		} else {

			response.getWriter().println("Invalid Email or Password");
		}
	}
}