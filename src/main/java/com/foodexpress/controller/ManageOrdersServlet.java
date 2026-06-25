package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/manageOrders")
public class ManageOrdersServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		OrderDAO dao = new OrderDAO();

		ArrayList<Order> orders = dao.getAllOrders();

		request.setAttribute("orders", orders);

		request.getRequestDispatcher("manageOrders.jsp").forward(request, response);
	}
}