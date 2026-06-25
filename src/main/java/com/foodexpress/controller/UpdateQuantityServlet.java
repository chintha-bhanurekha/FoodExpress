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

@WebServlet("/updateQuantity")
public class UpdateQuantityServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		String action = request.getParameter("action");

		HttpSession session = request.getSession();

		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

		if (cart != null) {

			for (CartItem item : cart) {

				if (item.getMenuId() == menuId) {

					if ("increase".equals(action)) {

						item.setQuantity(item.getQuantity() + 1);

					} else if ("decrease".equals(action)) {

						if (item.getQuantity() > 1) {

							item.setQuantity(item.getQuantity() - 1);
						}
					}

					break;
				}
			}
		}

		response.sendRedirect("cart.jsp");
	}
}