package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import util.KoneksiDB;

public class Register {
    private int userid;
    private String name;
    private String username;
    private String password;
    private String newUsername;

    public Register() {}

    public Register(int userid, String name, String username, String password) {
        this.userid = userid;
        this.name = name;
        this.username = username;
        this.password = password;
    }

    // Getter
    public int getUserid() {
        return userid;
    }

    // Setter
    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    public void setNewUsername(String newUsername) {
        this.newUsername = newUsername;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // ================= VALIDASI =================
    public boolean validateInput() {
        if (name == null || name.isEmpty()) return false;
        if (username == null || username.isEmpty()) return false;
        if (password == null || password.isEmpty()) return false;
        return true;
    }

    // ================= REGISTER =================
    public boolean register() {

        if (!validateInput()) {
            System.out.println("Input tidak valid!");
            return false;
        }

        String query = "INSERT INTO user (name, username, password) VALUES (?, ?, ?)";

        try {
            Connection conn = KoneksiDB.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, name);
            ps.setString(2, username);
            ps.setString(3, password);

            ps.executeUpdate();
            return true;

        } catch (SQLException e) {
            System.out.println("Error register: " + e.getMessage());
            return false;
        }
    }

    // ================= UPDATE PROFILE =================
    public boolean updateProfile() {

    String query;

    if (password != null && !password.isEmpty()) {
        query = "UPDATE user SET username=?, name=?, password=? WHERE username=?";
    } else {
        query = "UPDATE user SET username=?, name=? WHERE username=?";
    }

    try {
        Connection conn = KoneksiDB.getConnection();
        PreparedStatement ps = conn.prepareStatement(query);

        // SET data baru
        ps.setString(1, newUsername); // username BARU
        ps.setString(2, name);        // fullname BARU

        if (password != null && !password.isEmpty()) {
            ps.setString(3, password);
            ps.setString(4, username); // username LAMA (WHERE)
        } else {
            ps.setString(3, username); // username LAMA (WHERE)
        }

        return ps.executeUpdate() > 0;

    } catch (SQLException e) {
        System.out.println("Update profile error: " + e.getMessage());
        return false;
    }
}
    public boolean checkOldPassword(String oldPassword) {
    boolean valid = false;

    String sql = "SELECT * FROM user WHERE username=? AND password=?"; // sesuaikan tabel

    try (Connection conn = KoneksiDB.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        ps.setString(1, this.getUsername());
        ps.setString(2, oldPassword);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            valid = true; // password lama benar
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return valid;
}


    
}