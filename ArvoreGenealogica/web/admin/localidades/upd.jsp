<%@page import="dao.LocalidadeDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="model.Localidade"%>
<%@page import="model.Escolaridade"%>
<%@page import="model.Localidade"%>
<%@page import="java.util.List"%>
<%@page import="dao.LocalidadeDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    LocalidadeDAO dao = new LocalidadeDAO();
    Localidade obj = new Localidade();

    if(request.getParameter("codigo") != null){
        obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
    }

    if (request.getMethod().equals("POST")) {

        obj.setId(Integer.parseInt(request.getParameter("id")));
        obj.setCidade(request.getParameter("cidade"));
        obj.setEndereco(request.getParameter("endereco"));
        obj.setPais(request.getParameter("pais"));
        obj.setOutros(request.getParameter("outros"));

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
                <i class="fa fa-file"></i>
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
                        <label>Id</label>
                        <input class="form-control" type="text" name="id" readonly value="<%=obj.getId()%>" />
                    </div>
                    <div class="form-group">
                        <label>Cidade</label>
                        <input class="form-control" type="text" name="cidade" value="<%=obj.getCidade()%>" />
                    </div>
                    <div class="form-group">
                        <label>Endereço</label>
                        <input class="form-control" type="text" name="endereco" value="<%=obj.getEndereco()%>"/>
                    </div>
                    <div class="form-group">
                        <label>País</label>
                        <input class="form-control" type="text" name="pais" value="<%=obj.getPais()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Outros dados</label>
                        <input class="form-control" type="text" name="outros" value="<%=obj.getOutros()%>"/>
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>