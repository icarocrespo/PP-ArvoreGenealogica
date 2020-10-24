<%@page import="dao.UsuarioDAO"%>
<%@page import="modelo.Usuario"%>
<%

    if(request.getParameter("txtLogin") != null){
        UsuarioDAO dao = new UsuarioDAO();
        Usuario obj = new Usuario();
        if(request.getParameter("txtAdmin") != null){
            obj.setAdmin(true);
        }else{
            obj.setAdmin(false);
        }
        obj.setLogin(request.getParameter("txtLogin"));
        obj.setSenha(request.getParameter("txtSenha"));
        dao.incluir(obj);
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Novo Login</title>
    </head>
    <body>
        <div>
            <h2>Novo Login</h2>
            <form action="novologin.jsp" method="post">
                <label>Login:</label>
                <input type="text" name="txtLogin" required><br>
                <label>Senha:</label>
                <input type="password" name="txtSenha" required><br>
                <label>Admin:</label>
                <input type="checkbox" name="txtAdmin"><br>
                <input type="submit" value="Cadastrar"/>
            </form>
        </div>
    </body>
</html>
