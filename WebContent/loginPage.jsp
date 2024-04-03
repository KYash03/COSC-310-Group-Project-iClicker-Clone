<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="loginPage.css" rel="stylesheet">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto&display=swap" rel="stylesheet">
</head>

<body>
    <% String UserId = request.getParameter("UserId");%>
    
    <% if (UserId == null) { %>
        <div id="container">
            <img id="iclicker-logo" src="Assets/white-iclicker-student-logo.png" alt="iclicker-logo">
            <div id="container-2">
                <form method="post" id="user-form" action="loginPage.jsp">
                    <label for="user-id"></label>
                    <input type="text" id="user-id" name="UserId" placeholder="User ID">
                    <label for="password"></label>
                    <input type="password" id="password" name="Pass" placeholder="Password">
                    <button typw="submit" id="sign-in-button">Log In</button>
                </form>
            </div>
            <a id="sign-up-button" href="signUpPage.jsp">Don't have an account? Sign Up!</a>
        </div>
        <!-- response.sendRedirect("account.jsp?redirect=admin.jsp"); -->
    <% } else {
        // check if the userID and password is correct
        String Pass = request.getParameter("Pass");
        
        // User id, password, and server information
        String url = "jdbc:sqlserver://cosc304_sqlserver:1433;TrustServerCertificate=True";
        String uid = "sa";
        String pw = "304#sa#pw";
        
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        } catch (java.lang.ClassNotFoundException e) {
            throw new SQLException("ClassNotFoundException: " +e);
        }
        try {
            Connection con = DriverManager.getConnection(url, uid, pw);
            con.createStatement().execute("USE iClicker;");
            String SQL = "SELECT Pass FROM UserCredential WHERE UserId = ?";
            PreparedStatement pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, UserId);
            ResultSet rslt = pstmt.executeQuery();
            String correctPass = null;

            while (rslt.next()) {
                correctPass = rslt.getString(1);
            }
            if (correctPass == null || !correctPass.equals(Pass)) {
                response.sendRedirect("loginPage.jsp?message=" + java.net.URLEncoder.encode("Invalid user id or password. Please try again", "UTF-8"));
            } else {
                request.getSession().setAttribute("UserId", UserId);
                // Check if the user is student or instructor
                SQL = "SELECT * FROM Student WHERE StudentId = ?";
                pstmt = con.prepareStatement(SQL);
                pstmt.setString(1, UserId);
                rslt = pstmt.executeQuery();
                if (rslt.next()) {
                    response.sendRedirect("studentDashboard.jsp");
                } else {
                    response.sendRedirect("instructorDashboardUI.jsp");
                }
            }
            } catch (Exception e) {
                out.println("<h1>" + e + "</h1>");
            }
        } %>
</body>

</html>