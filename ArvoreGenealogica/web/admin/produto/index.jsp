<%@page import="java.util.List"%>
<%@page import="dao.ProdutoDAO"%>
<%@page import="modelo.Produto"%>
<%@include file="../cabecalho.jsp" %>
<%
    ProdutoDAO dao = new ProdutoDAO();
    List<Produto> lista = dao.listar();

    if (request.getParameter("codigo") != null) {
        Produto obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Produtos
        </h1>
        <ol class="breadcrumb">
            <li>
                <i class="fa fa-dashboard"></i>  <a href="index.jsp">listagem</a>
            </li>
            <li class="active">
                <i class="fa fa-file"></i> listagem de registros
            </li>
        </ol>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">

        <div class="panel-body">
            <a  href="add.jsp" class="btn  btn-primary btn-sm fa fa-plus-square-o" >Novo</a>
        </div>
    </div>
</div>
<!-- /.row -->
<div class="row">
    <div class="panel panel-default">
        <form action="#" method="post">
            <div class="form-group input-group">
                <input type="text" class="form-control" name="txtFiltro" placeholder="digite...">
                <span class="input-group-btn"><button class="btn btn-default" type="submit"><i class="fa fa-search"></i></button></span>
            </div>
        </form>
        <div class="panel-body">
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th>Código</th>
                            <th>Título</th>
                            <th>Descrição</th>
                            <th>Quantidade</th>
                            <th>Preço</th>
                            <th>Destaque</th>
                            <th>Imagem 1</th>
                            <th>Imagem 2</th>
                            <th>Imagem 3</th>
                            <th>Categoria</th>
                            <th>Marca</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Produto item : lista) {
                                String destaque;
                                if (item.getDestaque() == false) {
                                    destaque = "Não";
                                } else {
                                    destaque = "Sim";
                                }
                        %>
                        <tr>
                            <td><%=item.getCodigo()%></td>
                            <td><%=item.getTitulo()%></td>
                            <td><%=item.getDescricao()%></td>
                            <td><%=item.getQuant()%></td>
                            <td><%=item.getPreco()%></td>
                            <td><%=destaque%></td>
                            <%if (item.getImagem1() != null) {%>
                            <td><img src="../../fotos/<%=item.getImagem1()%>" width="40" height="50" /></td>
                                <%} else {%>
                            <td> </td>
                            <%}%>
                            <%if (item.getImagem2() != null) {%>
                            <td><img src="../../fotos/<%=item.getImagem2()%>" width="40" height="50" /></td>
                                <%} else {%>
                            <td> </td>
                            <%}%>
                            <%if (item.getImagem3() != null) {%>
                            <td><img src="../../fotos/<%=item.getImagem3()%>" width="40" height="50" /></td>
                                <%} else {%>
                            <td> </td>
                            <%}%>

                            <td><%=item.getCodcategoria()%></td>
                            <td><%=item.getCodmarca()%></td>


                            <td><a href="upd.jsp?codigo=<%=item.getCodigo()%>" class="btn  btn-primary btn-sm">Alterar</a>
                            <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo=<%=item.getCodigo()%>">Excluir</button>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>
                <!-- /.table-responsive -->
            </div>
        </div>
        <!-- /.panel-body -->
    </div>
    <!-- /.panel -->
</div>
<%@include file="../modalexcluir.jsp" %>                        
<%@include file="../rodape.jsp" %>
