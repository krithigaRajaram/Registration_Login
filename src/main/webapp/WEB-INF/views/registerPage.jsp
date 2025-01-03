<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
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

        .registration-form {
            width: 90%;
            max-width: 300px; /* Reduced size */
            padding: 15px 20px; /* Equal left and right padding */
            background-color: #ffffff;
            border: 1px solid #e1e1e1;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .registration-form h2 {
            text-align: center;
            margin-bottom: 15px; /* Reduced margin for compactness */
            font-size: 20px; /* Slightly smaller font size */
            color: #333333;
        }

        .form-group {
            margin-bottom: 10px; /* Reduced spacing for compactness */
            margin-right: 20px;
        }

        .form-group label {
            display: block;
            font-size: 13px; /* Smaller font size for labels */
            margin-bottom: 5px;
            color: #555555;
        }

        .form-group input {
            width: 100%;
            padding: 8px; /* Slightly smaller padding for inputs */
            font-size: 13px; /* Consistent font size */
            border: 1px solid #cccccc;
            border-radius: 4px;
            background-color: #f9f9f9;
            transition: border-color 0.3s;
        }

        .form-group input:focus {
            border-color: #007bff;
            outline: none;
        }

     .form-group button {
    width: 90%;
    padding: 8px; /* Smaller button padding */
    font-size: 14px; /* Consistent button font size */
    background-color: #6c757d; /* Changed to grey */
    color: #ffffff; /* Updated text color for contrast */
    border: none;
    border-radius: 4px;
    cursor: pointer;
    margin: 20px;
    transition: background-color 0.3s;
}

.form-group button:hover {
    background-color: #5a6268; /* Slightly darker grey on hover */
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
    <div class="registration-form">
        <h2>User Registration</h2>
        <form action="<%= request.getContextPath() %>/userServlet" method="post">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>
            <div class="form-group">
                <label for="contact">Contact</label>
                <input type="text" id="contact" name="contact" required>
            </div>
            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" name="address">
            </div>
            <div class="form-group">
                <label for="city">City</label>
                <input type="text" id="city" name="city">
            </div>
            <div class="form-group">
                <label for="state">State</label>
                <input type="text" id="state" name="state">
            </div>
            <div class="form-group">
                <label for="country">Country</label>
                <input type="text" id="country" name="country">
            </div>
            <div class="form-group">
                <button type="submit">Register</button>
            </div>
        </form>
          <div class="text-center">
            <p>Already have an account? <a href="<%= request.getContextPath() %>/loginServlet">Login here</a></p>
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
            title: 'Registration Successful',
            text: 'Your account has been created successfully!',
            confirmButtonText: 'OK'
        }).then(() => {
            window.location.href = '<%= request.getContextPath() %>/dashboard';
        });

        <% } else if ("failure".equals(status)) { %>
        Swal.fire({
            icon: 'error',
            title: 'Registration Failed',
            text: 'An error occurred during registration. Please try again.',
            confirmButtonText: 'OK'
        });
        <% } %>
    </script>
</body>
</html>
