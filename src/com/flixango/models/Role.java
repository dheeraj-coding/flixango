package com.flixango.models;

import oracle.jdbc.proxy.annotation.Pre;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Role {
    public int ID;
    public String Name;

    Connection con;

    public Role() {

    }

    public Role(Connection con, int ID, String Name) {
        this.ID = ID;
        this.Name = Name;
        this.con = con;
    }

    public String toString() {
        String str = String.format("Role Name: %s", this.Name);
        return str;
    }

    public static Role findOneByID(Connection con, int ID) {
        Role r = null;
        try {
            String query = "SELECT ID, name FROM Roles WHERE ID = ?";
            PreparedStatement stmnt = con.prepareStatement(query);
            stmnt.setInt(1, ID);
            ResultSet rs = stmnt.executeQuery();
            rs.next();
            r = new Role(con, rs.getInt(1), rs.getString(2));
        } catch (Exception e) {
            System.out.println("Exception finding role by ID:" + e);
        }
        return r;
    }

    public static Role create(Connection con, String Name) {
        Role r = null;
        try {
            String query = "INSERT INTO Roles (Name) VALUES (?)";
            String[] keys = {"ID"};
            PreparedStatement stmnt = con.prepareStatement(query, keys);
            stmnt.setString(1, Name);
            int num = stmnt.executeUpdate();
            if (num > 0) {
                ResultSet rs = stmnt.getGeneratedKeys();
                rs.next();
                r = Role.findOneByID(con, rs.getInt(1));
            }
        } catch (Exception e) {
            System.out.println("Exception creating Role:" + e);
        }
        return r;
    }

}
