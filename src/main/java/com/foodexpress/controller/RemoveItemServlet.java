package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/removeItem")
public class RemoveItemServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		HttpSession session = request.getSession();

		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

		if (cart != null) {

			for (int i = 0; i < cart.size(); i++) {

				if (cart.get(i).getMenuId() == menuId) {

					cart.remove(i);
					break;
				}
			}

			session.setAttribute("cart", cart);
		}

		response.sendRedirect("cart.jsp");
	}
}