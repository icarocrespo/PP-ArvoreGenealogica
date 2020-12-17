<%@page import="util.Upload"%>
<%@page import="dao.FamiliaDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="model.Familia"%>
<%@page import="model.Escolaridade"%>
<%@page import="model.Familia"%>
<%@page import="java.util.List"%>
<%@page import="dao.FamiliaDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (up.getForm().get("nome").toString() == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            FamiliaDAO dao = new FamiliaDAO();
            Familia obj = new Familia();

            obj.setNome(up.getForm().get("nome").toString());
            obj.setMembros(Integer.parseInt(up.getForm().get("membros").toString()));
            obj.setHistoria(up.getForm().get("historia").toString());

            if (!up.getFiles().isEmpty()) {
                obj.setUriBrasao(up.getFiles().get(0));
            }

            if (dao.incluir(obj)) {
                response.sendRedirect("index.jsp");
            }
        }
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
                <i class="fa fa-file"></i> adicionar registro
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Família
        </div>
        <div class="panel-body">
            <form action="#" method="post" enctype="multipart/form-data">
                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Brasão da família</label>
                        <input class="form-control" type="file" accept=".jpg, .jpeg, .png" name="brasao" />
                    </div>
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="nome" required/>
                    </div>
                    <div class="form-group">
                        <label>Membros</label>
                        <input class="form-control" type="number" name="membros" />
                    </div>
                    <div class="form-group">
                        <label>História</label>
                        <textarea class="form-control" type="text" name="historia"></textarea>
                    </div>
                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>