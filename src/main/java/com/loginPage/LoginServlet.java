package com.loginPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.registration.dao.UserDao;
import com.registration.model.User;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher =request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Create User object and set values
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);

        // Create UserDao object and check login credentials
        UserDao userDao = new UserDao();
        try {
            if (userDao.login(user)) {
                // Successful login, create session and store user info
                HttpSession session = request.getSession();
                session.setAttribute("user", user);  // Store the user object in session

                // Redirect to dashboard or home page
                response.sendRedirect("dashboard");
            } else {
                // Invalid credentials, set an error message
                request.setAttribute("loginError", "Invalid email or password!");
                request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "An error occurred while processing your request.");
        }
    }
}
