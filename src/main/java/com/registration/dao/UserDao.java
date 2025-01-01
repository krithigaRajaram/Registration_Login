package com.registration.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.registration.model.User;

public class UserDao {

    public int registration(User User) throws ClassNotFoundException {
        // Database credentials
        String jdbcURL = "jdbc:mysql://localhost:3306/user";
        String username = "root";
        String password = "Kr!sh!@3";
     
        String query = "INSERT INTO user (name, email, password, contact,address,city,state,country) VALUES (?, ?, ?, ?,?,?,?,?)";
        int result=0;
        Class.forName("com.mysql.jdbc.Driver");
        try(Connection connection = DriverManager
        		.getConnection(jdbcURL, username, password);
        		
            // Create the PreparedStatement
            PreparedStatement preparedStatement = connection.prepareStatement(query)){

            // Example of setting values (you can modify or remove these lines as needed)
            preparedStatement.setString(1, User.getName());
            preparedStatement.setString(2, User.getEmail());
            preparedStatement.setString(3, User.getPassword());
            preparedStatement.setString(4, User.getContact());
            preparedStatement.setString(5, User.getAddress());
            preparedStatement.setString(6, User.getCity());
            preparedStatement.setString(7, User.getState());
            preparedStatement.setString(8, User.getCountry());

            System.out.println(preparedStatement);
            result=preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
       
    }
}
