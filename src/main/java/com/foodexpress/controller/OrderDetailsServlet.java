package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.OrderItemDAO;
import com.foodexpress.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/orderDetails")
public class OrderDetailsServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderItemDAO dao = new OrderItemDAO();

		ArrayList<OrderItem> orderItems = dao.getOrderItemsByOrderId(orderId);

		request.setAttribute("orderItems", orderItems);

		request.getRequestDispatcher("orderDetails.jsp").forward(request, response);
	}
}