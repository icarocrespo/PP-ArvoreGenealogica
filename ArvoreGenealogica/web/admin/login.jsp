<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();

    if (request.getParameter("txtLoginE") != null) {
        for (Usuario u : lista) {
            if (request.getParameter("txtLoginE").equals(u.getLogin()) && request.getParameter("txtSenhaE").equals(u.getSenha())) {
                session.setAttribute("usuario", request.getParameter("txtLoginE"));
                response.sendRedirect("home/index.jsp");
            }
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="logincss.css" type="text/css" media="screen" />
    </head>
    <body>
        <div id="login">
            <h3>Entre Aqui</h3>
            <form action="login.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="txtLoginE" required><br>
                <label>Senha:</label>
                <input type="password" name="txtSenhaE" required><br>
                <input type="submit" value="Entrar"/>
            </form>
            Não possui login?<br><a href="novologin.jsp"> Clique aqui</a><br />
            <a href="#">Esqueci a Senha</a><br />
        </div>
    </body>
</html>