<%@page import="dao.EscolaridadeDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="model.Escolaridade"%>
<%@page import="model.Escolaridade"%>
<%@page import="model.Escolaridade"%>
<%@page import="java.util.List"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    EscolaridadeDAO dao = new EscolaridadeDAO();
    Escolaridade obj = new Escolaridade();

    if (request.getParameter("codigo") != null) {
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    }

    if (request.getMethod().equals("POST")) {
        obj.setId(Integer.parseInt(request.getParameter("id")));
        obj.setGrau(request.getParameter("grau"));

        dao.alterar(obj);
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
            Escolaridade
        </div>
        <div class="panel-body">
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="id" readonly value="<%=obj.getId()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Grau</label>
                        <input class="form-control" type="text" name="cidade" value="<%=obj.getGrau()%>" />
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>