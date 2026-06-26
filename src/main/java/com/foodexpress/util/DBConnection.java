package com.foodexpress.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static Connection connection;

    public static Connection getConnection() {

        try {

            if (connection == null || connection.isClosed()) {

                Class.forName("com.mysql.cj.jdbc.Driver");

                // Render Environment Variable check
                String host = System.getenv("DB_HOST");

                if (host == null || host.isBlank()) {

                    // ==========================
                    // Localhost (Eclipse + Tomcat)
                    // ==========================
                    connection = DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/foodexpress",
                            "root",
                            "Bhanu25@8084");

                } else {

                    // ==========================
                    // Render + FreeDB
                    // ==========================
                    String port = System.getenv("DB_PORT");
                    String dbName = System.getenv("DB_NAME");
                    String username = System.getenv("DB_USERNAME");
                    String password = System.getenv("DB_PASSWORD");

                    String url = "jdbc:mysql://" + host + ":" + port + "/" + dbName
                            + "?useSSL=false"
                            + "&allowPublicKeyRetrieval=true"
                            + "&serverTimezone=UTC";

                    connection = DriverManager.getConnection(url, username, password);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return connection;
    }
}