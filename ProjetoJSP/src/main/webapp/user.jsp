<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Usuário</title></head>
<body>
<% 
    model.User user = (model.User) request.getAttribute("user");
    if (user != null) {
%>
    <h1>Olá, <%= user.getNome() %>!</h1>
<% } else { %>
    <p>Usuário não encontrado.</p>
<% } %>
</body>
</html>
