/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class KoneksiDB {

    private static final String URL  = "jdbc:mysql://localhost:3307/jajanyuk?useSSL=false&serverTimezone=UTC";
    private static final String USER = "root";      // ganti kalau user MySQL kamu beda
    private static final String PASS = "";          // isi password MySQL-mu (kalau ada)

    public static Connection getConnection() throws SQLException {
        try {
            // Load driver MySQL (untuk MySQL Connector/J 8.x)
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            throw new SQLException("Driver MySQL tidak ditemukan");
        }

        return DriverManager.getConnection(URL, USER, PASS);
    }
}
