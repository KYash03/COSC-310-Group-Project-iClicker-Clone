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
  <title>Poll Stats</title>
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
      
      .form-container {
        margin: 20px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
      }
      
      .form-container label {
        display: block;
        margin-bottom: 10px;
      }
      
      .form-container input[type="text"], 
      .form-container input[type="radio"] {
        margin-left: 10px;
        margin-right: 5px;
      }
      
      .form-container input[type="submit"] {
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      
      .form-container .answer-options {
        display: flex;
        flex-direction: row;
        align-items: center;
      }
      
      .form-container .answer-options label {
        margin-left: 10px;
      }
      .button {
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 5px;
        padding: 5px 10px;
      }
      .blue-button {
        background-color:#2196F3;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-left: 5px;
        padding: 5px 10px;
      }
      table {
        margin: 20px;
        padding: 20px;
        background-color: #fff;
        border-radius: 5px;
        box-shadow: 0px 2px 5px rgba(0,0,0,0.3);
        border-collapse: collapse;
        width: 60%;
      }
      
      th, td {
        text-align: center;
        padding: 8px;
        border-bottom: 1px solid #ddd;
      }
      
      th {
        background-color: #1f1f1f;
        color: white;
      }
    </style>
    <meta http-equiv="refresh" content="3">
</head>
<body>
  
  <header><button class="button">Profile</button>
    <p><button class="button">Logout</button>
    <h1>Poll stats</h1></p>
    </header>
  
  
    <br>
    <br>
<%
    String url = "jdbc:sqlserver://cosc304_sqlserver:1433; TrustServerCertificate=True";
    String uid = "sa";
    String pw = "304#sa#pw";
  

    try {
      Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
    } catch (java.lang.ClassNotFoundException e) {
      throw new SQLException("ClassNotFoundException: " + e);
    }
  
    int optionAcount=0;
    int optionBcount=0;
    int optionCcount=0;
    int optionDcount=0;
  
     Connection con = DriverManager.getConnection(url, uid, pw);
      con.createStatement().execute("USE iClicker");
      String PollId = request.getParameter("PollId");
      String optionA="";
      String optionB="";
      String optionC="";
      String optionD="";
      String sql="Select * from Poll where PollId=?";
      PreparedStatement pstmt = con.prepareStatement(sql);
      pstmt.setString(1,PollId);
      ResultSet rs = pstmt.executeQuery();
      while (rs.next()){
        optionA=rs.getString(4);
        optionB=rs.getString(5);
        optionC=rs.getString(6);
        optionD=rs.getString(7);
      }

      sql="Select count(*) from Respond where PollId=? And Respond=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,PollId);
      pstmt.setString(2,optionA);
      rs = pstmt.executeQuery();
      while(rs.next()){
        optionAcount=rs.getInt(1);
      }

      sql="Select count(*) from Respond where PollId=? And Respond=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,PollId);
      pstmt.setString(2,optionB);
      rs = pstmt.executeQuery();
    
      while(rs.next()){
        optionBcount=rs.getInt(1);
      }

      sql="Select count(*) from Respond where PollId=? And Respond=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,PollId);
      pstmt.setString(2,optionC);
      rs = pstmt.executeQuery();
 
      while(rs.next()){
        optionCcount=rs.getInt(1);
      }

      sql="Select count(*) from Respond where PollId=? And Respond=?";
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1,PollId);
      pstmt.setString(2,optionD);
      rs = pstmt.executeQuery();
 
      while(rs.next()){
        optionDcount=rs.getInt(1);
      }
  
    
    %>



   <div class="form-container">
      <table>
        <thead>
          <tr>
            <th>Option</th>
            <th>Responses</th>
          </tr>
        </thead>
        <tbody>
         
          <tr>
        <form id="pollStats-form" method="post" action="PollStats.jsp" class="PollStats-form">
            <td>A</td>
            <td><input type="text" value="<%=optionAcount %>" name="optionACount" readonly="true"></td>
          </tr>
          <tr>
            <td>B</td>
            <td><input type="text" value="<%=optionBcount %>" name="optionBCount" readonly="true"></td>
          </tr>
          <tr>
            <td>C</td>
            <td><input type="text" value="<%=optionCcount %>" name="optionCCount" readonly="true"></td>
          </tr>
          <tr>
            <td>D</td>
            <td><input type="text" value="<%=optionDcount %>" name="optionDCount" readonly="true"></td>
          </tr> 
          <button id="end-poll-button" type="submit">End Poll</button>
         
          
      </form>

    


    

          
  
        
        </tbody>
      </table>
 </div>
</body>

</html>



    