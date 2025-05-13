<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Erro</title>
    <script type="text/javascript">
        function forwardPage() {
            window.location.href = "login.jsp";
        }

        // Set a timer to forward the page after 5 seconds (5000 milliseconds)
        setTimeout(forwardPage, 2000);
    </script>
</head>
<body>
    <h1>Usuário ou senha inválidos.</h1>
    <p>Redirecionando para a página de login...</p>
</body>
</html>