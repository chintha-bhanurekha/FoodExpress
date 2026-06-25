package com.foodexpress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodexpress.model.Order;
import com.foodexpress.util.DBConnection;

public class OrderDAO {

	public int placeOrder(Order order) {

		int orderId = 0;

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO orders(user_id,restaurant_id,total_amount,status,payment_method,full_name,phone,address,city,pincode) VALUES(?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

			ps.setInt(1, order.getUserId());
			ps.setInt(2, order.getRestaurantId());
			ps.setDouble(3, order.getTotalAmount());
			ps.setString(4, order.getStatus());
			ps.setString(5, order.getPaymentMethod());

			ps.setString(6, order.getFullName());
			ps.setString(7, order.getPhone());
			ps.setString(8, order.getAddress());
			ps.setString(9, order.getCity());
			ps.setString(10, order.getPincode());
			ps.executeUpdate();

			ResultSet rs = ps.getGeneratedKeys();

			if (rs.next()) {
				orderId = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orderId;
	}

	public ArrayList<Order> getOrdersByUserId(int userId) {

		ArrayList<Order> orders = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT o.*, r.name AS restaurant_name " + "FROM orders o "
					+ "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " + "WHERE o.user_id=? "
					+ "ORDER BY o.order_date DESC";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Order order = new Order();

				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getInt("user_id"));
				order.setRestaurantId(rs.getInt("restaurant_id"));
				order.setRestaurantName(rs.getString("restaurant_name"));
				order.setTotalAmount(rs.getDouble("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setOrderDate(rs.getTimestamp("order_date"));

				orders.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orders;
	}

	public void cancelOrder(int orderId) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE orders SET status='CANCELLED' WHERE order_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, orderId);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Order getOrderById(int orderId) {

		Order order = null;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT o.*, r.name AS restaurant_name " + "FROM orders o "
					+ "JOIN restaurants r ON o.restaurant_id=r.restaurant_id " + "WHERE o.order_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, orderId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				order = new Order();

				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getInt("user_id"));
				order.setRestaurantId(rs.getInt("restaurant_id"));
				order.setRestaurantName(rs.getString("restaurant_name"));
				order.setTotalAmount(rs.getDouble("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setOrderDate(rs.getTimestamp("order_date"));
				
				
				
				order.setFullName(rs.getString("full_name"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setPincode(rs.getString("pincode"));
				
				
				
				
				
				
				
				
				
				
				
				
				
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return order;
	}

	public ArrayList<Order> getAllOrders() {

		ArrayList<Order> orders = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT o.*, r.name AS restaurant_name " + "FROM orders o "
					+ "JOIN restaurants r ON o.restaurant_id = r.restaurant_id " + "ORDER BY o.order_date DESC";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Order order = new Order();

				order.setOrderId(rs.getInt("order_id"));
				order.setUserId(rs.getInt("user_id"));
				order.setRestaurantId(rs.getInt("restaurant_id"));
				order.setRestaurantName(rs.getString("restaurant_name"));
				order.setTotalAmount(rs.getDouble("total_amount"));
				order.setStatus(rs.getString("status"));
				order.setPaymentMethod(rs.getString("payment_method"));
				order.setOrderDate(rs.getTimestamp("order_date"));
				
				
				
				
				
				order.setFullName(rs.getString("full_name"));
				order.setPhone(rs.getString("phone"));
				order.setAddress(rs.getString("address"));
				order.setCity(rs.getString("city"));
				order.setPincode(rs.getString("pincode"));
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				

				orders.add(order);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return orders;
	}

	public void updateOrderStatus(int orderId, String status) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE orders SET status=? WHERE order_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, status);
			ps.setInt(2, orderId);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int getOrderCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT COUNT(*) FROM orders";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				count = rs.getInt(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return count;
	}

	public double getTotalRevenue() {

		double revenue = 0;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT SUM(total_amount) FROM orders";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				revenue = rs.getDouble(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return revenue;
	}
}