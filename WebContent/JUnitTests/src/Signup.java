package src;

import java.sql.*;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class Signup {
    String url = "jdbc:mysql://localhost/iClicker";
    String uid = "root";
    String pw = "304rootpw";
    @Test
    public void TestSignupInstructor(){
        try (Connection con = DriverManager.getConnection(url, uid, pw)){
            // Insert a user
            String sql = "Insert into User (UserId,UserName, University) values (?,?,?)";
            boolean hasRows = false; 
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"4");
            pstmt.setString(2,"zack");
            pstmt.setString(3,"UBCO");
            pstmt.executeUpdate();

            // Insert user password
            sql = "Insert into UserCredential(UserId, Pass) values (?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"4");
            pstmt.setString(2,"zack123");
            pstmt.executeUpdate();

            // Insert instructor identity
            sql = "Insert into Instructor (InstructorId,Department) values (?,?)";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"4");
            pstmt.setString(2,"Computer Science");
            pstmt.executeUpdate();

            // Check if record exists
            sql = "Select * from Instructor where InstructorId=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1,"4");
            ResultSet rslt = pstmt.executeQuery();
            while(rslt.next()){
                  hasRows = true;
            }
            assertEquals(true, hasRows);

 }
        catch (Exception e) {
            System.out.println(e);
        }
    }

    @Test
    public void TestSignupStudent() {
         try (Connection con = DriverManager.getConnection(url, uid, pw)){
                boolean hasRows = false;

                // Inserting a user
                String sql = "Insert into EndUser (UserId, UserName, University) values (?,?,?)";
                PreparedStatement pstmt = con.prepareStatement(sql);
                pstmt.setString(1,"30");
                pstmt.setString(2,"joy");
                pstmt.setString(3,"UBCO");
                pstmt.executeUpdate();

                // Inserting password
                sql = "Insert into UserCredential(UserId, Pass) values (?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,"30");
                pstmt.setString(2,"Joy123");
                pstmt.executeUpdate();

                // Iserting student identity
                sql = "Insert into Student (StudentId, Major) values (?,?)";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1,"30");
                pstmt.setString(2,"Computer Science");
                pstmt.executeUpdate();

                // Retriving student record
                sql = "Select * from Student where StudentId=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, "30");
                ResultSet rslt = pstmt.executeQuery();
                while(rslt.next()){
                    hasRows = true;
                }
                assertEquals(true, hasRows);
            }
          catch (Exception e) {
            assertEquals("", e);
        }
    }
    
}