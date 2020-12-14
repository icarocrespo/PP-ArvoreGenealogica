<%@page import="util.Criptografia"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="model.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="util.Upload"%>
<%@page import="java.util.List"%>
<%@include file="../cabecalho.jsp" %>
<%    UsuarioDAO dao = new UsuarioDAO();
    Usuario obj = new Usuario();

    if (request.getParameter("codigo") != null) {
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    }

    if (request.getMethod().equals("POST")) {
        obj.setId(Integer.parseInt(request.getParameter("txtId")));
        obj.setLogin(request.getParameter("txtLogin"));
        obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));

        if (request.getParameter("txtAdmin").equals("sim")) {
            obj.setAdmin(true);
        } else {
            obj.setAdmin(false);
        }

        dao.alterar(obj);
        response.sendRedirect("index.jsp");

    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuários
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Usuario
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="txtId" readonly value="<%=obj.getId()%>" />
                    </div>
                    <div class="form-group">
                        <label>Login</label>
                        <input class="form-control" type="text" name="txtLogin" required value="<%=obj.getLogin()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input class="form-control" placeholder="*****" type="password" name="txtSenha" required/>
                    </div>
                    <div class="form-group">
                        <label>Admin</label><br>
                        <%
                            if (obj.getAdmin()) {
                        %>
                        <input type="radio" name="txtAdmin" required value="sim" checked />
                        <label for="nao">Sim</label><br>
                        <input type="radio" name="txtAdmin" required value="nao" />
                        <label for="nao">Não</label><br>
                        <%} else {%>
                        <input type="radio" name="txtAdmin" required value="sim" />
                        <label for="nao">Sim</label><br>
                        <input type="radio" name="txtAdmin" required value="nao" checked />
                        <label for="nao">Não</label><br>
                        <%}%>
                    </div>
                </div>
                <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>