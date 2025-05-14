package controller;

// Importa as classes necessárias para trabalhar com Servlets e requisições HTTP
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

// Define a URL que será usada para acessar este Servlet (neste caso, "/carrinho")
@WebServlet("/carrinho")
public class CarrinhoServlet extends HttpServlet {

    // Método que será executado quando uma requisição HTTP do tipo GET for feita
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Simula a obtenção de itens do carrinho (em uma aplicação real, isso viria de
        // uma sessão ou banco de dados)
        String[] cartItems = { "Produto 1", "Produto 2", "Produto 3" };

        // Adiciona os itens do carrinho como um atributo na requisição, para que possam
        // ser acessados na página JSP
        request.setAttribute("cartItems", cartItems);

        // Encaminha a requisição e a resposta para a página JSP chamada "carrinho.jsp"
        request.getRequestDispatcher("carrinho.jsp").forward(request, response);
    }

    // Método que será executado quando uma requisição HTTP do tipo POST for feita
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém o parâmetro "action" enviado pelo cliente (por exemplo, de um
        // formulário HTML)
        String action = request.getParameter("action");

        // Verifica qual ação foi solicitada pelo cliente
        if ("continueShopping".equals(action)) {
            // Se a ação for "continueShopping", redireciona o cliente para a página
            // "produtos.jsp"
            response.sendRedirect("produtos.jsp");
        } else if ("proceedToPayment".equals(action)) {
            // Se a ação for "proceedToPayment", redireciona o cliente para a página
            // "pagamento.jsp"
            response.sendRedirect("pagamento.jsp");
        } else {
            // Se a ação não for reconhecida, escreve "Ação inválida" na resposta HTTP
            response.getWriter().write("Ação inválida");
        }
    }
}