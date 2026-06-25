package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.MenuDAO;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/editMenu")
public class EditMenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		MenuDAO dao = new MenuDAO();

		Menu menu = dao.getMenuById(menuId);

		request.setAttribute("menu", menu);

		request.getRequestDispatcher("editMenu.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		String itemName = request.getParameter("itemName");

		String description = request.getParameter("description");

		double price = Double.parseDouble(request.getParameter("price"));

		String category = request.getParameter("category");

		Menu menu = new Menu();

		menu.setMenuId(menuId);
		menu.setItemName(itemName);
		menu.setDescription(description);
		menu.setPrice(price);
		menu.setCategory(category);

		MenuDAO dao = new MenuDAO();

		dao.updateMenu(menu);

		response.sendRedirect("manageMenu");
	}
}