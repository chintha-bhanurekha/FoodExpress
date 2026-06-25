package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.dao.RestaurantDAO;
import com.foodexpress.dao.UserDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		UserDAO userDAO = new UserDAO();
		RestaurantDAO restaurantDAO = new RestaurantDAO();
		OrderDAO orderDAO = new OrderDAO();

		request.setAttribute("userCount", userDAO.getUserCount());

		request.setAttribute("restaurantCount", restaurantDAO.getRestaurantCount());

		request.setAttribute("orderCount", orderDAO.getOrderCount());

		request.setAttribute("revenue", orderDAO.getTotalRevenue());

		request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	}
}