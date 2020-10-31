<%@page import="util.Criptografia"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%
    UsuarioDAO dao = new UsuarioDAO();
    List<Usuario> lista = dao.listar();

    if (request.getParameter("txtLogin") != null) {
        for (Usuario u : lista) {
            if (request.getParameter("txtLogin").equals(u.getLogin())
                    && Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(u.getSenha())) {
                session.setAttribute("usuario", request.getParameter("txtLogin"));
                response.sendRedirect("home/index.jsp");
            }
        }
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>

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
                        <h2 align="center">Login</h2>
                        <form action="login.jsp" method="post">

                            <div class="form-group">
                                <label>Login</label>
                                <input class="form-control" placeholder="Login" type="text" name="txtLogin" required/>
                            </div>
                            <div class="form-group">
                                <label>Senha</label>
                                <input class="form-control" placeholder="Senha" type="password" name="txtSenha" required/>
                            </div>
                            
                            <div class="form-group">
                                <a href="novologin.jsp" class="btn btn-warning">Criar conta</a>
                                <input class="btn btn-primary" type="submit" value="Enviar"/>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>