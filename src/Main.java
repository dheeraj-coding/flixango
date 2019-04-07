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
            Movie m = Movie.create(con, "7even", "English", "2hrs", 4.5, 2);
            User u = User.create(con, "McDhee", "dheeraj.98@outlook.com", 9880488339L, "roast");
            Review r = Review.create(con, "Awesome movie", 2, u, m);
            r.Review = "Not so great movie";
            r.save();
            System.out.println(r);
            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
