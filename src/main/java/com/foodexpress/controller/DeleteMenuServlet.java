package com.foodexpress.controller;

import java.io.IOException;

import com.foodexpress.dao.MenuDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteMenu")
public class DeleteMenuServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		MenuDAO dao = new MenuDAO();

		dao.deleteMenu(menuId);

		response.sendRedirect("manageMenu");
	}
}