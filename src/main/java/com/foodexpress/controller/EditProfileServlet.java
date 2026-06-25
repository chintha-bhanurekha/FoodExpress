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

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("editProfile.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		user.setName(request.getParameter("name"));

		user.setPhone(request.getParameter("phone"));

		user.setAddress(request.getParameter("address"));

		UserDAO dao = new UserDAO();

		boolean updated = dao.updateUser(user);

		if (updated) {

			session.setAttribute("user", user);

			response.sendRedirect("profile");

		} else {

			response.getWriter().println("Profile Update Failed");
		}
	}
}