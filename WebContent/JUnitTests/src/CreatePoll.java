package src;
import java.sql.*;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;

import org.junit.Test;
import static org.junit.Assert.assertEquals;

public class CreatePoll {
    @Test
    public void CreatePoll(){
        String URL = "jdbc:mysql://localhost/iClicker";
        String UID = "root";
        String PWD = "304rootpw";

        boolean hasRow=false;
        try (Connection con = DriverManager.getConnection(URL, UID, PWD)) {
            String instructorID = "3";
            String CourseCode = "COSC 310";
            
            // Finding CourseId for the particular course code and instructor ID
            String sql = "SELECT CourseId FROM Course WHERE InstructorId=? AND CourseCode=?";
            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setString(1, instructorID);
            pstmt.setString(2, CourseCode);
            ResultSet rslt = pstmt.executeQuery();
            String CourseId = "";
            while (rslt.next()) {
                CourseId = rslt.getString(1);
            }
            assertEquals(false, CourseId.equals(""));


            sql="Insert into Sess(CourseId,StartDate,SessStatus) values(?,?,?)";
            pstmt=con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, CourseId);
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
         



            sql= "Insert into Poll (SessId , Prompt, OptionOne, OptionTwo ,OptionThree,OptionFour,CorrectOption) values(?,?,?,?,?,?,?)";
            pstmt = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1,SessionId);
            pstmt.setString(2,"what is the day today");
            pstmt.setString(3,"monday");
            pstmt.setString(4,"tuesday");
            pstmt.setString(5,"wednesday");
            pstmt.setString(6,"thursday");
            pstmt.setString(7,"monday"); 
            pstmt.executeUpdate();
             generatedKeys = pstmt.getGeneratedKeys();
            String PollId="";
            if (generatedKeys.next()) {
                  PollId = generatedKeys.getString(1);
            } else {
                assertEquals(true, false);

            }

            sql="Select * from Poll where PollId=?";
            pstmt=con.prepareStatement(sql);
            pstmt.setString(1,PollId);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                hasRow=true;
            }
            assertEquals(hasRow,true);




   


        }
        catch (Exception e) {
            assertEquals("", e);
        }


    }

    
}
