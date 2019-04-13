import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import javax.swing.*;

import com.flixango.models.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

            Genre g = Genre.findOneByID(con, 1);
            Movie m = Movie.findOneByID(con, 6);
            m.addGenre(g);
            System.out.println(m.getGenres());
            System.out.println(m.getReviews());
            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
