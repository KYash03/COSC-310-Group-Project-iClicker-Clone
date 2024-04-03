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
  <title>Instructor Poll</title>
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
  </style>
</head>
<body>
  <header><button class="button">Profile</button>
    <p><button class="button">Logout</button>
    <h1>Instructor Poll</h1></p>
  </header>
  
   <% String SessId = request.getParameter("SessId"); %>
    <div class="form-container">
      <form id="start-poll form " method="post" action="InsertPoll.jsp" class="startpoll-form">
        <label for="question">Question:</label>
        <textarea id="question" name="question" rows="2" cols="160" maxlength="10000" required/></textarea>
        <br>
        <br>
        <label for="optionA">Option A: </label>
          <input type="text" id="optionA" name="optionA" required/>
        <label for="optionB">Option B: </label>
          <input type="text" id="optionB" name="optionB" required/>
        <label for="optionC">Option C: </label>
          <input type="text" id="optionC" name="optionC" required/>
        <label for="optionD">Option D: </label>
           <input type="text" id="optionD" name="optionD" required/>
        
        <br>
        <label>Correct answer:</label>
        <div class="answer-options">
          <input type="radio" id="answerA" name="answer" value="A">
          <label for="answerA">A</label>
          <input type="radio" id="answerB" name="answer" value="B">
          <label for="answerB">B</label>
          <input type="radio" id="answerC" name="answer" value="C">
          <label for="answerC">C</label>
          <input type="radio" id="answerD" name="answer" value="D">
          <label for="answerD">D</label>
        </div>
        <input type="hidden" name="SessId" value=<%= SessId %> >

        
        <br>
        <br>
        <button id="sign-up-button">Create poll </button>
          <br>
          <br>
          <button class="button" onclick="location.href='InstructorDashboard.html'">Back</button>
        </form>
    </div>
        


  

  </body>
  </html>

  