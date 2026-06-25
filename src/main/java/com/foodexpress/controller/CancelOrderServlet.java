package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.OrderDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/cancelOrder")
public class CancelOrderServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int orderId = Integer.parseInt(request.getParameter("orderId"));

		OrderDAO dao = new OrderDAO();

		dao.cancelOrder(orderId);

		response.sendRedirect("orderHistory");
	}
}