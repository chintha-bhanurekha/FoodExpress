package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.RestaurantDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteRestaurant")
public class DeleteRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

		RestaurantDAO dao = new RestaurantDAO();

		dao.deleteRestaurant(restaurantId);

		response.sendRedirect("manageRestaurants");
	}
}