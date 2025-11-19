<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Signup Mongo App</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #f7f7f7;
            font-family: sans-serif;
        }
        .register-card {
            max-width: 400px;
            width: 100%;
            margin: auto;
            box-shadow: 0 2px 16px rgba(0,0,0,0.12);
            padding: 2.5rem 2rem 2rem 2rem;
            background: #fff;
            border-radius: 1rem;
        }
        /* Ensures top-right button is always visible */
        .top-right-btn {
            position: fixed;
            top: 20px;
            right: 30px;
            z-index: 9999;
        }
    </style>
</head>
<body>
    <!-- Top-right Registered button -->
    <div class="top-right-btn">
        <a href="registered_users.jsp" class="btn btn-info">Registered</a>
    </div>

    <!-- Registration Form Card (example, edit as needed) -->
    <div class="register-card">
        <h2 class="mb-4 text-center">Register</h2>
        <form action="signup" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Name:</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password:</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Sign Up</button>
        </form>
    </div>
</body>
</html>
