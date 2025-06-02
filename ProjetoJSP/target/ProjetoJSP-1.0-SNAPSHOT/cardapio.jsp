<%@page import="entity.Cliente"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cardápio de Pizzas</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/cardapio.css"/>
</head>
<body>
    <%
        Cliente cliente = (Cliente) session.getAttribute("cliente");
    %>
    <div class="navbar">
        <div class="navbar-bg"></div>
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
    </div>

    <div class="products">
        <div class="container">
            <div class="product-items">
                <!-- Produto Pepperoni -->
                <div class="product">
                    <div class="product-content">
                        <div class="product-img">
                            <img src="${pageContext.request.contextPath}/styles/images/alan-hardman-SU1LFoeEUkk-unsplash.jpg" alt="Imagem do Produto">
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="product-info-top">
                            <a href="#" class="product-name">Pepperoni</a>
                            <form action="PedidoServlet" method="post" style="display:inline;">
                                <input type="hidden" name="user_id" value="<%= cliente != null ? cliente.getId() : 0 %>"/>
                                <input type="hidden" name="pepperoni" value="1"/>
                                <input type="hidden" name="rucula" value="0"/>
                                <input type="hidden" name="chocolate" value="0"/>
                                <button type="submit" class="btn-buy">Comprar</button>
                            </form>
                        </div>
                        <p class="product-price">R$ 32,00</p>
                    </div>
                </div>
                <!-- Produto Rúcula -->
                <div class="product">
                    <div class="product-content">
                        <div class="product-img">
                            <img src="${pageContext.request.contextPath}/styles/images/saundarya-srinivasan-60nzTP7_hMQ-unsplash(redimensionado).jpg" alt="Imagem do Produto">
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="product-info-top">
                            <a href="#" class="product-name">Rúcula c/ Queijo</a>
                            <form action="PedidoServlet" method="post" style="display:inline;">
                                <input type="hidden" name="user_id" value="<%= cliente != null ? cliente.getId() : 0 %>"/>
                                <input type="hidden" name="pepperoni" value="0"/>
                                <input type="hidden" name="rucula" value="1"/>
                                <input type="hidden" name="chocolate" value="0"/>
                                <button type="submit" class="btn-buy">Comprar</button>
                            </form>
                        </div>
                        <p class="product-price">R$ 38,00</p>
                    </div>
                </div>
                <!-- Produto Chocolate -->
                <div class="product">
                    <div class="product-content">
                        <div class="product-img">
                            <img src="${pageContext.request.contextPath}/styles/images/aldward-castillo-NEr4vXqKayY-unsplash.jpg" alt="Imagem do Produto">
                        </div>
                    </div>
                    <div class="product-info">
                        <div class="product-info-top">
                            <a href="#" class="product-name">Chocolate</a>
                            <form action="PedidoServlet" method="post" style="display:inline;">
                                <input type="hidden" name="user_id" value="<%= cliente != null ? cliente.getId() : 0 %>"/>
                                <input type="hidden" name="pepperoni" value="0"/>
                                <input type="hidden" name="rucula" value="0"/>
                                <input type="hidden" name="chocolate" value="1"/>
                                <button type="submit" class="btn-buy">Comprar</button>
                            </form>
                        </div>
                        <p class="product-price">R$ 32,00</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>