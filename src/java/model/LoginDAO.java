package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.KoneksiDB;

public class LoginDAO {

    // ================= CEK LOGIN =================
    public boolean checkLogin(String username, String password) {
        boolean valid = false;

        String sql = "SELECT * FROM user WHERE username=? AND password=?";

        try {
            Connection conn = KoneksiDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                valid = true;
            }

        } catch (SQLException e) {
            System.out.println("Error checkLogin: " + e.getMessage());
        }

        return valid;
    }

    // ================= AMBIL NAMA USER =================
    public String getNameByUsername(String username) {
        String name = null;

        String sql = "SELECT name FROM user WHERE username=?";

        try {
            Connection conn = KoneksiDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("name");
            }

        } catch (SQLException e) {
            System.out.println("Error getNameByUsername: " + e.getMessage());
        }

        return name;
    }
    public int getUserIDByUsername(String username) {
        int userID = 0;
        String sql = "SELECT userid FROM user WHERE username=?";
        try {
            Connection conn = KoneksiDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                userID = rs.getInt("userid");
            }
        } catch (SQLException e) {
            System.out.println("Error getUserIDByUsername: " + e.getMessage());
        }
        return userID;
    }

}