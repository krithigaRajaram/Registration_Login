<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-form {
            width: 90%;
            max-width: 300px;
            padding: 15px 20px;
            background-color: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 15px;
            font-size: 20px;
            color: #333333;
        }

        .form-group {
            margin-bottom: 10px;
            margin-right: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px;
            margin-bottom: 5px;
            color: #555555;
        }

        .form-group input {
            width: 100%;
            padding: 8px;
            font-size: 13px;
            border: 1px solid #cccccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
            
        }

        .form-group input:focus {
            border-color: #6c757d;
            outline: none;
        }

        .form-group button {
             width: 90%;
    padding: 8px;
    font-size: 14px;
    background-color: #6c757d; 
    color: #ffffff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin: 20px;
    transition: background-color 0.3s;
        }

        .form-group button:hover {
             background-color: #5a6268; 
        }

        .form-group:last-child {
            margin-bottom: 0;
        }

        .text-center {
            text-align: center;
            margin-top: 10px;
        }

        .text-center a {
            color: #555555;
            text-decoration: none;
        }

        .text-center a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-form">
        <h2>User Login</h2>
        <form action="<%= request.getContextPath() %>/loginServlet" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <button type="submit">Login</button>
            </div>
        </form>
        <div class="text-center">
            <p>Don't have an account? <a href="<%= request.getContextPath() %>/userServlet">Register here</a></p>
        </div>
    </div>

    <script type="text/javascript">
        // Using server-side status to show alerts
        <% 
        String status = (String) request.getAttribute("status"); 
        if ("success".equals(status)) { 
        %>
        Swal.fire({
            icon: 'success',
            title: 'Login Successful',
            text: 'Welcome back!',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = '<%= request.getContextPath() %>/dashboard'; 
        });
        <% } else if ("failure".equals(status)) { %>
        Swal.fire({
            icon: 'error',
            title: 'Login Failed',
            text: 'Invalid email or password. Please try again.',
            confirmButtonText: 'OK'
        });
        <% } %>
    </script>
</body>
</html>
