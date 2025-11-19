<%@ page contentType="text/html;charset=UTF-8" %>
<%
    // Ensure the session is invalidated immediately, if it hasn't been already by the servlet
    // Note: If your LogoutServlet already did this, this line is redundant but safe.
    if (session.getAttribute("user") != null) {
        session.invalidate();
    }
    
    // Auto-redirect to the main page after 3 seconds
    response.setHeader("Refresh", "3; url=index.jsp");
%>
<html>
<head>
    <title>Goodbye!</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            /* Match the main page background for consistency */
            background: linear-gradient(135deg, #6dd5fa 0%, #2980b9 100%);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            padding: 50px;
            border-radius: 20px;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.4);
            text-align: center;
            background-color: white;
            animation: fadeIn 1s ease-out;
            max-width: 400px;
        }
        h2 {
            font-weight: 700;
            color: #dc3545; /* Red for goodbye */
        }
        .spinner-border {
            width: 3rem;
            height: 3rem;
            color: #2980b9;
        }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
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
        <div class="spinner-border mb-4" role="status">
            <span class="visually-hidden">Loading...</span>
        </div>
        <h2 class="mb-3">Goodbye!</h2>
        <p class="lead text-muted">You have been securely logged out.</p>
        <p class="mt-4">Redirecting to the main page in a moment...</p>
        <a href="index.jsp" class="btn btn-secondary mt-3">Click here if you are not redirected</a>
    </div>
    <div style="position: fixed; bottom: 10px; right: 20px; background: #f0f0f0; color: #333; padding: 5px 14px; border-radius: 6px; box-shadow: 0 2px 8px rgba(0,0,0,0.07); font-size: 13px; z-index: 9999;">
    <b>Pod/Con: <b>${podName}</b>
    </div>
    <footer class="version-footer">
        Application Version: <%= application.getInitParameter("app.version") %>
    </footer>
</body>
</html>
