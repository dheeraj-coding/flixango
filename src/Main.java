import java.sql.*;
import java.util.ArrayList;

import com.flixango.models.Movie;

import com.flixango.models.Review;
import com.flixango.models.User;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

            User u = User.findByEMail(con, "pranav.2@gmail.com");
            System.out.println(u);
            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
