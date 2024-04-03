package src;

import java.sql.*;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class AddCourse{
    
@Test
public void testAddCourse(){
    
String URL = "jdbc:mysql://localhost/iClicker";
String UID = "root";
String PWD = "304rootpw";

try (Connection con = DriverManager.getConnection(URL, UID, PWD)) {
    // Stage 1 : Get all the valid userIDs
    /* Prepare statement to execute */
    String sql= "Insert into Course (courseCode,courseName, instructorId) values (?,?,?)";
    boolean valid =false; 

    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,"COSC 301");
    pstmt.setString(2,"data analytics");
    pstmt.setString(3,"3");

    pstmt.executeUpdate();


    // Case 1: Given correct userId, assert that password is correct
    sql="Select courseId from Course where courseCode=?  ANd instructorId=?";
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1,"COSC 301");
    pstmt.setString(2,"3");
    ResultSet rslt = pstmt.executeQuery();
    String courseId="";
    while(rslt.next()){
        courseId=rslt.getString(1);
    }

    sql="Select * from Course where courseId=?";
    pstmt=con.prepareStatement(sql);
    pstmt.setString(1, courseId);
    rslt=pstmt.executeQuery();
    while(rslt.next()){
       valid=true;
    }

    assertEquals(valid,true);
}
catch (Exception e) {
    assertEquals("", e);
}
}
}

