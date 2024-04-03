<%@ page import="java.sql.*" %>
<%@ page import="java.util.Scanner" %>
<%@ page import="java.io.File" %>

<html>
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
        <div id="container">
            <img id="iclicker-logo" src="Assets/white-iclicker-student-logo.png" alt="iclicker-logo">
            <%
                out.println("<h1 class=\"heading\">Connecting to database.</h1><br><br><div style=\"width:60%; margin-left:20%\">");

            	// User id, password, and server information
	            String url = "jdbc:sqlserver://cosc304_sqlserver:1433;TrustServerCertificate=True";
	            String uid = "sa";
	            String pw = "304#sa#pw";
                
                try {
                    Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                } catch (java.lang.ClassNotFoundException e) {
                    throw new SQLException("ClassNotFoundException: " +e);
                }
                Connection con = DriverManager.getConnection(url, uid, pw);
                String fileName = "/usr/local/tomcat/webapps/shop/ddl/Setup_SQLServer.ddl";
                
            try
            {  
                // Create statement
                Statement stmt = con.createStatement();
                
                Scanner scanner = new Scanner(new File(fileName));
                // Read commands separated by ;
                scanner.useDelimiter(";");
                while (scanner.hasNext())
                {
                    String command = scanner.next();
                    if (command.trim().equals("") || command.trim().equals("go"))
                        continue;
                    // out.print(command+"<br>");        // Uncomment if want to see commands executed
                    try
                    {
                        stmt.execute(command);
                    }
                    catch (Exception e)
                    {	// Keep running on exception.  This is mostly for DROP TABLE if table does not exist.
                        out.println("<h4 style=\"color:white; text-align:left;\">"+e+"</h4>");
                    }
                }	 
                scanner.close();
                
                out.print("</div><div class=\"heading\"><br><br><h1>Database loaded.</h1>");
            }
            catch (Exception e)
            {
                out.print(e);
            }  
            %>
        </div>
    </body>
</html> 