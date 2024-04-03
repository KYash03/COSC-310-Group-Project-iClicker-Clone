package src;

import java.sql.*;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class Login {
    @Test
    public void TestCredentials() {
                /* VARIABLES TO CHANGE: PLEASE CHANGE THE URL AS REQUIRED*/
                String url = "jdbc:mysql://localhost/iClicker";
                String uid = "root";
                String pw = "304rootpw";
        
                try (Connection con = DriverManager.getConnection(url, uid, pw)) {
                    // Test if the system identifies incorrect password
                    String incorrectPass = "123"; // This is the incorrect password for UserId 1.
                    String SQL = "SELECT Pass FROM UserCredential WHERE UserId = ?";
                    PreparedStatement pstmt = con.prepareStatement(SQL);
                    pstmt.setString(1, "1");
                    ResultSet rslt = pstmt.executeQuery();
                    while (rslt.next()) {
                        assertEquals(false, incorrectPass.equals(rslt.getString(1)));
                    }

                    // Test if system identifies correct password
                    String correctPass = "abc"; // This is the correct password for UserId 1.
                    SQL = "SELECT Pass FROM UserCredential WHERE UserId = ?";
                    pstmt = con.prepareStatement(SQL);
                    pstmt.setString(1, "1");
                    rslt = pstmt.executeQuery();
                    while (rslt.next()) {
                        assertEquals(true, correctPass.equals(rslt.getString(1)));
                    }

                    // Test if system identifies incorrect user name
                    int UserId = 0; // This username does not exist
                    SQL = "SELECT Pass FROM UserCredential WHERE UserId = ?";
                    pstmt = con.prepareStatement(SQL);
                    pstmt.setInt(1, UserId);
                    rslt = pstmt.executeQuery();
                    boolean hasRows = false;
                    while (rslt.next()) {
                        hasRows = true;
                    }
                    assertEquals(false, hasRows);
                } catch (Exception e) {
                    System.out.println(e);
                }
    }
}