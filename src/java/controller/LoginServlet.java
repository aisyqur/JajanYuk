/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import model.Login;
import model.LoginDAO;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Login login = new Login(username, password);

        // Validasi input
        if (!login.validateUser()) {
            request.setAttribute("message", "Username dan password wajib diisi!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        LoginDAO dao = new LoginDAO();
        boolean valid = dao.checkLogin(username, password);

        if (valid) {
            String name = dao.getNameByUsername(username);
            int userID = dao.getUserIDByUsername(username);

            // Simpan session
            request.getSession().setAttribute("username", username);
            request.getSession().setAttribute("name", name);
            request.getSession().setAttribute("userID", userID);
            response.sendRedirect("All menu.jsp");
        } else {
            request.setAttribute("message", "Username atau password salah!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}