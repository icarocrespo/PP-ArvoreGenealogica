<%@page import="java.util.List"%>
<%@page import="dao.PessoaDAO"%>
<%@page import="model.Pessoa"%>
<%@include file="../cabecalho.jsp" %>
<%    
    PessoaDAO dao = new PessoaDAO();
    List<Pessoa> lista = dao.listar();

    if (request.getParameter("codigo") != null) {
        Pessoa obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }
    
    Pessoa pai;
    Pessoa mae;
    List <Pessoa> irmaos;
%>

<div class="row">
    <div class="col-lg-12">
        <h1 class="page-header">
            Gerenciamento de Famílias
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
                            <th>Nome</th>
                            <th>Pai</th>
                            <th>Mãe</th>
                            <th>Irmãos</th>
                            <th>Data nascimento</th>
                            <th>Data óbito</th>
                            <th>Local nascimento</th>
                            <th>Local óbito</th>
                            <th>Escolaridade</th>
                            <th>Títulos</th>
                            <th>História</th>
                            <th>Origem</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (Pessoa item : lista) {
                        %>
                        <tr>
                            <td><%=item.getId()%></td>
                            <td><%=item.getNome()%></td>
                            <td<%=item.getPai().getNome()%>></td>
                            <td<%=item.getMae().getNome()%>></td>
                            <%
                                for(Pessoa irmao: item.getPessoaList()){
                            %>
                            <td<%=irmao.getNome()%>></td>
                            <%
                            }
                            %>
                            <td<%=item.getDataNasc()%>></td>
                            <td<%=item.getDataObito()%>></td>
                            <td<%=item.getLocalNasc()%>></td>
                            <td<%=item.getLocalObito()%>></td>
                            <td<%=item.getEscolaridade()%>></td>
                            <td<%=item.getTitulos()%>></td>
                            <td<%=item.getHistoria()%>></td>
                            <td<%=item.getOrigem()%>></td>
                            <td><a href="upd.jsp?codigo=<%=item.getId()%>" class="btn  btn-primary btn-sm">Alterar</a>
                                <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#myModal" onclick="codigo =<%=item.getId()%>">Excluir</button>
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
