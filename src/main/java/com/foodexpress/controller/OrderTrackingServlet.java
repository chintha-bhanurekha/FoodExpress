package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderTracking")
public class OrderTrackingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderDAO dao = new OrderDAO();

		Order order = dao.getOrderById(orderId);

		request.setAttribute("order", order);

		
		
		request.getRequestDispatcher("/WEB-INF/orderTracking.jsp")
	       .forward(request, response);
	}
}