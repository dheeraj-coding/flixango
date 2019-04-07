import java.sql.*;
import java.util.ArrayList;

import com.flixango.models.Movie;

import com.flixango.models.User;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
