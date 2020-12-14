<%@page import="java.text.SimpleDateFormat"%>
<%@include file="cabecalho.jsp"%>
<%    Pessoa obj = null;
    Pessoa mae = null;
    Pessoa pai = null;
//    List<Pessoa> irmaos = null;
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    String data_nasc = "";
    String data_obito = "";

    if (request.getParameter("id") != null) {
        try {
            obj = pessoaDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            mae = pessoaDAO.buscarPorChavePrimaria(obj.getMae().getId());
            pai = pessoaDAO.buscarPorChavePrimaria(obj.getPai().getId());
            //irmaos.add(obj.getIrmao());
            data_nasc = df.format(obj.getDataNasc());
            data_obito = df.format(obj.getDataObito());

        } catch (Exception e) {
        }

    } else {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<div class="content">
    <div class="single">
        <div class="container">
            <div class="single-grids">

                <div class="col-md-4 single-grid1">
                    <h2>Informações</h2>
                    <ul>
                        <%
                            if (mae != null) {
                        %>
                        <li>Mãe: <a href="single.jsp?id=<%=mae.getId()%>"><%=mae.getNome()%></a></li>
                            <%
                            } else {
                            %>
                        <li>Mãe: não há registro</li>
                            <%
                                }
                                if (pai != null) {
                            %>
                        <li>Pai <a href="single.jsp?id=<%=pai.getId()%>"><%=pai.getNome()%></a></li>
                            <%
                            } else {
                            %>
                        <li>Pai: não há registro</li>
                            <%
                                }
                            %>
                        <li>Títulos: <%=obj.getTitulos()%></li>
                            <%if (obj.getEscolaridade() != null) {%>
                        <li>Escolaridade: <%=obj.getEscolaridade().getGrau()%></li>
                            <%
                            } else {
                            %>
                        <li>Escolaridade: Não ha registro.</li>
                            <%
                                }
                            %>
                        <li>Origem: <%=obj.getOrigem()%></li>
                        <li>Profissão: <%=obj.getProfissao()%></li>
                    </ul>
                </div>
                <div class="col-md-4 single-grid">		
                    <div class="flexslider">
                        <ul class="slides">
                            <%
                                if (obj.getUriFoto() != null) {
                            %>
                            <li data-thumb="../fotos/<%=obj.getUriFoto()%>">
                                <div class="thumb-image"> <img src="../fotos/<%=obj.getUriFoto()%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
                            </li>
                            <%
                            } else {
                            %>
                            <p> Não há registro.</p>
                            <%}%>
                        </ul>
                    </div>
                </div>
                <br>
                <div class="col-md-4 single-grid simpleCart_shelfItem">		
                    <h3><%=obj.getNome()%></h3>
                    <%
                        if (obj.getHistoria() != null) {
                    %>
                    <p><%=obj.getHistoria()%>.</p>
                    <%
                    } else {
                    %>
                    <p>Não há história informada.</p>
                    <%}%>
                    <div class="tag">
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <!-- collapse -->
    <div class="collpse">
        <div class="container">
            <div class="col-md-4"></div>
            <div class="panel-group collpse col-md-4" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingOne">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                Nascimento
                            </a>
                        </h4>
                    </div>
                    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                        <div class="panel-body">
                            Data de nascimento: <%=data_nasc%>.<br>
                            <%
                                if (obj.getLocalNasc() != null) {
                            %>
                            Local de nascimento <%=obj.getLocalNasc().getCidade()%>.
                            <%} else {%>
                            Não há informação.
                            <%}%>

                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading" role="tab" id="headingTwo">
                        <h4 class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Óbito
                            </a>
                        </h4>
                    </div>
                    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
                        <div class="panel-body">
                            Data de óbito <%=data_obito%>.<br>
                            <%
                                if (obj.getLocalObito() != null) {
                            %>
                            Local de óbito <%=obj.getLocalObito().getCidade()%>.
                            <%} else {%>
                            Não há informação.
                            <%}%>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- collapse -->
    <div class="clearfix"> </div>
</div>
<%@include file="rodape.jsp"%>