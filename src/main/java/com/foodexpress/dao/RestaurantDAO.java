package com.foodexpress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.foodexpress.model.Restaurant;
import com.foodexpress.util.DBConnection;

public class RestaurantDAO {

	public ArrayList<Restaurant> getAllRestaurants() {

		ArrayList<Restaurant> restaurants = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM restaurants WHERE is_active = true";

			PreparedStatement ps = con.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Restaurant restaurant = new Restaurant();

				restaurant.setRestaurantId(rs.getInt("restaurant_id"));
				restaurant.setName(rs.getString("name"));
				restaurant.setCuisineType(rs.getString("cuisine_type"));
				restaurant.setDeliveryTime(rs.getInt("delivery_time"));
				restaurant.setAddress(rs.getString("address"));
				restaurant.setRating(rs.getDouble("rating"));
				restaurant.setAdminUserId(rs.getInt("admin_user_id"));
				restaurant.setActive(rs.getBoolean("is_active"));

				restaurants.add(restaurant);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return restaurants;
	}

	public ArrayList<Restaurant> searchRestaurants(String keyword) {

		ArrayList<Restaurant> restaurants = new ArrayList<>();

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM restaurants " + "WHERE is_active=true AND name LIKE ?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, "%" + keyword + "%");

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {

				Restaurant restaurant = new Restaurant();

				restaurant.setRestaurantId(rs.getInt("restaurant_id"));

				restaurant.setName(rs.getString("name"));

				restaurant.setCuisineType(rs.getString("cuisine_type"));

				restaurant.setDeliveryTime(rs.getInt("delivery_time"));

				restaurant.setAddress(rs.getString("address"));

				restaurant.setRating(rs.getDouble("rating"));

				restaurant.setAdminUserId(rs.getInt("admin_user_id"));

				restaurant.setActive(rs.getBoolean("is_active"));

				restaurants.add(restaurant);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return restaurants;
	}

	public boolean addRestaurant(Restaurant restaurant) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO restaurants(name,cuisine_type,delivery_time,address,rating,admin_user_id,is_active) VALUES(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, restaurant.getName());
			ps.setString(2, restaurant.getCuisineType());
			ps.setInt(3, restaurant.getDeliveryTime());
			ps.setString(4, restaurant.getAddress());
			ps.setDouble(5, restaurant.getRating());
			ps.setInt(6, restaurant.getAdminUserId());
			ps.setBoolean(7, true);

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public void deleteRestaurant(int restaurantId) {

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE restaurants SET is_active=false WHERE restaurant_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, restaurantId);

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Restaurant getRestaurantById(int restaurantId) {

		Restaurant restaurant = null;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM restaurants WHERE restaurant_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setInt(1, restaurantId);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				restaurant = new Restaurant();

				restaurant.setRestaurantId(rs.getInt("restaurant_id"));

				restaurant.setName(rs.getString("name"));

				restaurant.setCuisineType(rs.getString("cuisine_type"));

				restaurant.setDeliveryTime(rs.getInt("delivery_time"));

				restaurant.setAddress(rs.getString("address"));

				restaurant.setRating(rs.getDouble("rating"));

				restaurant.setAdminUserId(rs.getInt("admin_user_id"));

				restaurant.setActive(rs.getBoolean("is_active"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return restaurant;
	}

	public int getRestaurantCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT COUNT(*) FROM restaurants WHERE is_active=true";

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

}