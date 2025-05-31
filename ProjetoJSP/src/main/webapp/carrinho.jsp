<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- Define o tipo de conteúdo da página como HTML com codificação UTF-8 e linguagem Java -->

<!DOCTYPE html>
<html lang="pt-br">
<!-- Define o documento como HTML5 e especifica o idioma como português do Brasil -->

<head>
    <meta charset="UTF-8">
    <!-- Define a codificação de caracteres como UTF-8 -->
    <title>Carrinho de Compras</title>
    <!-- Define o título da página como "Carrinho de Compras" -->
</head>

<body>
    <h1>Itens no Carrinho</h1>
    <!-- Exibe o título principal da página -->

    <%
        // Obtém os itens do carrinho enviados pelo Servlet como atributo da requisição
        String[] cartItems = (String[]) request.getAttribute("cartItems");

        // Verifica se o array de itens não é nulo e contém itens
        if (cartItems != null && cartItems.length > 0) {
    %>
        <ul>
            <!-- Cria uma lista não ordenada para exibir os itens do carrinho -->
            <%
                // Itera sobre os itens do carrinho e os exibe como itens da lista
                for (String item : cartItems) {
            %>
                <li><%= item %></li>
                <!-- Exibe cada item do carrinho como um item da lista -->
            <%
                }
            %>
        </ul>
    <%
        } else {
    %>
        <p>Seu carrinho está vazio.</p>
        <!-- Exibe uma mensagem informando que o carrinho está vazio -->
    <%
        }
    %>

    <!-- Formulário para ações do carrinho -->
    <form method="post" action="carrinho">
        <!-- Define o método como POST e a ação como o Servlet "carrinho" -->
        <button type="submit" name="action" value="continueShopping">Continuar Comprando</button>
        <!-- Botão para continuar comprando, envia a ação "continueShopping" -->
        <button type="submit" name="action" value="proceedToPayment">Ir para o Pagamento</button>
        <!-- Botão para ir ao pagamento, envia a ação "proceedToPayment" -->
    </form>
</body>
</html>