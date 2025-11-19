<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f0f8ff;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            width: 450px;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            background-color: white;
            border-left: 5px solid #17a2b8;
            animation: slideIn 0.8s ease-out;
        }
        h3 {
            font-weight: 700;
            color: #17a2b8;
        }
        .form-control {
            border-radius: 8px;
            border-color: #ced4da;
            transition: border-color 0.3s;
        }
        .form-control:focus {
            border-color: #17a2b8;
            box-shadow: 0 0 0 0.25rem rgba(23, 162, 184, 0.25);
        }
        .btn-primary {
            border-radius: 50px;
            font-weight: 600;
            background-color: #17a2b8;
            border-color: #17a2b8;
            transition: transform 0.2s;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
        }
        @keyframes slideIn {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
        }
        /* NEW FOOTER STYLE */
        .version-footer {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            padding: 5px;
            background-color: rgba(0, 0, 0, 0.6);
            color: white;
            text-align: center;
            font-size: 0.75rem;
            z-index: 1000;
        }
    </style>
</head>
<body>
    <div class="card">
        <h3 class="text-center mb-4">Create Your Account</h3>
        
        <form action="signup" method="post">
            <div class="mb-3">
                <label class="form-label">Full Name</label>
                <input type="text" name="name" class="form-control" placeholder="Enter your full name" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Email Address</label>
                <input type="email" name="email" class="form-control" placeholder="e.g., user@example.com" required>
            </div>
            <div class="mb-4">
                <label class="form-label">Password</label>
                <input type="password" name="password" class="form-control" placeholder="Create a strong password" required>
            </div>
            
            <% 
                if (request.getAttribute("error") != null) { 
            %>
                <div class="alert alert-danger"><%= request.getAttribute("error") %></div>
            <% 
                } 
            %>
            
            <button type="submit" class="btn btn-primary w-100 mt-2">Sign Up</button>
        </form>
        <div class="text-center mt-4">
            <a href="login.jsp" class="text-decoration-none text-muted">Already have an account? Login here.</a>
            <br>
            <a href="index.jsp" class="text-decoration-none text-muted mt-2 d-block">← Main Menu</a>
        </div>
    </div>
    <div style="position: fixed; bottom: 10px; right: 20px; background: #f0f0f0; color: #333; padding: 5px 14px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.07); font-size: 13px; z-index: 9999;">
    <b>Pod/Con: <b>${podName}</b>
    </div>
    <footer class="version-footer">
        Application Version: <%= application.getInitParameter("app.version") %>
    </footer>
</body>
</html>
