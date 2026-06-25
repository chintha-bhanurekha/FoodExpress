package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.MenuDAO;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateMenu")
public class UpdateMenuServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Menu menu = new Menu();

		menu.setMenuId(Integer.parseInt(request.getParameter("menuId")));

		menu.setItemName(request.getParameter("itemName"));

		menu.setDescription(request.getParameter("description"));

		menu.setPrice(Double.parseDouble(request.getParameter("price")));

		menu.setCategory(request.getParameter("category"));

		MenuDAO dao = new MenuDAO();

		dao.updateMenu(menu);

		response.sendRedirect("manageMenu");
	}
}