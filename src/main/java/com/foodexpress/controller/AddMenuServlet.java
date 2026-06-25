package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.MenuDAO;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/addMenu")
public class AddMenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("addMenu.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Menu menu = new Menu();

		menu.setRestaurantId(Integer.parseInt(request.getParameter("restaurantId")));

		menu.setItemName(request.getParameter("itemName"));

		menu.setDescription(request.getParameter("description"));

		menu.setPrice(Double.parseDouble(request.getParameter("price")));

		menu.setCategory(request.getParameter("category"));

		MenuDAO dao = new MenuDAO();

		boolean added = dao.addMenu(menu);

		if (added) {

			response.sendRedirect("restaurants");

		} else {

			response.getWriter().println("Menu Add Failed");
		}
	}
}