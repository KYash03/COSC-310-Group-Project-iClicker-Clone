package src;
import java.sql.*;
import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class DeleteCourse {
    @Test
public void testDeleteCourse(){
  String URL = "jdbc:mysql://localhost/iClicker";
  String UID = "root";
  String PWD = "304rootpw";
  boolean hasRow =false; 
  try (Connection con = DriverManager.getConnection(URL, UID, PWD)) {
    String sql= "Select CourseId from Course where CourseCode=? AND InstructorId=?";
    PreparedStatement pstmt = con.prepareStatement(sql);
    pstmt.setString(1,"COSC 310");
    pstmt.setString(2,"3");
    ResultSet rs=pstmt.executeQuery();
    String CourseId="";
    while(rs.next()){
        CourseId=rs.getString(1);
    }

    sql="delete from Course where CourseId=?";
    pstmt=con.prepareStatement(sql);
    pstmt.setString(1, CourseId);
    pstmt.executeUpdate();

    sql="Select * from Course where CourseId=? ";
    pstmt=con.prepareStatement(sql);
    pstmt.setString(1, CourseId);
    rs=pstmt.executeQuery();
    while(rs.next()){
        hasRow=true;
    }
    assertEquals(false, hasRow);

   }
  catch (Exception e) {
    assertEquals("", e);
}


}
}