/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import model.Tempat;
import util.KoneksiDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PencarianDAO {

    public List<Tempat> cari(String keyword, String rating, String sortOrder) {
        List<Tempat> list = new ArrayList<>();

        try (Connection conn = KoneksiDB.getConnection()) {
            String ratingColumnForFilter = "COALESCE(rataRata, Rating)";
            String sql = "SELECT * FROM tempat WHERE namaTempat LIKE ?";

            if (rating != null && !rating.equals("")) {
                sql += " AND " + ratingColumnForFilter + " = ?";
            }

            if ("asc".equals(sortOrder)) {
                sql += " ORDER BY " + ratingColumnForFilter + " ASC";
            } else if ("desc".equals(sortOrder)) {
                sql += " ORDER BY " + ratingColumnForFilter + " DESC";
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + keyword + "%");

            if (rating != null && !rating.equals("")) {
                ps.setInt(2, Integer.parseInt(rating));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Tempat t = new Tempat();
                t.setPlaceID(rs.getInt("placeID"));
                t.setNamaTempat(rs.getString("namaTempat"));
                t.setAlamat(rs.getString("alamat"));
                t.setKategori(rs.getString("kategori"));
                t.setRating(rs.getInt("rating"));
                t.setRataRata(rs.getInt("rataRata"));
                t.setFoto(rs.getString("foto"));
                list.add(t);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
