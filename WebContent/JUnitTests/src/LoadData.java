package src;

import java.sql.*;
import java.util.Scanner;
import java.io.File;

public class LoadData {
    public static void main(String[] args) {
        // User id, password, and server information
        /* VARIABLES TO CHANGE: PLEASE CHANGE THE URL AS REQUIRED */
        String url = "jdbc:mysql://localhost/";
        String uid = "root";
        String pw = "304rootpw";

        String fileName = "..//ddl//Setup_MySQL.ddl";

        try {
            // Create statement
            Connection con = DriverManager.getConnection(url, uid, pw);
            Statement stmt = con.createStatement();

            Scanner scanner = new Scanner(new File(fileName));
            // Read commands separated by ;
            scanner.useDelimiter(";");
            while (scanner.hasNext()) {
                String command = scanner.next();
                if (command.trim().equals(""))
                    continue;
                try {
                    System.out.println(command);
                    stmt.execute(command);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
            scanner.close();
            System.out.println("Database is successfully in MySQL");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}