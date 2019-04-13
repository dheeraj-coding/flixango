import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;

import com.flixango.models.Member;
import com.flixango.models.Movie;

import com.flixango.models.Review;
import com.flixango.models.User;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

            Movie m = Movie.findOneByID(con, 5);
            System.out.println(m.getGenres());
            System.out.println(m.getReviews());
            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
