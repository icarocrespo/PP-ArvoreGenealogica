<%@page import="util.Criptografia"%>
<%@page import="model.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    if (request.getMethod().equals("POST")) {
        UsuarioDAO dao = new UsuarioDAO();
        Usuario obj = new Usuario();

        obj.setLogin(request.getParameter("txtLogin"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));

        if (request.getParameter("txtAdmin").equals("sim")) {
            obj.setAdmin(true);
        } else {
            obj.setAdmin(false);
        }

        dao.incluir(obj);
        response.sendRedirect("index.jsp");
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Comércio Eletrônico
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> la la la
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Usuário
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" name="txtLogin" required/>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" type="password" name="txtSenha" required/>
                    </div>
                    <div class="form-group">
                        <label>Admin</label><br>
                        <input type="radio" name="txtAdmin" required value="sim" />
                        <label for="nao">Sim</label><br>
                        <input type="radio" name="txtAdmin" required value="nao" />
                        <label for="nao">Não</label><br>
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>