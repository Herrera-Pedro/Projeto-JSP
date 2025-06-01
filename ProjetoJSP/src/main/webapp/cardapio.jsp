<%@page import="entity.Cliente"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cardápio de Pizzas</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/styles.css"/>
</head>
<body>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
    %>
    <ul>
        <li><a href="index.jsp">Início</a></li>
        <li><a class="active" href="cardapio.jsp">Cardápio</a></li>
        <% 

            if (cliente != null) { 

        %>
            <li><a href="logout">Sair</a></li>
        <% } else { %>
            <li><a href="login.jsp">Entrar</a></li>
        <% } %>
    </ul>
</body>
</html>