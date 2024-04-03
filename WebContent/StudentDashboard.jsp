<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Student's Dashboard</title>
  <link rel="stylesheet" href="studentDashboard.css">
</head>
<body>
  <header>
    <button class="profile-button">Profile</button>
    <button class="logout-button">Logout</button>
    <h1>Student's Dashboard</h1>
    <button class="join-course-button" onclick="location.href='JoinCourse.jsp'">Join Course</button>
  </header>
  <div class="sidebar">
  <main>
    <h2>Welcome to My Courses</h2>
    <p>You are currently enrolled in the following courses:</p>
    <div class="course-row">
      <%
      String sql = "SELECT Student.StudentId, Course.CourseCode, Course.CourseName FROM Enroll INNER JOIN Student ON Enroll.StudentId = Student.StudentId INNER JOIN Course ON Enroll.CourseId = Course.CourseId WHERE Student.StudentId=?";
      String url = "jdbc:sqlserver://cosc304_sqlserver:1433; TrustServerCertificate=True";
      String uid = "sa";
      String pw = "304#sa#pw";
      Connection con = null; 
      try {
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection(url, uid, pw);
        con.createStatement().execute("USE iClicker");
        PreparedStatement pstmt = con.prepareStatement(sql); 
        pstmt.setString(1, (String) session.getAttribute("UserId"));
        ResultSet rst = pstmt.executeQuery(); 
        out.println("<table><tr><th>Course Code</th><th>Course Name</th></tr>");
        while(rst.next()){
          out.println("<tr><td>"+rst.getString(2)+"</td>");
          out.println("<td>"+rst.getString(3)+"</td>");
          PreparedStatement pstmt2 = con.prepareStatement("SELECT SessId FROM Sess WHERE CourseId=? AND SessStatus=?");
          pstmt2.setString(1, rst.getString(1));
          pstmt2.setString(2, "ACTIVE");
          ResultSet rslt2 = pstmt2.executeQuery();
          String SessId = "";
          while (rslt2.next()) {
            SessId = rslt2.getString(1);
          }
          if (SessId.equals("")) {
            out.println("<td><input type=\"button\" onclick=\"location.href='JoinSession.jsp?CourseId=" + rst.getString(1) + "'\" class=\"join-course-button\" value=\"Join Session\"></td>");
          } else {
            out.println("<td><input type=\"button\" onclick=\"location.href='startPoll.jsp?PollId=" + SessId + "'\" class=\"start-session-button\" value=\"Start Poll\"></td></tr>");
          }
      }
      out.print("</table>");
    }
    catch(SQLException e){
      out.println(e);
    }
    finally {
      if(con != null) {
        con.close();
      }
    }
    %>
  </div>
</main>  
</body>
</html>
      
      