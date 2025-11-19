<%@ page contentType="text/html;charset=UTF-8" %>
<% 
    // 1. Check for logged-in user
    Object userObj = session.getAttribute("user");
    if (userObj == null) {
        response.sendRedirect("login.jsp?error=notloggedin");
        return;
    }
    
    // 2. Cast the session object to a String array (String[])
    String[] userArray = (String[]) userObj; 
    
    // 3. Extract the details
    String name = userArray[0]; 
    String email = userArray[1]; 
%>
<html>
<head>
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            width: 450px;
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.5);
            background-color: white;
            text-align: center;
            animation: fadeIn 0.8s ease-out;
        }
        h2 {
            font-weight: 700;
            color: #1e3c72;
            margin-bottom: 30px;
        }
        .detail-row {
            padding: 15px 0;
            border-bottom: 1px solid #eee;
            text-align: left;
            font-size: 1.1em;
        }
        .detail-row strong {
            display: inline-block;
            width: 120px;
            color: #555;
            font-weight: 600;
        }
        .btn-danger {
            border-radius: 50px;
            font-weight: 600;
            padding: 10px 40px;
            transition: transform 0.2s, box-shadow 0.2s;
            box-shadow: 0 4px 6px rgba(220, 53, 69, 0.3);
        }
        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 10px rgba(220, 53, 69, 0.5);
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: scale(0.9); }
            to { opacity: 1; transform: scale(1); }
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
        <h2>Welcome, <%= name %>!</h2>
        
        <div class="detail-row">
            <strong>Name:</strong> <%= name %>
        </div>
        <div class="detail-row">
            <strong>Email:</strong> <%= email %>
        </div>
        
        <hr class="mt-4 mb-4">
        
        <a href="logout" class="btn btn-danger w-75">Logout</a>
        
        <a href="index.jsp" class="text-decoration-none text-muted mt-3 d-block">← Back to Main Menu</a>
    </div>

   <div style="position: fixed; bottom: 10px; right: 20px; background: #f0f0f0; color: #333; padding: 5px 14px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.07); font-size: 13px; z-index: 9999;">
    <b>Pod/Con: <b>${podName}</b>
   </div>    
    <footer class="version-footer">
        Application Version: <%= application.getInitParameter("app.version") %>
    </footer>
</body>
</html>
