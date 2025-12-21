package controller;

import model.Register;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // username lama dari session
        String oldUsername = (String) session.getAttribute("username");

        // data baru dari form
        String newUsername = request.getParameter("username");
        String fullname = request.getParameter("fullname");
        String oldPassword = request.getParameter("password");
        String newPassword = request.getParameter("newPassword");

        Register reg = new Register();
        reg.setUsername(oldUsername);      // WHERE
        reg.setNewUsername(newUsername);   // SET
        reg.setName(fullname);

        // ================= CEK PASSWORD LAMA =================
        if (newPassword != null && !newPassword.isEmpty()) {
            // jika user ingin mengganti password, cek password lama dulu
            if (!reg.checkOldPassword(oldPassword)) {
                // password lama salah
                request.setAttribute("message", "Password Salah!");
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
                return;
            }
            reg.setPassword(newPassword); // password lama benar → set password baru
        }

        boolean result = reg.updateProfile();

        if (result) {
            // UPDATE SESSION
            session.setAttribute("username", newUsername);
            session.setAttribute("name", fullname);
            
            session.setAttribute("message", "Profile berhasil diperbarui!");
            response.sendRedirect("profile.jsp");
        } else {
            request.setAttribute("message", "Gagal update profile");
            request.getRequestDispatcher("profile.jsp").forward(request, response);
        }
    }
}