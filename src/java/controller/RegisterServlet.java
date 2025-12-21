package controller;

import model.Register;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Register reg = new Register();
        reg.setName(name);
        reg.setUsername(username);
        reg.setPassword(password);

        // ================= VALIDASI =================
        if (!reg.validateInput()) {
            request.setAttribute("message", "Input tidak boleh kosong!");

            if ("edit".equals(action)) {
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
            return;
        }

        // ================= EDIT PROFILE =================
        if ("edit".equals(action)) {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("userid") == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int userid = (int) session.getAttribute("userid");
            reg.setUserid(userid); // ⬅ INI KUNCI FIX-NYA

            boolean result = reg.updateProfile();

            if (result) {
                request.setAttribute("message", "Profile berhasil diperbarui!");
            } else {
                request.setAttribute("message", "Gagal memperbarui profile!");
            }

            request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            return;
        }

        // ================= REGISTER =================
        boolean result = reg.register();

        if (result) {
            request.setAttribute("message", "Registrasi berhasil!");
        } else {
            request.setAttribute("message", "Registrasi gagal! Coba lagi.");
        }

        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
}