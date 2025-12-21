package controller;

import model.Review;
import model.ReviewDAO;
import util.KoneksiDB;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {

    // Semua GET diarahkan ke POST supaya edit/delete menggunakan GET tetap jalan
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        ReviewDAO dao = new ReviewDAO();

        // =========================
        //         DELETE
        // =========================
        if ("delete".equals(action)) {

            int reviewID = Integer.parseInt(request.getParameter("reviewID"));
            int placeID = Integer.parseInt(request.getParameter("placeID"));

            dao.deleteReview(reviewID);
            response.sendRedirect("LihatDetail.jsp?placeID=" + placeID);
            return;
        }

        // =========================
        //         EDIT FORM
        // =========================
        if ("editForm".equals(action)) {
            int reviewID = Integer.parseInt(request.getParameter("reviewID"));
            int placeID = Integer.parseInt(request.getParameter("placeID"));

            Review r = dao.getReviewById(reviewID);
            // PENTING: Set placeID ke objek review sebelum dikirim ke JSP
            // Ini diperlukan karena form EditReview.jsp perlu placeID di hidden input
            // untuk redirect setelah save.
            if (r != null) {
                r.setPlaceID(placeID); 
            }
            
            request.setAttribute("review", r);
            request.setAttribute("placeID", placeID);

            request.getRequestDispatcher("EditReview.jsp").forward(request, response);
            return;
        }

        // =========================
        //         EDIT SAVE
        // =========================
        if ("edit".equals(action)) {

            int reviewID = Integer.parseInt(request.getParameter("reviewID"));
            int rating = Integer.parseInt(request.getParameter("rating"));
            String konten = request.getParameter("konten");
            int placeID = Integer.parseInt(request.getParameter("placeID"));

            Review r = new Review();
            r.setReviewID(reviewID);
            r.setRating(rating);
            r.setKonten(konten);
            r.setPlaceID(placeID);

            dao.editReview(r);
            response.sendRedirect("LihatDetail.jsp?placeID=" + placeID);
            return;
        }

        // =========================
        //         ADD
        // =========================
        if ("add".equals(action)) {

            Integer userID = (Integer) request.getSession().getAttribute("userID");
            if (userID == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String konten = request.getParameter("konten");
            int rating = Integer.parseInt(request.getParameter("rating"));
            int placeID = Integer.parseInt(request.getParameter("placeID"));

            Review r = new Review();
            r.setKonten(konten);
            r.setRating(rating);
            r.setDateCreated(new java.util.Date());
            r.setUserID(userID);
            r.setPlaceID(placeID);

            dao.addReview(r);
            response.sendRedirect("LihatDetail.jsp?placeID=" + placeID);
        }
    }
}
