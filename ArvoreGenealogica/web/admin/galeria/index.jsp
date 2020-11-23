<%@page import="model.Pessoa"%>
<%@page import="dao.PessoaDAO"%>
<%@page import="model.Foto"%>
<%@page import="dao.FotoDAO"%>
<%@page import="java.util.List"%>
<%@page import="dao.GaleriaDAO"%>
<%@page import="model.Galeria"%>
<%@include file="../cabecalho.jsp" %>
<%    
    GaleriaDAO dao = new GaleriaDAO();
    List<Galeria> lista = dao.listar();
    if (request.getParameter("codigo") != null) {
        Galeria obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
    
    FotoDAO fdao = new FotoDAO();
    List<Foto> listaFoto;
    
    PessoaDAO pdao = new PessoaDAO();
    List<Pessoa> listaPessoa;
    

%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Usuários
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
                            <th>Id</th>
                            <th>Login</th>
                            <th>Senha</th>
                            <th>Admin</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Galeria item : lista) {
                        %>
                        <tr>
                            <td><%=item.getGaleriaPK()%></td>
                            
                            <td><a href="upd.jsp?codigo=<%=item.getGaleriaPK()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo =<%=item.getGaleriaPK()%>">Excluir</button>
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
