package src;

import java.sql.*;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
import java.time.*;
import java.time.format.DateTimeFormatter;

public class Session {

    @Test
    public void TestCredentials() {
        /* VARIABLES TO CHANGE: PLEASE CHANGE THE URL AS REQUIRED*/
        String url = "jdbc:mysql://localhost/iClicker";
        String uid = "root";
        String pw = "304rootpw";

        try (Connection con = DriverManager.getConnection(url, uid, pw)) {
            // Test if the system identifies incorrect password
            String instructorID = "3";
            String CourseCode = "COSC 310";
            
            // Finding CourseId for the particular course code and instructor ID
            String SQL = "SELECT CourseId FROM Course WHERE InstructorId=? AND CourseCode=?";
            PreparedStatement pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, instructorID);
            pstmt.setString(2, CourseCode);
            ResultSet rslt = pstmt.executeQuery();
            String CourseId = "";
            while (rslt.next()) {
                CourseId = rslt.getString(1);
            }
            assertEquals(false, CourseId.equals(""));

            // Now create a session with the particular Course Id
            SQL = "INSERT INTO Sess (CourseId, StartDate, SessStatus) VALUES(?, ?, ?)";
            pstmt = con.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, CourseId);
            // Get Date and Time
            LocalDateTime myDateObj = LocalDateTime.now(ZoneId.of("America/Vancouver"));
            DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            pstmt.setString(2, myDateObj.format(myFormatObj));
            pstmt.setString(3, "ACTIVE");
            pstmt.executeUpdate();
            ResultSet generatedKeys = pstmt.getGeneratedKeys();
            String SessionId = "";
            if (generatedKeys.next()) {
                SessionId = generatedKeys.getString(1);
            } else {
                assertEquals(true, false);
            }

            // Check if the session has started
            SQL = "SELECT SessStatus FROM Sess INNER JOIN Course ON Sess.CourseId = Course.CourseId WHERE Sess.CourseId=? AND SessId=?";
            pstmt = con.prepareStatement(SQL);
            pstmt.setString(1, CourseId);
            pstmt.setString(2, SessionId);
            rslt = pstmt.executeQuery();
            int rows = 0;
            while (rslt.next()) {
                assertEquals(rslt.getString(1), "ACTIVE");
                rows++;
            }
            assertEquals(1, rows);

        } catch (Exception e) {
            System.out.println(e);
        }
}
}
