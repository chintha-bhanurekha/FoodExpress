package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.MenuDAO;
import com.foodexpress.model.CartItem;
import com.foodexpress.model.Menu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int menuId = Integer.parseInt(request.getParameter("menuId"));

		MenuDAO dao = new MenuDAO();

		Menu menu = dao.getMenuById(menuId);

		HttpSession session = request.getSession();

		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

		if (cart == null) {
			cart = new ArrayList<>();
		}

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		// Allow only one restaurant in the cart

		if (!cart.isEmpty()) {

		    int existingRestaurantId = cart.get(0).getRestaurantId();

		    if (existingRestaurantId != menu.getRestaurantId()) {

		        response.getWriter().println(
		            "<script>"
		            + "alert('You can order from only one restaurant at a time. Please clear your cart first.');"
		            + "window.location='menu?restaurantId=" + menu.getRestaurantId() + "';"
		            + "</script>");

		        return;
		    }
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		boolean itemExists = false;

		for (CartItem item : cart) {

			if (item.getMenuId() == menuId) {

				item.setQuantity(item.getQuantity() + 1);

				itemExists = true;

				break;
			}
		}

		if (!itemExists) {

			CartItem item = new CartItem();

			item.setMenuId(menu.getMenuId());
			item.setRestaurantId(menu.getRestaurantId());
			item.setItemName(menu.getItemName());
			item.setPrice(menu.getPrice());
			item.setQuantity(1);

			cart.add(item);
		}

		session.setAttribute("cart", cart);

		response.sendRedirect("cart.jsp");
	}
}