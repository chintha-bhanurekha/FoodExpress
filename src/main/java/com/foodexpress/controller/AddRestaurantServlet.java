package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.RestaurantDAO;
import com.foodexpress.model.Restaurant;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/addRestaurant")
public class AddRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("addRestaurant.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		Restaurant restaurant = new Restaurant();

		restaurant.setName(request.getParameter("name"));

		restaurant.setCuisineType(request.getParameter("cuisineType"));

		restaurant.setDeliveryTime(Integer.parseInt(request.getParameter("deliveryTime")));

		restaurant.setAddress(request.getParameter("address"));

		restaurant.setRating(Double.parseDouble(request.getParameter("rating")));

		restaurant.setAdminUserId(user.getUserId());

		RestaurantDAO dao = new RestaurantDAO();

		boolean added = dao.addRestaurant(restaurant);

		if (added) {

			response.sendRedirect("restaurants");

		} else {

			response.getWriter().println("Restaurant Add Failed");
		}
	}
}