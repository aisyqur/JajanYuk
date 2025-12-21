package model;

import util.KoneksiDB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {

    // Helper 1: Mengambil PlaceID dari ReviewID (Diperlukan sebelum Delete/Edit)
    private int getPlaceIdByReviewId(Connection conn, int reviewID) throws SQLException {
        String sql = "SELECT placeID FROM review WHERE reviewID = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, reviewID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("placeID");
            }
        }
        return 0; 
    }

    // Helper 2: Menghitung rata-rata GABUNGAN (Review + Rating Awal) dan update kolom 'rataRata'
    private void calculateAndUpdateAverageRating(Connection conn, int placeID) throws SQLException {
        
        // SQL Solusi B: Menghitung AVG(rating) GABUNGAN (Rating Awal + Semua Review)
        // Kolom target update: rataRata (INT)
        String selectAvgSql = 
            "SELECT " +
            "    ROUND(" +
            "        (IFNULL(SUM(r.rating), 0) + t.Rating) / " +
            "        (IFNULL(COUNT(r.reviewID), 0) + 1)" +
            "    ) AS avg_rating_int " +
            "FROM tempat t " +
            "LEFT JOIN review r ON t.placeID = r.placeID " +
            "WHERE t.placeID = ? " +
            "GROUP BY t.placeID"; 
        
        String updateTempatSql = "UPDATE tempat SET rataRata = ? WHERE placeID = ?";

        try (PreparedStatement psSelect = conn.prepareStatement(selectAvgSql)) {
            psSelect.setInt(1, placeID);
            ResultSet rs = psSelect.executeQuery();

            if (rs.next()) {
                // Ambil hasil pembulatan integer
                int avgRatingInt = rs.getInt("avg_rating_int"); 

                try (PreparedStatement psUpdate = conn.prepareStatement(updateTempatSql)) {
                    psUpdate.setInt(1, avgRatingInt); 
                    psUpdate.setInt(2, placeID);
                    psUpdate.executeUpdate();
                }
            }
        }
    }
    // Method to add a review to the database
    public boolean addReview(Review review) {
        String sql = "INSERT INTO review (konten, rating, dateCreated, userID, placeID) VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, review.getKonten());
            ps.setInt(2, review.getRating());
            ps.setTimestamp(3, new Timestamp(review.getDateCreated().getTime()));
            ps.setInt(4, review.getUserID());
            ps.setInt(5, review.getPlaceID());

            boolean success = ps.executeUpdate() > 0;
            
            if (success) {
                // Panggil helper setelah berhasil insert
                calculateAndUpdateAverageRating(conn, review.getPlaceID());
            }
            return success;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Method untuk mendapatkan review tunggal berdasarkan reviewID
    public Review getReviewById(int reviewID) {
        String sql = "SELECT * FROM review WHERE reviewID = ?";
        Review review = null;
        try (Connection conn = KoneksiDB.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, reviewID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                review = new Review();
                review.setReviewID(rs.getInt("reviewID"));
                review.setKonten(rs.getString("konten"));
                review.setRating(rs.getInt("rating"));
                review.setDateCreated(rs.getTimestamp("dateCreated"));
                review.setUserID(rs.getInt("userID"));
                review.setPlaceID(rs.getInt("placeID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return review;
    }
    // Method untuk mendapatkan review berdasarkan placeID
    public List<Review> getReviewByPlaceID(int placeID) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM review WHERE placeID = ? ORDER BY dateCreated DESC";

        try (Connection conn = KoneksiDB.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, placeID);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Review review = new Review();
                review.setReviewID(rs.getInt("reviewID"));
                review.setKonten(rs.getString("konten"));
                review.setRating(rs.getInt("rating"));
                review.setDateCreated(rs.getTimestamp("dateCreated"));
                review.setUserID(rs.getInt("userID"));
                review.setPlaceID(rs.getInt("placeID"));
                reviews.add(review);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }

    // Method untuk mengedit review
    public boolean editReview(Review review) {
        String sql = "UPDATE review SET konten = ?, rating = ? WHERE reviewID = ?";
        int placeID = 0;
        
        try (Connection conn = KoneksiDB.getConnection()) {
            
            // 1. Ambil placeID sebelum update
            placeID = getPlaceIdByReviewId(conn, review.getReviewID());
            
            // 2. Lakukan Update
            try(PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, review.getKonten());
                ps.setInt(2, review.getRating());
                ps.setInt(3, review.getReviewID());
                
                boolean success = ps.executeUpdate() > 0;

                if (success && placeID > 0) {
                    // 3. Panggil helper setelah berhasil update
                    calculateAndUpdateAverageRating(conn, placeID);
                }
                return success;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method untuk menghapus review
    public boolean deleteReview(int reviewID) {
        String sql = "DELETE FROM review WHERE reviewID = ?";
        int placeID = 0;
        
        try (Connection conn = KoneksiDB.getConnection()) {
            
            // 1. Ambil placeID sebelum delete
            placeID = getPlaceIdByReviewId(conn, reviewID);
            
            // 2. Lakukan Delete
            try(PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, reviewID);
                
                boolean success = ps.executeUpdate() > 0;

                if (success && placeID > 0) {
                    // 3. Panggil helper setelah berhasil delete
                    calculateAndUpdateAverageRating(conn, placeID);
                }
                return success;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
}
