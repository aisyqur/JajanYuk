/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import model.PencarianDAO;
import model.Tempat;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.util.List;

@WebServlet("/PencarianServlet")
public class PencarianServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("keyword");
        String rating = request.getParameter("rating");
        String sort = request.getParameter("sort");

        PencarianDAO dao = new PencarianDAO();
        List<Tempat> hasil = dao.cari(keyword, rating, sort);

        request.setAttribute("hasil", hasil);
        request.setAttribute("keyword", keyword);
        request.setAttribute("rating", rating);
        request.setAttribute("sort", sort);

        request.getRequestDispatcher("All menu.jsp").forward(request, response);
    }
}
