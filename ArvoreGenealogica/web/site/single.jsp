<%@page import="java.text.SimpleDateFormat"%>
<%@include file="cabecalho.jsp"%>
<%    Pessoa obj = null;
    Pessoa mae = null;
    Pessoa pai = null;
    List<Pessoa> irmaos = null;
    SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
    if (request.getParameter("id") != null) {
        try {
            obj = pessoaDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
            mae = obj.getMae();
            pai = obj.getPai();
            irmaos.add(obj.getIrmao());
            
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
                        <li>Escolaridade: <%=obj.getEscolaridade()%></li>
                        <li>Origem: <%=obj.getOrigem()%></li>
                        <li>Profissão: <%=obj.getProfissao()%></li>
                    </ul>
                </div>
                <div class="col-md-4 single-grid">		
                    <div class="flexslider">
                        <ul class="slides">
                            <li data-thumb="../fotos/arvore.png">
                                <div class="thumb-image"> <img src="../fotos/arvore.png" data-imagezoom="true" class="img-responsive" alt=""> </div>
                            </li>
                        </ul>
                    </div>
                </div>	
                <div class="col-md-4 single-grid simpleCart_shelfItem">		
                    <h3><%=obj.getNome()%></h3>
                    <p><%=obj.getHistoria()%>.</p>

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
                            Data de nascimento: <%=df.format(obj.getDataNasc())%>.<br>
                            Local de nascimento: <%=obj.getLocalNasc()%>.
                            
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
                            Data de óbito <%=df.format(obj.getDataNasc())%>.<br>
                            Local de óbito <%=obj.getLocalNasc()%>.
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