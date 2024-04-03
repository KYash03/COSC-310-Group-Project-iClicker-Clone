<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="studentSignUpPage.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>

<body>
    <% String Registered = request.getParameter("UserId");%>
    <% if (Registered == null) { %>
    <div id="container">
        <img id="iclicker-logo" src="Assets/white-iclicker-student-logo.png" alt="iclicker-logo">
        <p id="page-title">Student Sign-Up Page</p>
        <div id="container-2">
            <form id="user-form" method="post" action="studentSignUpPage.jsp" class="login-form">
                <label for="user-id"></label>
                <input type="text" id="user-id" name="UserId" placeholder="User ID" required/>

                <label for="user-name"></label>
                <input type="text" id="user-name" name="Name" placeholder="Full Name" required/>

                <label for="student-university"></label>
                <input type="text" id="student-university" name="University" placeholder="University Name" required/>

                <label for="student-major"></label>
                <input type="text" id="student-major" name="Major" placeholder="Major" required/>

                <label for="password"></label>
                <input type="password" id="user-password" name="Pass" placeholder="Password" required/>

                <button id="sign-up-button">Sign Up</button>
            </form>
        </div>
        <% } else {
            String Name = request.getParameter("Name");
            String University = request.getParameter("University");
            String Major = request.getParameter("Major");
            String UserId = request.getParameter("UserId");
            String Pass = request.getParameter("Pass");

        String url = "jdbc:sqlserver://cosc304_sqlserver:1433;TrustServerCertificate=True";
        String uid = "sa";
        String pw = "304#sa#pw";

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (java.lang.ClassNotFoundException e) {
            throw new SQLException("ClassNotFoundException: " +e);
        }
        try(Connection con = DriverManager.getConnection(url, uid, pw);){
        
            con.createStatement().execute("use iClicker;");
            String sql="insert into EndUser(UserId,Username,University) values (?,?,?)";
            PreparedStatement pstmt=con.prepareStatement(sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,Name);
            pstmt.setString(3,University);
            pstmt.executeUpdate();

            sql="insert into UserCredential (UserId,Pass) values (?,?)";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,Pass);
            pstmt.executeUpdate();

            sql="insert into Student (StudentId,Major) values (?,?)";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,UserId);
            pstmt.setString(2,Major);
            pstmt.executeUpdate();

            response.sendRedirect("loginPage.jsp");
        }
        catch (Exception e){
            out.print(e);
        } 
        }%>
        
        <a id="sign-in-button" href="loginPage.jsp">Have an account? Sign In!</a>
    </div>
</body>

</html>