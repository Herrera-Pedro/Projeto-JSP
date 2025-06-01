<%@page import="entity.Cliente"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Início</title>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/styles.css"/>
    </head>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
    %>

    <body>
        <div class="mainContent">
            <div class="hero-section">
                <ul>
                    <li><a class="active" href="index.jsp">Início</a></li>
                    <li><a href="cardapio.jsp">Cardápio</a></li>
                    <% 
        
                        if (cliente != null) { 

                    %>
                        <li><a href="logout">Sair</a></li>
                    <% } else { %>
                        <li><a href="login.jsp">Entrar</a></li>
                    <% } %>
                </ul>
                <h1>Pizzaria HTML, a melhor de Sorocaba</h1>
                <ul class="social-links">
                    <li class="whatsapp"><a class="icon-div" href="#"><img class="icons" src="${pageContext.request.contextPath}/styles/images/whatsapp-svgrepo-com.svg" alt="whatsappIcon"></a></li>
                    <li class="facebook"><a class="icon-div" href="#"><img class="icons" src="${pageContext.request.contextPath}/styles/images/facebook-svgrepo-com.svg" alt="facebookIcon"></a></li>
                    <li class="instagram"><a class="icon-div" href="#"><img class="icons" src="${pageContext.request.contextPath}/styles/images/instagram-svgrepo-com.svg" alt="instagramIcon"></a></li>
                </ul>
            </div>
        </div>
    </body>
</html>
