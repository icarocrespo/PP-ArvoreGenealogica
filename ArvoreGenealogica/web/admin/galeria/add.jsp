<%@page import="dao.FotoDAO"%>
<%@page import="model.Foto"%>
<%@page import="util.Upload"%>
<%@page import="util.Criptografia"%>
<%@page import="model.Usuario"%>
<%@page import="dao.UsuarioDAO"%>
<%@include file="../cabecalho.jsp" %>
<%    
    FotoDAO dao = new FotoDAO();
    Foto obj = new Foto();
    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (up.getForm().get("txtTitulo").toString() == null || up.getForm().get("txtPreco").toString() == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            if (up.getForm().get("txtTitulo").toString().isEmpty() || up.getForm().get("txtPreco").toString().isEmpty()) {
                response.sendRedirect("index.jsp");
                return;
            }
            
            if (!up.getFiles().isEmpty()) {
                if (up.getFiles().size() > 0) {
                    obj.setUrl(up.getFiles().get(0));
                }
            }
            dao.incluir(obj);
            response.sendRedirect("index.jsp");
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