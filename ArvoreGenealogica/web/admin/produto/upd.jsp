<%@page import="java.math.BigDecimal"%>
<%@page import="modelo.Produto"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="util.Upload"%>
<%@page import="modelo.Marca"%>
<%@page import="dao.MarcaDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CategoriaDAO"%>
<%@page import="modelo.Categoria"%>
<%@include file="../cabecalho.jsp" %>
<%
    CategoriaDAO cDAO = new CategoriaDAO();
    List<Categoria> cLista = cDAO.listar();

    MarcaDAO mDAO = new MarcaDAO();
    List<Marca> mLista = mDAO.listar();

    ProdutoDAO dao = new ProdutoDAO();
    Produto obj = new Produto();
    Upload up = new Upload();
    up.setFolderUpload("fotos");
    if (request.getMethod().equals("POST")) {
        if (up.formProcess(getServletContext(), request)) {

            Categoria categoria = new Categoria();
            Marca marca = new Marca();

            obj.setCodigo(Integer.parseInt(up.getForm().get("txtCodigo").toString()));
            obj.setTitulo(up.getForm().get("txtTitulo").toString());
            obj.setDescricao(up.getForm().get("txtDescricao").toString());
            BigDecimal preco = new BigDecimal(up.getForm().get("txtPreco").toString());
            obj.setPreco(preco);
            obj.setQuant(Integer.parseInt(up.getForm().get("txtQuant").toString()));
            if(up.getForm().get("txtDestaque").toString() != null){
                obj.setDestaque(true);
            }else{
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
            dao.alterar(obj);
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
            <form action="#" method="post">

                <div class="col-lg-6">
                    <div class="form-group">
                        <label>Código</label>
                        <input class="form-control" type="text" name="txtCodigo" readonly value="<%=obj.getCodigo()%>" />
                    </div>
                    <div class="form-group">
                        <label>Titulo</label>
                        <input class="form-control" type="text" name="txtTitulo" required value="<%=obj.getTitulo()%>"/>
                    </div>
                    <div class="form-group">
                        <label>Descrição</label>
                        <input class="form-control" type="text" name="txtDescricao" required value="<%=obj.getDescricao()%>" />
                    </div>
                    <div class="form-group">
                        <label>Preço</label>
                        <input class="form-control" type="text" name="txtPreco" required value="<%=obj.getPreco()%>" />
                    </div>
                    <div class="form-group">
                        <label>Quantidade</label>
                        <input class="form-control" type="text" name="txtQuant" required value="<%=obj.getQuant()%>" />
                    </div>
                    <div class="form-group">
                        <label>Destaque</label>
                        <input class="form-control" type="checkbox" name="txtDestaque" value="<%=obj.getDestaque()%>" />
                    </div>
                    <div class="form-group">
                        <label>Imagem 1</label>
                        <input class="form-control" type="file" name="txtImg1" required />
                    </div>
                    <div class="form-group">
                        <label>Imagem 2</label>
                        <input class="form-control" type="file" name="txtImg2" />
                    </div>
                    <div class="form-group">
                        <label>Imagem 3</label>
                        <input class="form-control" type="file" name="txtImg3" />
                    </div>
                    <div class="form-group">
                        <label>Categoria</label>
                        <select name ="selCategoria"> 
                            <%
                                String marcadoC;
                                for (Categoria cat : cLista) {
                                    if (cat.getCodigo() == obj.getCodcategoria().getCodigo()) {
                                        marcadoC = "selected";
                                    } else {
                                        marcadoC = "";
                                    }
                            %>
                            <option value="<%=cat.getCodigo()%>"<%=marcadoC%>><%=cat.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>
                    <div class="form-group">
                        <label>Marca</label>
                        <select name ="selMarca"> 
                            <%
                                String marcadoM;
                                for (Marca mar : mLista) {
                                    if (mar.getCodigo() == obj.getCodmarca().getCodigo()) {
                                        marcadoM = "selected";
                                    } else {
                                        marcadoM = "";
                                    }
                            %>
                            <option value="<%=mar.getCodigo()%>"<%=marcadoM%>><%=mar.getNome()%></option>
                            <%
                                }
                            %>
                        </select> <br /> 
                    </div>

                    <button class="btn btn-primary btn-sm" type="submit">Salvar</button>
            </form>
        </div>
    </div>
</div>
<!-- /.row -->
<%@include file="../rodape.jsp" %>