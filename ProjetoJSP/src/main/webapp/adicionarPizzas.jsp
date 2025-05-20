<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, java.text.DecimalFormat" %>
<%
    // Simulação de pizzas disponíveis
    class Pizza {
        String nome;
        double preco;
        Pizza(String nome, double preco) {
            this.nome = nome;
            this.preco = preco;
        }
    }
    List<Pizza> pizzas = Arrays.asList(
        new Pizza("Mussarela", 25.0),
        new Pizza("Calabresa", 28.0),
        new Pizza("Quatro Queijos", 30.0)
    );

    // Carrinho na sessão
    List<Pizza> carrinho = (List<Pizza>) session.getAttribute("carrinho");
    if (carrinho == null) {
        carrinho = new ArrayList<>();
        session.setAttribute("carrinho", carrinho);
    }

    // Adiciona pizza ao carrinho se solicitado
    String pizzaIndex = request.getParameter("pizza");
    if (pizzaIndex != null) {
        int idx = Integer.parseInt(pizzaIndex);
        carrinho.add(pizzas.get(idx));
    }

    // Soma total do carrinho
    double total = 0.0;
    for (Pizza p : carrinho) total += p.preco;
    DecimalFormat df = new DecimalFormat("#0.00");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cardápio de Pizzas</title>
    <style>
        .container { display: flex; }
        .cardapio, .carrinho { padding: 20px; border: 1px solid #ccc; margin: 10px; }
        .carrinho { min-width: 250px; background: #f9f9f9; }
        .adicionar-btn { margin-top: 10px; }
    </style>
</head>
<body>
<div class="container">
    <!-- Cardápio -->
    <div class="cardapio">
        <h2>Cardápio</h2>
        <form method="post">
            <ul>
                <% for (int i = 0; i < pizzas.size(); i++) { %>
                    <li>
                        <strong><%= pizzas.get(i).nome %></strong> - R$ <%= df.format(pizzas.get(i).preco) %>
                        <button class="adicionar-btn" type="submit" name="pizza" value="<%= i %>">
                            Adicionar Pizza ao Carrinho
                        </button>
                    </li>
                <% } %>
            </ul>
        </form>
    </div>

    <!-- Carrinho -->
    <div class="carrinho">
        <h2>Carrinho</h2>
        <% if (carrinho.isEmpty()) { %>
            <p>Seu carrinho está vazio.</p>
        <% } else { %>
            <ul>
                <% for (Pizza p : carrinho) { %>
                    <li><%= p.nome %> - R$ <%= df.format(p.preco) %></li>
                <% } %>
            </ul>
            <hr>
            <strong>Total: R$ <%= df.format(total) %></strong>
        <% } %>
    </div>
</div>
</body>
</html>