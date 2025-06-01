package controller;

import entity.Cliente;
import DAO.ClienteDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        Cliente cliente = new Cliente();
        cliente.setNome(nome);
        cliente.setEmail(email);
        cliente.setSenha(senha);

        boolean sucesso = new ClienteDAO().inserir(cliente);

        if (sucesso) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("erro", "Erro ao cadastrar. Tente novamente.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}