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
                <!-- single product -->
                <div class = "product">
                    <div class = "product-content">
                        <div class = "product-img">
                            <img src = "${pageContext.request.contextPath}/styles/images/alan-hardman-SU1LFoeEUkk-unsplash.jpg" alt = "Imagem do Produto">
                        </div>
                    </div>
                    <div class = "product-info">
                        <div class = "product-info-top">
                        <a href = "#" class = "product-name">Pepperoni</a>                            
                            <button type = "button" class = "btn-cart"> + Carrinho
                            </button>
                            <button type = "button" class = "btn-buy"> Comprar
                            </button>
                        </div>
                        <p class = "product-price">R$ 32,00</p>
                    </div>
                </div>
                <!-- end of single product -->
                <!-- single product -->
                <div class = "product">
                    <div class = "product-content">
                        <div class = "product-img">
                            <img src = "${pageContext.request.contextPath}/styles/images/saundarya-srinivasan-60nzTP7_hMQ-unsplash(redimensionado).jpg" alt = "Imagem do Produto">
                        </div>
                    </div>
                    <div class = "product-info">
                        <div class = "product-info-top">
                        <a href = "#" class = "product-name">Rúcula c/ Queijo</a>                            
                            <button type = "button" class = "btn-cart"> + Carrinho
                            </button>
                            <button type = "button" class = "btn-buy"> Comprar
                            </button>
                        </div>
                        <p class = "product-price">R$ 38,00</p>
                    </div>
                </div>
                <!-- end of single product -->
                <!-- single product -->
                <div class = "product">
                    <div class = "product-content">
                        <div class = "product-img">
                            <img src = "${pageContext.request.contextPath}/styles/images/aldward-castillo-NEr4vXqKayY-unsplash.jpg" alt = "Imagem do Produto">
                        </div>
                    </div>
                    <div class = "product-info">
                        <div class = "product-info-top">
                        <a href = "#" class = "product-name">Chocolate</a>                            
                            <button type = "button" class = "btn-cart"> + Carrinho
                            </button>
                            <button type = "button" class = "btn-buy"> Comprar
                            </button>
                        </div>
                        <p class = "product-price">R$ 32,00</p>
                    </div>
                </div>
                <!-- end of single product -->
            </div>
        </div>
    </div>

</body>
</html>