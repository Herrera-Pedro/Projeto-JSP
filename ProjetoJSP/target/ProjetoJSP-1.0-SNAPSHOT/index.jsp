<%@page import="entity.Cliente"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Home</title>
    </head>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
    %>

    <body>
        <h1>Página Inicial</h1>
    
        <% 
        
            if (cliente != null) { 
        
        %>
            <h2>Olá, <%= cliente.getNome() %></h2>
            <a href="logout">Sair</a>
        <% } else { %>
            <h2>Olá, visitante!</h2>
            <a href="login.jsp">Fazer login</a>
        <% } %>

        <!-- Links comuns a todos -->
        <a href="adicionarPizzas.jsp">Adicionar Pizzas</a>
        <a href="cardapio.jsp">Cardápio</a>
        <a href="carrinho.jsp">Carrinho</a>
        <a href="pagamento.jsp">Pagamento</a>
    </body>
</html>
