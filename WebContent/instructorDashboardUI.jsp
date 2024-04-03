<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Instructor's Dashboard</title>
  <link href="instructorDashboardUI.css" rel="stylesheet">
</head>
<body>
  <header>
    <button class="profile-button" onclick="location.href='profile.jsp'">Profile</button>
    <button class="logout-button" onclick="location.href='logout.jsp'">Logout</button>
    <h1>Instructor's Dashboard</h1>
    <button class="add-course-button" onclick="location.href='addCourse.jsp'">Add Course</button>
  </header>
  <main>
    <h2>Welcome to My Courses</h2>
    <p>You are currently instructing the following courses:</p>
    <div class="course-row">
      <%
      String sql = "SELECT CourseId, CourseCode, CourseName FROM Course;";
      String url = "jdbc:sqlserver://cosc304_sqlserver:1433; TrustServerCertificate=True";
      String uid = "sa";
      String pw = "304#sa#pw";
      try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
      } catch (java.lang.ClassNotFoundException e) {
        throw new SQLException("ClassNotFoundException: " + e);
      }
      try{
        Connection con = DriverManager.getConnection(url, uid, pw);
        con.createStatement().execute("USE iClicker");
        Statement stmt = con.createStatement();
        ResultSet rst = stmt.executeQuery(sql);
        PreparedStatement pstmt = con.prepareStatement(sql);
        out.println("<table><tr><th>Course Code</th><th>Course Name</th></tr>");
        while(rst.next()){
          out.println("<tr><td>"+rst.getString(2)+"</td>");
          out.println("<td>"+rst.getString(3)+"</td>");
          // Get course session status
          PreparedStatement pstmt2 = con.prepareStatement("SELECT SessId FROM Sess WHERE CourseId=? AND SessStatus=?");
          pstmt2.setString(1, rst.getString(1));
          pstmt2.setString(2, "ACTIVE");
          ResultSet rslt2 = pstmt2.executeQuery();
          String SessId = "";
          while (rslt2.next()) {
            SessId = rslt2.getString(1);
          }
          if (SessId.equals("")) {
            out.println("<td><input type=\"button\" onclick=\"location.href='startSession.jsp?CourseId=" + rst.getString(1) + "'\" class=\"start-Session-button\" value=\"Start Session\"></td>");
          } else {
            out.println(SessId);
            out.println("<td><input type=\"button\" onclick=\"location.href='startPoll.jsp?SessId=" + SessId + "'\" class=\"start-Session-button\" value=\"Start Poll\"></td>");
          }
          out.println("<td><input type=\"button\" onclick=\"location.href='deleteCourse.jsp?CourseId=" + rst.getString(1) + "'\" class=\"delete-button\" value=\"Delete\"></td>");
        }
        out.print("</table>");
      }
       
      catch(SQLException e){
        out.println(e);
      }
      %>
    </main>
</body>
</html>