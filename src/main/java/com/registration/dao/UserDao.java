package com.registration.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.registration.model.User;

public class UserDao {

    // Database credentials
    private static final String jdbcURL = "jdbc:mysql://localhost:3306/user";
    private static final String username = "root";
    private static final String password = "Kr!sh!@3";

    // Method to establish a database connection
    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection(jdbcURL, username, password);
    }

    // Registration method
    public int registration(User user) throws ClassNotFoundException {
        String query = "INSERT INTO user (name, email, password, contact, address, city, state, country) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        int result = 0;

        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set the values for the query
            preparedStatement.setString(1, user.getName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setString(4, user.getContact());
            preparedStatement.setString(5, user.getAddress());
            preparedStatement.setString(6, user.getCity());
            preparedStatement.setString(7, user.getState());
            preparedStatement.setString(8, user.getCountry());

            result = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    // Login method
    public boolean login(User user) throws ClassNotFoundException {
        String query = "SELECT * FROM user WHERE email=? AND password=?";
        boolean isAuthenticated = false;

        try (Connection connection = getConnection(); 
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            preparedStatement.setString(1, user.getEmail());
            preparedStatement.setString(2, user.getPassword());

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                // If user exists in the database, set authentication flag to true
                isAuthenticated = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isAuthenticated;
    }
}
