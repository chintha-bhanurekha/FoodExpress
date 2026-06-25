package com.foodexpress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodexpress.model.Menu;
import com.foodexpress.util.DBConnection;

public class MenuDAO {

	public ArrayList<Menu> getMenuByRestaurantId(int restaurantId) {

		ArrayList<Menu> menuList = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM menu WHERE restaurant_id=? AND is_available=true";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, restaurantId);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Menu menu = new Menu();

				menu.setMenuId(rs.getInt("menu_id"));
				menu.setRestaurantId(rs.getInt("restaurant_id"));
				menu.setItemName(rs.getString("item_name"));
				menu.setDescription(rs.getString("description"));
				menu.setPrice(rs.getDouble("price"));
				menu.setAvailable(rs.getBoolean("is_available"));
				menu.setCategory(rs.getString("category"));

				menuList.add(menu);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return menuList;
	}

	public Menu getMenuById(int menuId) {

		Menu menu = null;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM menu WHERE menu_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, menuId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				menu = new Menu();

				menu.setMenuId(rs.getInt("menu_id"));
				menu.setRestaurantId(rs.getInt("restaurant_id"));
				menu.setItemName(rs.getString("item_name"));
				menu.setDescription(rs.getString("description"));
				menu.setPrice(rs.getDouble("price"));
				menu.setAvailable(rs.getBoolean("is_available"));
				menu.setCategory(rs.getString("category"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return menu;
	}

	public ArrayList<Menu> searchMenuItems(String keyword) {

		ArrayList<Menu> menuList = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM menu WHERE is_available=true AND item_name LIKE ?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, "%" + keyword + "%");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Menu menu = new Menu();

				menu.setMenuId(rs.getInt("menu_id"));
				menu.setRestaurantId(rs.getInt("restaurant_id"));
				menu.setItemName(rs.getString("item_name"));
				menu.setDescription(rs.getString("description"));
				menu.setPrice(rs.getDouble("price"));
				menu.setAvailable(rs.getBoolean("is_available"));
				menu.setCategory(rs.getString("category"));

				menuList.add(menu);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return menuList;
	}

	public boolean addMenu(Menu menu) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO menu(restaurant_id,item_name,description,price,is_available,category) VALUES(?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, menu.getRestaurantId());
			ps.setString(2, menu.getItemName());
			ps.setString(3, menu.getDescription());
			ps.setDouble(4, menu.getPrice());
			ps.setBoolean(5, true);
			ps.setString(6, menu.getCategory());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public ArrayList<Menu> getAllMenus() {

		ArrayList<Menu> menuList = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM menu WHERE is_available=true";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Menu menu = new Menu();

				menu.setMenuId(rs.getInt("menu_id"));
				menu.setRestaurantId(rs.getInt("restaurant_id"));
				menu.setItemName(rs.getString("item_name"));
				menu.setDescription(rs.getString("description"));
				menu.setPrice(rs.getDouble("price"));
				menu.setAvailable(rs.getBoolean("is_available"));
				menu.setCategory(rs.getString("category"));

				menuList.add(menu);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return menuList;
	}

	public void deleteMenu(int menuId) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE menu SET is_available=false WHERE menu_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, menuId);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateMenu(Menu menu) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE menu SET item_name=?, description=?, price=?, category=? WHERE menu_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, menu.getItemName());
			ps.setString(2, menu.getDescription());
			ps.setDouble(3, menu.getPrice());
			ps.setString(4, menu.getCategory());
			ps.setInt(5, menu.getMenuId());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}