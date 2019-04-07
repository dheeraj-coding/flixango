import java.sql.*;

import com.flixango.models.Movie;

import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");
            Movie.create(con, "Fight Club", "English", "2hrs", 1.45, 1);
            Movie.create(con, "7even Club", "English", "2hrs", 4.5, 2);
            ArrayList<Movie> m = Movie.findByName(con, "Clu");
            for (Movie each : m) {
                System.out.println(each);
            }

            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
