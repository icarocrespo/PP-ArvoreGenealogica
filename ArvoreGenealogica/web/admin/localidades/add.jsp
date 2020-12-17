<%@page import="dao.LocalidadeDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="model.Localidade"%>
<%@page import="model.Escolaridade"%>
<%@page import="model.Localidade"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocalidadeDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    LocalidadeDAO dao = new LocalidadeDAO();

    if (request.getMethod().equals("POST")) {

        Localidade obj = new Localidade();

        obj.setCidade(request.getParameter("cidade"));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setPais(request.getParameter("pais"));
        obj.setOutros(request.getParameter("outros"));

        dao.incluir(obj);
        response.sendRedirect("index.jsp");
    }
%>
<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Sistema de Árvore Genealógica
            <small>Admin</small>
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">Área Administrativa</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> adicionar registro
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Localidade
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text" name="cidade" required/>
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="endereco" />
                    </div>
                    <div class="form-group">
                        <label>País</label>
                        <input class="form-control" type="text" name="pais" />
                    </div>
                    <div class="form-group">
                        <label>Outros</label>
                        <input class="form-control" type="text" name="outros" />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>