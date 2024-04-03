<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.time.*" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Instructor's Dashboard</title>
  <link href="instructorDashboardUI.css" rel="stylesheet">
</head>
<body>
  <main>
      <%
      String url = "jdbc:sqlserver://cosc304_sqlserver:1433; TrustServerCertificate=True";
      String uid = "sa";
      String pw = "304#sa#pw";
      try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      } catch (java.lang.ClassNotFoundException e) {
        throw new SQLException("ClassNotFoundException: " + e);
      }
      Connection con = DriverManager.getConnection(url, uid, pw);
      con.createStatement().execute("USE iClicker");
      String CourseId = request.getParameter("CourseId");
      String SQL = "INSERT INTO Sess(CourseId, StartDate, SessStatus) VALUES (?, ?, ?)";
      PreparedStatement pstmt = con.prepareStatement(SQL);
      pstmt.setString(1, CourseId);
      // Get Date and Time
      LocalDateTime myDateObj = LocalDateTime.now(ZoneId.of("America/Vancouver"));
      DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
      pstmt.setString(2, myDateObj.format(myFormatObj));
      pstmt.setString(3, "ACTIVE");
      pstmt.executeUpdate();
      response.sendRedirect("instructorDashboardUI.jsp");
      %>
    </main>
</body>
</html>