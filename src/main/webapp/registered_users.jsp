<%@ page import="java.util.List" %>
<%@ page import="com.example.web.UserStore" %>
<%@ page import="com.example.web.UserModel" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <title>Registered Users</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background:#f7f7f7; font-family:sans-serif;">
  <div class="container mt-5">
    <h2 class="mb-4">Registered Users</h2>
    <a href="index.jsp" class="btn btn-secondary mb-3">&larr; Back</a>
    <%
      List<UserModel> users = UserStore.getAllUsers();
      if (users != null && !users.isEmpty()) {
    %>
    <table class="table table-bordered table-striped shadow">
      <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Email</th>
        </tr>
      </thead>
      <tbody>
        <% int i = 1;
        for (UserModel u : users) { %>
          <tr>
            <td><%= i++ %></td>
            <td><%= u.getName() %></td>
            <td><%= u.getEmail() %></td>
          </tr>
        <% } %>
      </tbody>
    </table>
    <%
      } else {
    %>
      <p>No users found.</p>
    <%
      }
    %>
  </div>
</body>
</html>
