package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.dao.OrderItemDAO;
import com.foodexpress.model.Order;
import com.foodexpress.model.OrderItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/invoice")
public class InvoiceServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderDAO orderDAO = new OrderDAO();

		OrderItemDAO itemDAO = new OrderItemDAO();

		Order order = orderDAO.getOrderById(orderId);

		ArrayList<OrderItem> orderItems = itemDAO.getOrderItemsByOrderId(orderId);

		request.setAttribute("order", order);

		request.setAttribute("orderItems", orderItems);

		request.getRequestDispatcher("invoice.jsp").forward(request, response);
	}
}