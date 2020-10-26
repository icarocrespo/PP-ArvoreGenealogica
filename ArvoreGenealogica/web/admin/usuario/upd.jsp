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
                        <input class="form-control" placeholder="*****" type="text" name="txtSenha" required/>
                    </div>
                    <div class="form-group">
                        <label>Admin</label><br>
                        <%
                            if (obj.getAdmin()) {
                        %>
                        <input type="radio" name="txtAdmin" required value="" checked />
                        <label for="nao">Sim</label><br>
                        <input type="radio" name="txtAdmin" required value="" />
                        <label for="nao">Não</label><br>
                        <%} else {%>
                        <input type="radio" name="txtAdmin" required value="" />
                        <label for="nao">Sim</label><br>
                        <input type="radio" name="txtAdmin" required value="" checked />
                        <label for="nao">Não</label><br>
                        <%}%>
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>