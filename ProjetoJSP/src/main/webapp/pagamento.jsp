<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pagamento</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f5f5; }
        .container { max-width: 400px; margin: 40px auto; background: #fff; padding: 30px; border-radius: 8px; box-shadow: 0 2px 8px #ccc; }
        label { display: block; margin-top: 15px; }
        input, select { width: 100%; padding: 8px; margin-top: 5px; }
        button { margin-top: 20px; width: 100%; padding: 10px; background: #4CAF50; color: #fff; border: none; border-radius: 4px; font-size: 16px; }
        .msg { margin-top: 20px; font-weight: bold; text-align: center; }
    </style>
</head>
<body>
<div class="container">
    <h2>Pagamento</h2>
    <form method="post">
        <label for="tipo">Tipo de Cartão:</label>
        <select name="tipo" id="tipo" required>
            <option value="">Selecione</option>
            <option value="credito">Crédito</option>
            <option value="debito">Débito</option>
        </select>

        <label for="banco">Banco:</label>
        <select name="banco" id="banco" required>
            <option value="">Selecione</option>
            <option value="mastercard">Mastercard</option>
            <option value="nubank">Nubank</option>
            <option value="santander">Santander</option>
            <option value="bradesco">Bradesco</option>
        </select>

        <label for="numero">Número do Cartão:</label>
        <input type="text" name="numero" id="numero" maxlength="16" required pattern="\d{16}" placeholder="16 dígitos">

        <label for="nome">Nome no Cartão:</label>
        <input type="text" name="nome" id="nome" required>

        <label for="validade">Validade:</label>
        <input type="month" name="validade" id="validade" required>

        <label for="cvv">CVV:</label>
        <input type="password" name="cvv" id="cvv" maxlength="4" required pattern="\d{3,4}" placeholder="3 ou 4 dígitos">

        <label for="valor">Valor (R$):</label>
        <input type="number" name="valor" id="valor" min="1" step="0.01" required>

        <button type="submit">Pagar</button>
    </form>
    <div class="msg">
        <%
            String msg = "";
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String numero = request.getParameter("numero");
                String cvv = request.getParameter("cvv");
                String valorStr = request.getParameter("valor");
                double valor = 0;
                try { valor = Double.parseDouble(valorStr); } catch (Exception e) {}

                // Simulação: pagamento aprovado se o número do cartão termina em número par e valor <= 1000
                if (numero != null && numero.length() == 16 && valor > 0) {
                    char lastDigit = numero.charAt(15);
                    boolean aprovado = (lastDigit % 2 == 0) && (valor <= 1000);
                    if (aprovado) {
                        msg = "O seu pedido está sendo preparado";
                    } else {
                        msg = "Dinheiro Insuficiente, tente com outro cartão";
                    }
                }
            }
            if (!msg.isEmpty()) {
        %>
            <%= msg %>
        <%
            }
        %>
    </div>
</div>
</body>
</html>