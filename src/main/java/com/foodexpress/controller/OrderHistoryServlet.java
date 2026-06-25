package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.model.Order;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/orderHistory")
public class OrderHistoryServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		if (user == null) {

			response.sendRedirect("login.jsp");
			return;
		}

		OrderDAO dao = new OrderDAO();

		ArrayList<Order> orders = dao.getOrdersByUserId(user.getUserId());

		request.setAttribute("orders", orders);

		request.getRequestDispatcher("orderHistory.jsp").forward(request, response);
	}
}