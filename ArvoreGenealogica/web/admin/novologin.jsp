<%@page import="util.Criptografia"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%

    if (request.getParameter("txtLogin") != null) {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario obj = new Usuario();
        if (request.getParameter("txtAdmin") != null) {
            obj.setAdmin(true);
        } else {
            obj.setAdmin(false);
        }
        obj.setLogin(request.getParameter("txtLogin"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        dao.incluir(obj);
        response.sendRedirect("login.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Novo Usuário</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    </head>
    <body>
        <div class="row">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <!--Novo Login-->
                </div>
                <div class="panel-body">
                    <div class="col-lg-4"></div>
                    <div class="col-lg-4">
                        <h2 align="center">Novo Usuário</h2>
                        <form action="novologin.jsp" method="post">

                            <div class="form-group">
                                <label>Login</label>
                                <input class="form-control" placeholder="Login" type="text" name="txtLogin" required/>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input class="form-control" placeholder="Senha" type="password" name="txtSenha" required/>
                            </div>
                            <div class="form-group">
                                <label>Admin</label>
                                <input type="checkbox" name="txtAdmin" required/>
                            </div>
                            <div class="form-group">
                                <a href="login.jsp" class="btn btn-warning">Voltar</a>
                                <input class="btn btn-primary" type="submit" value="Enviar"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
