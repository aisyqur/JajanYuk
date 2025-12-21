package controller;

import model.Tempat;
import model.TempatDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;

@WebServlet("/tambahTempat")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 1,  
        maxFileSize = 1024 * 1024 * 10,       
        maxRequestSize = 1024 * 1024 * 15    
)
public class TempatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("tambahTempat.jsp")
               .forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String namaTempat = request.getParameter("namaTempat");
        String alamat     = request.getParameter("alamat");
        String kategori   = request.getParameter("kategori");
        String ratingStr  = request.getParameter("rating");

        // ======= HANDLE FILE FOTO =======
        Part filePart = request.getPart("foto"); // name="foto" di JSP
        String fileName = null;

        if (filePart != null && filePart.getSize() > 0) {
            // nama file asli
            fileName = getFileName(filePart);

            // folder tujuan: webapp/uploads
            String uploadPath = getServletContext().getRealPath("/uploads");

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // path lengkap file
            String filePath = uploadPath + File.separator + fileName;

            // simpan file di server
            filePart.write(filePath);
        }

        Integer rating = null;
        if (ratingStr != null && !ratingStr.trim().isEmpty()) {
            try {
                rating = Integer.parseInt(ratingStr);
            } catch (NumberFormatException e) {
                rating = null;
            }
        }

        Tempat tempat = new Tempat();
        tempat.setNamaTempat(namaTempat);
        tempat.setAlamat(alamat);
        tempat.setKategori(kategori);

        // simpan hanya NAMA FILE-nya saja ke DB (bukan path penuh)
        tempat.setFoto(fileName);
        tempat.setRating(rating);

        TempatDAO dao = new TempatDAO();
        boolean sukses = dao.tambahTempat(tempat);

        if (sukses) {
            response.sendRedirect("tambahTempat.jsp?status=sukses");
        } else {
            request.setAttribute("error", "Gagal menyimpan data tempat");
            request.getRequestDispatcher("tambahTempat.jsp")
                   .forward(request, response);
        }
    }

    // Ambil nama file dari header part
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        // contoh: form-data; name="foto"; filename="gambar1.jpg"
        for (String token : contentDisp.split(";")) {
            if (token.trim().startsWith("filename")) {
                String fileName = token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
                // supaya nama file tidak kosong kalau user tidak pilih file
                return new File(fileName).getName();
            }
        }
        return null;
    }
}