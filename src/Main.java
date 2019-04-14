import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;
import javax.swing.*;

import com.flixango.models.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Hello World!");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "root");

            Movie m = Movie.findOneByID(con, 6);
            System.out.println(m);
            HashMap<String, Member> roles = m.getCast();
            System.out.println(roles);
            con.close();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
    }
}
