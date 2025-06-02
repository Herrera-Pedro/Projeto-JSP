/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import DAO.PedidoDAO;
import entity.Pedido;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author User
 */
@WebServlet(name = "PedidoServlet", urlPatterns = {"/PedidoServlet"})
public class PedidoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Inserir novo pedido
        try {
            String userIdParam = request.getParameter("user_id");
            if (userIdParam == null || userIdParam.isEmpty() || userIdParam.equals("0")) {
                response.sendRedirect("login.jsp");
                return;
            }
            int userId = Integer.parseInt(userIdParam);
            int pepperoni = Integer.parseInt(request.getParameter("pepperoni"));
            int rucula = Integer.parseInt(request.getParameter("rucula"));
            int chocolate = Integer.parseInt(request.getParameter("chocolate"));

            Pedido pedido = new Pedido();
            pedido.setUserId(userId);
            pedido.setPepperoni(pepperoni);
            pedido.setRucula(rucula);
            pedido.setChocolate(chocolate);

            PedidoDAO pedidoDAO = new PedidoDAO();
            pedidoDAO.inserir(pedido);

            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Listar todos os pedidos
        try {
            PedidoDAO pedidoDAO = new PedidoDAO();
            List<Pedido> pedidos = pedidoDAO.listarTodos();

            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<html><body><h2>Lista de Pedidos</h2><ul>");
            for (Pedido pedido : pedidos) {
                out.println("<li>ID: " + pedido.getId() +
                        ", UserID: " + pedido.getUserId() +
                        ", Pepperoni: " + pedido.getPepperoni() +
                        ", Rúcula: " + pedido.getRucula() +
                        ", Chocolate: " + pedido.getChocolate() + "</li>");
            }
            out.println("</ul></body></html>");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("erro.jsp");
        }
    }
}
