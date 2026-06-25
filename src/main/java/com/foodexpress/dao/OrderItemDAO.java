package com.foodexpress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodexpress.model.OrderItem;
import com.foodexpress.util.DBConnection;

public class OrderItemDAO {

	public void addOrderItem(OrderItem item) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO order_items(order_id,menu_id,quantity,item_total) VALUES(?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, item.getOrderId());
			ps.setInt(2, item.getMenuId());
			ps.setInt(3, item.getQuantity());
			ps.setDouble(4, item.getItemTotal());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public ArrayList<OrderItem> getOrderItemsByOrderId(int orderId) {

		ArrayList<OrderItem> items = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT oi.*, m.item_name " + "FROM order_items oi "
					+ "JOIN menu m ON oi.menu_id = m.menu_id " + "WHERE oi.order_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, orderId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				OrderItem item = new OrderItem();

				item.setOrderItemId(rs.getInt("order_item_id"));
				item.setOrderId(rs.getInt("order_id"));
				item.setMenuId(rs.getInt("menu_id"));
				item.setItemName(rs.getString("item_name"));
				item.setQuantity(rs.getInt("quantity"));
				item.setItemTotal(rs.getDouble("item_total"));

				items.add(item);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return items;
	}
}