<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Course</title>
  <link rel="stylesheet" href="styles.css">
  <style>

    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      background-color: #f0f0f0;
  }

  header {
      background-color: #1f1f1f;
      color: white;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
  }
    form {
        background-color: #fff;
        padding: 20px;
        margin: 20px;
        border-radius: 5px;
    }
    
    label {
        display: block;
        margin-bottom: 10px;
    }
    
    input[type="text"] {
        padding: 5px;
        border-radius: 5px;
        border: 1px solid #ccc;
        width: 100%;
        box-sizing: border-box;
        margin-bottom: 20px;
    }
    
    input[type="submit"] {
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    .back-button {
      background-color: #4CAF50;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      margin-left: 5px;
      padding: 5px 10px;
    }
   
</style>
</head>
<body>
  <% String CourseCode = request.getParameter("CourseCode");%>
  <% String CourseName = request.getParameter("CourseName");%>
  <%String UserId = (String) session.getAttribute("UserId");%>
  <% if (UserId == null) {
    response.sendRedirect("loginPage.jsp");
  }
    else if (CourseCode == null) {%>
  <header>
    <p><button class="back-button" onclick="location.href='InstructorDashboardUI.jsp'">Back</button></p>

  </header>
  <main>
    <form id="addCourse-form" method="post" action="AddCourse.jsp" class="login-form">
         
        <label for="course-code">Course Code:</label>
        <input type="text" id="course-code" name="CourseCode" required>
        <label for="course-name">Course Name:</label>
        <input type="text" id="course-name" name="CourseName" required>
        <button type="submit">Add course</button>
    </form>
  </main>
  <% } else {
    String url = "jdbc:sqlserver://cosc304_sqlserver:1433;TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";

    try {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    }
  catch (java.lang.ClassNotFoundException e) {
      throw new SQLException("ClassNotFoundException: " +e);
    }
    try(Connection con = DriverManager.getConnection(url, uid, pw);){
      con.createStatement().execute("use iClicker;");
      String sql="Insert into Course (CourseCode, CourseName, InstructorId) values (?,?,?)";
      PreparedStatement pstmt=con.prepareStatement(sql);
      pstmt.setString(1,CourseCode);
      pstmt.setString(2,CourseName);
      pstmt.setString(3,UserId);
      pstmt.executeUpdate();
      response.sendRedirect("InstructorDashboardUI.jsp");
    }
    catch (Exception e){
      out.print(e);
  }
  }%>
</body>
</html>



