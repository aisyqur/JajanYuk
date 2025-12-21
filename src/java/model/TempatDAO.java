/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TempatDAO {

    // Existing method for adding a place
    public boolean tambahTempat(Tempat tempat) {
        String sql = "INSERT INTO tempat (namaTempat, alamat, kategori, foto, Rating) "
                   + "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, tempat.getNamaTempat());
            ps.setString(2, tempat.getAlamat());
            ps.setString(3, tempat.getKategori());
            ps.setString(4, tempat.getFoto());

            if (tempat.getRating() != null) {
                ps.setInt(5, tempat.getRating());
            } else {
                ps.setNull(5, Types.INTEGER);
            }

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all places from the database
    public List<Tempat> getAllTempat() {
        List<Tempat> tempatList = new ArrayList<>();
        String sql = "SELECT * FROM tempat";

        try (Connection conn = KoneksiDB.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Tempat tempat = new Tempat();
                tempat.setPlaceID(rs.getInt("placeID"));
                tempat.setNamaTempat(rs.getString("namaTempat"));
                tempat.setAlamat(rs.getString("alamat"));
                tempat.setKategori(rs.getString("kategori"));
                tempat.setFoto(rs.getString("foto"));
                tempat.setRating(rs.getInt("Rating"));
                tempat.setRataRata(rs.getInt("rataRata"));
                
                tempatList.add(tempat);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return tempatList;
    }
    
    // Method untuk mengambil tempat berdasarkan placeID
    public Tempat getTempatById(int placeID) {
        String sql = "SELECT * FROM tempat WHERE placeID = ?";
        Tempat tempat = null;
        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, placeID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tempat = new Tempat();
                tempat.setPlaceID(rs.getInt("placeID"));
                tempat.setNamaTempat(rs.getString("namaTempat"));
                tempat.setAlamat(rs.getString("alamat"));
                tempat.setKategori(rs.getString("kategori"));
                tempat.setFoto(rs.getString("foto"));
                tempat.setRating(rs.getInt("Rating"));
                tempat.setRataRata(rs.getInt("rataRata"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tempat;
    }

}
