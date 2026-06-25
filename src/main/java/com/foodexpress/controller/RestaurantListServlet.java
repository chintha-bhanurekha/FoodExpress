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

@WebServlet("/restaurants")
public class RestaurantListServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RestaurantDAO dao = new RestaurantDAO();

		ArrayList<Restaurant> restaurants = dao.getAllRestaurants();

		
		System.out.println("Restaurant Count = " + restaurants.size());
		
		
		request.setAttribute("restaurants", restaurants);

		request.getRequestDispatcher("restaurants.jsp").forward(request, response);
	}
}