package com.foodexpress.controller;

import java.io.IOException;
import java.util.ArrayList;

import com.foodexpress.dao.OrderDAO;
import com.foodexpress.dao.OrderItemDAO;
import com.foodexpress.model.CartItem;
import com.foodexpress.model.Order;
import com.foodexpress.model.OrderItem;
import com.foodexpress.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/placeOrder")
public class OrderServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		User user = (User) session.getAttribute("user");

		ArrayList<CartItem> cart = (ArrayList<CartItem>) session.getAttribute("cart");

		if (cart == null || cart.isEmpty()) {

			response.sendRedirect("cart.jsp");
			return;
		}

		double totalAmount = 0;

		for (CartItem item : cart) {
			totalAmount += item.getTotalPrice();
		}

		String paymentMethod = request.getParameter("paymentMethod");

		
		
		
		
		
		String fullName = request.getParameter("fullName");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String pincode = request.getParameter("pincode");
		
		
		
		
		
		
		
		
		
		
		
		
		
		System.out.println("Full Name = " + fullName);
		System.out.println("Phone = " + phone);
		System.out.println("Address = " + address);
		System.out.println("City = " + city);
		System.out.println("Pincode = " + pincode);
		
		
		
		
		
		
		
		
		System.out.println("User ID = " + user.getUserId());
		System.out.println("Restaurant ID = " + cart.get(0).getRestaurantId());
		System.out.println("Total Amount = " + totalAmount);
		System.out.println("Payment Method = " + paymentMethod);

		Order order = new Order();

		order.setUserId(user.getUserId());

		order.setRestaurantId(cart.get(0).getRestaurantId());

		order.setTotalAmount(totalAmount);

		order.setStatus("PENDING");

		order.setPaymentMethod(paymentMethod);
		
		
		
		
		
		
		
		
		
		order.setFullName(fullName);
		order.setPhone(phone);
		order.setAddress(address);
		order.setCity(city);
		order.setPincode(pincode);
		
		
		
		
		
		
		
		
		

		OrderDAO orderDAO = new OrderDAO();

		int orderId = orderDAO.placeOrder(order);

		System.out.println("Generated Order ID = " + orderId);

		OrderItemDAO orderItemDAO = new OrderItemDAO();

		for (CartItem item : cart) {

			OrderItem orderItem = new OrderItem();

			orderItem.setOrderId(orderId);

			orderItem.setMenuId(item.getMenuId());

			orderItem.setQuantity(item.getQuantity());

			orderItem.setItemTotal(item.getTotalPrice());

			orderItemDAO.addOrderItem(orderItem);
		}

		session.removeAttribute("cart");

		response.sendRedirect("orderSuccess.jsp");
	}
}