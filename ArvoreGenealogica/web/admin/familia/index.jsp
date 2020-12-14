<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
<%@page import="dao.PessoaDAO"%>
<%@page import="model.Pessoa"%>
<%@include file="../cabecalho.jsp" %>
<%    PessoaDAO dao = new PessoaDAO();
    List<Pessoa> lista = dao.listar();
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    
    if (request.getParameter("codigo") != null) {
        Pessoa obj = dao.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("codigo")));
        dao.excluir(obj);
    }
    if (request.getParameter("txtFiltro") != null) {
        lista = dao.listar(request.getParameter("txtFiltro"));
    } else {
        lista = dao.listar();
    }

    Pessoa pai = null;
    Pessoa mae = null;
    List<Pessoa> irmaos = null;
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
                            <th>Data nascimento</th>
                            <th>Data óbito</th>
                            <th>Local nascimento</th>
                            <th>Local óbito</th>
                            <th>Ações</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String data_nasc = "Não informado", data_obito = "Não informado";
                            String local_nasc = "Não informado", local_obito = "Não informado";
                            for (Pessoa item : lista) {
                                if(item.getDataNasc() != null){
                                    data_nasc = df.format(item.getDataNasc());
                                }
                                if(item.getDataObito()!= null){
                                    data_obito = df.format(item.getDataObito());
                                }
                                if(item.getLocalNasc()!= null){
                                    local_nasc = item.getLocalNasc().getCidade();
                                }
                                if(item.getLocalObito()!= null){
                                    local_obito = item.getLocalObito().getCidade();
                                }
                        %>
                        <tr>
                            <td><%=item.getId()%></td>
                            <td><%=item.getNome()%></td>
                            <%
                                if (item.getPai() != null) {
                            %>
                            <td<%=item.getPai().getNome()%>></td>
                            <%
                            } else {
                            %>
                            <td>Não informado</td>
                            <%
                                }
                                if (item.getMae() != null) {
                            %>
                            <td<%=item.getMae().getNome()%>></td>
                            <%
                            } else {
                            %>
                            <td>Não informado</td>
                            <%
                                }
                            %>
                            <td><%=data_nasc%></td>
                            <td><%=data_obito%></td>
                            <td><%=local_nasc%></td>
                            <td><%=local_obito%></td>
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
