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
<body>

<%
String SessId=request.getParameter("SessId");
String question=request.getParameter("question");
String optionA=request.getParameter("optionA");
String optionB=request.getParameter("optionB");
String optionC=request.getParameter("optionC");
String optionD=request.getParameter("optionD");
String correctOption= request.getParameter("answer");

String url = "jdbc:sqlserver://cosc304_sqlserver:1433; TrustServerCertificate=True";
String uid = "sa";
String pw = "304#sa#pw";
try {
  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
} catch (java.lang.ClassNotFoundException e) {
  throw new SQLException("ClassNotFoundException: " + e);
}
 try(Connection con = DriverManager.getConnection(url, uid, pw);){
  con.createStatement().execute("USE iClicker");

  String sql= "Insert into Poll (SessId , Prompt, OptionOne, OptionTwo ,OptionThree,OptionFour,CorrectOption) values(?,?,?,?,?,?,?)";
  PreparedStatement pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
  pstmt.setString(1,SessId);
  pstmt.setString(2,question);
  pstmt.setString(3,optionA);
  pstmt.setString(4,optionB);
  pstmt.setString(5,optionC);
  pstmt.setString(6,optionD);
  pstmt.setString(7,correctOption); 
  pstmt.executeUpdate();
  ResultSet generatedKeys = pstmt.getGeneratedKeys();
      String PollId="";
      if (generatedKeys.next()) {
            PollId = generatedKeys.getString(1);
      } else {
            PollId="";
       }



  response.sendRedirect("PollStats.jsp?PollId=" + PollId);



 }
 catch(Exception e){
  out.println(e);
}
%>
</body>
</html>
