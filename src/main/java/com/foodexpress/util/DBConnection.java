package com.foodexpress.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection connection;

	public static Connection getConnection() {

		try {

			if (connection == null || connection.isClosed()) {

				Class.forName("com.mysql.cj.jdbc.Driver");

				connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/foodexpress", "root",
						"Bhanu25@8084");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return connection;
	}
}