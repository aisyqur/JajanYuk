/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import util.KoneksiDB;
import model.Register;

public class RegisterDAO {

    public boolean insert(Register reg) {
    String sql = "INSERT INTO user (name, username, password) VALUES (?, ?, ?)";

    try (Connection conn = KoneksiDB.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {

        System.out.println("Koneksi OK: " + conn);
        System.out.println("Mau insert: " + reg.getName() + ", " + reg.getUsername());

        ps.setString(1, reg.getName());
        ps.setString(2, reg.getUsername());
        ps.setString(3, reg.getPassword());

        int rows = ps.executeUpdate();
        System.out.println("Rows inserted: " + rows);

        return rows > 0;

    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    }
    }
}