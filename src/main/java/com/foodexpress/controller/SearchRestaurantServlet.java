package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.RestaurantDAO;
import com.foodexpress.model.Restaurant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/searchRestaurant")
public class SearchRestaurantServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String keyword = request.getParameter("keyword");

		RestaurantDAO dao = new RestaurantDAO();

		ArrayList<Restaurant> restaurants = dao.searchRestaurants(keyword);

		request.setAttribute("restaurants", restaurants);

		request.getRequestDispatcher("restaurants.jsp").forward(request, response);
	}
}