<%@page import="dao.FamiliaDAO"%>
<%@page import="model.Familia"%>
<%@include file="cabecalho.jsp"%>

<%    
    FamiliaDAO familiaDAO = new FamiliaDAO();
    Familia obj = null;
    
    if (request.getParameter("id") != null) {
        try {
            obj = familiaDAO.buscarPorChavePrimaria(Integer.parseInt(request.getParameter("id")));
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
                        
                        <li>Nome da família: <%=obj.getNome()%></li>
                        <li>Quantidade de membros: <%=obj.getMembros()%></li>
                    </ul>
                </div>
                <div class="col-md-4 single-grid">		
                    <div class="flexslider">
                        <ul class="slides">
                            <%
                                if (obj.getUriBrasao() != null) {
                            %>
                            <li data-thumb="../fotos/<%=obj.getUriBrasao()%>">
                                <div class="thumb-image"> <img src="../fotos/<%=obj.getUriBrasao()%>" data-imagezoom="true" class="img-responsive" alt=""> </div>
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
                    <h3>Sobre a família <%=obj.getNome()%></h3>
                    <%
                        if (obj.getHistoria() != null) {
                    %>
                    <p align="justify"><%=obj.getHistoria()%>.</p>
                    <%
                    } else {
                    %>
                    <p align="justify">Não há história informada.</p>
                    <%}%>
                    <div class="tag">
                    </div>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    
    <div class="clearfix"> </div>
</div>
<%@include file="rodape.jsp"%>