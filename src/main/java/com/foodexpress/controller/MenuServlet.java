package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.MenuDAO;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/menu")
public class MenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int restaurantId = Integer.parseInt(request.getParameter("restaurantId"));

		MenuDAO dao = new MenuDAO();

		ArrayList<Menu> menuList = dao.getMenuByRestaurantId(restaurantId);

		request.setAttribute("menuList", menuList);

		request.getRequestDispatcher("menu.jsp").forward(request, response);
	}
}