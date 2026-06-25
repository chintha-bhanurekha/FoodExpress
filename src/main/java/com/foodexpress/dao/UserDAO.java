package com.foodexpress.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.foodexpress.model.User;
import com.foodexpress.util.DBConnection;

public class UserDAO {

	public boolean registerUser(User user) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String query = "INSERT INTO users(name,email,password,phone,address,role) VALUES(?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getPhone());
			ps.setString(5, user.getAddress());
			ps.setString(6, user.getRole());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public User loginUser(String email, String password) {

		User user = null;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT * FROM users WHERE email=? AND password=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();

			if (rs.next()) {

				user = new User();

				user.setUserId(rs.getInt("user_id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPhone(rs.getString("phone"));
				user.setAddress(rs.getString("address"));
				user.setRole(rs.getString("role"));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;
	}

	public boolean updateUser(User user) {

		boolean status = false;

		try {

			Connection con = DBConnection.getConnection();

			String query = "UPDATE users SET name=?, phone=?, address=? WHERE user_id=?";

			PreparedStatement ps = con.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getPhone());
			ps.setString(3, user.getAddress());
			ps.setInt(4, user.getUserId());

			int rows = ps.executeUpdate();

			if (rows > 0) {
				status = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return status;
	}

	public int getUserCount() {

		int count = 0;

		try {

			Connection con = DBConnection.getConnection();

			String query = "SELECT COUNT(*) FROM users";

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