<!DOCTYPE html>
<html>
<head>
    <title>Cadastro</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/login.css"/>
</head>
<body>
    <ul>
        <li><a href="index.jsp">Início</a></li>
        <li><a class="active" href="login.jsp">Entrar</a></li>
        <li><a href="cardapio.jsp">Cardápio</a></li>
    </ul>
    <h2>Cadastro</h2>
    <form action="register" method="post" class="login-form">
        <label for="nome">Nome:</label>
        <input type="text" id="nome" name="nome" required>
        <br>
        <label for="email">E-mail:</label>
        <input type="email" id="email" name="email" required>
        <br>
        <label for="senha">Senha:</label>
        <input type="password" id="senha" name="senha" required>
        <br>
        <button type="submit">Cadastrar</button>
    </form>
</body>
</html>