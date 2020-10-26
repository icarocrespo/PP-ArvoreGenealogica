<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Marca"%>
<%@page import="java.util.List"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="util.Upload"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@include file="../cabecalho.jsp" %>
<%
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mLista = mDAO.listar();

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
            ProdutoDAO dao = new ProdutoDAO();
            Produto obj = new Produto();

            Categoria categoria = new Categoria();
            Marca marca = new Marca();

            obj.setTitulo(up.getForm().get("txtTitulo").toString());
            obj.setDescricao(up.getForm().get("txtDescricao").toString());
            BigDecimal preco = new BigDecimal(up.getForm().get("txtPreco").toString());
            obj.setPreco(preco);
            obj.setQuant(Integer.parseInt(up.getForm().get("txtQuant").toString()));
            if (up.getForm().get("txtDestaque") != null) {
                obj.setDestaque(true);
            } else {
                obj.setDestaque(false);
            }
            categoria.setCodigo(Integer.parseInt(up.getForm().get("selCategoria").toString()));
            obj.setCodcategoria(categoria);
            marca.setCodigo(Integer.parseInt(up.getForm().get("selMarca").toString()));
            obj.setCodmarca(marca);

            if (!up.getFiles().isEmpty()) {
                if (up.getFiles().size() > 0) {
                    obj.setImagem1(up.getFiles().get(0));
                    if (up.getFiles().size() > 1) {
                        obj.setImagem2(up.getFiles().get(1));
                        if (up.getFiles().size() > 2) {
                            obj.setImagem3(up.getFiles().get(2));
                        }
                    }
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
                <i class="fa fa-file"></i> Aqui vai o conteúdo de apresentação
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <div class="panel-heading">
            Produto
        </div>
        <div class="panel-body">
            <form action="#" method="post" enctype="multipart/form-data">

                <div class="col-lg-6">

                    <div class="form-group">
                        <label>Título</label>
                        <input class="form-control" type="text" name="txtTitulo" required />
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input class="form-control" type="text" name="txtDescricao" required />
                    </div>
                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="text" name="txtPreco" required />
                    </div>
                    <div class="form-group">
                        <label>Quantidade</label>
                        <input class="form-control" type="text" name="txtQuant" required />
                    </div>
                    <div class="form-group">
                        <label>Destaque</label>
                        <input class="form-control" type="checkbox" name="txtDestaque" />
                    </div>
                    <div class="form-group">
                        <label>Categoria</label>
                        <select name ="selCategoria" class="form-control"> 
                            <option>Selecione</option>
                            <%                               
                                for (Categoria cat : cLista) {
                            %>
                            <option value="<%=cat.getCodigo()%>" ><%=cat.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <div class="form-group">
                        <label>Marca</label>
                        <select name ="selMarca" class="form-control"> 
                            <option>Selecione</option>
                            <%
                                for (Marca mar : mLista) {
                            %>
                            <option value="<%=mar.getCodigo()%>" ><%=mar.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <div class="form-group">
                        <label>Imagem 1</label>
                        <input class="form-control" type="file" name="txtImg1" />
                    </div>
                    <div class="form-group">
                        <label>Imagem 2</label>
                        <input class="form-control" type="file" name="txtImg2" />
                    </div>
                    <div class="form-group">
                        <label>Imagem 3</label>
                        <input class="form-control" type="file" name="txtImg3" />
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>

            </form>

        </div>

    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>