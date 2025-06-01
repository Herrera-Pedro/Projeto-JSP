<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/login.css"/>
</head>
<body>
    <ul>
        <li><a href="index.jsp">Início</a></li>
        <li><a href="cardapio.jsp">Cardápio</a></li>
        <li><a class="active" href="">Entrar</a></li>
    </ul>   
    <form action="login" method="post" class="login-form">
        <label for="email">E-mail:</label>
        <input type="text" id="email" name="email" required>
        <br>
        <label for="password">Senha:</label>
        <input type="password" id="password" name="password" required>
        <br>
        <button type="submit">Entrar</button>
    </form>
    <a href="cadastro.jsp">Cadastre-se</a>
    <a href="index.jsp">Início</a>
</body>
</html>