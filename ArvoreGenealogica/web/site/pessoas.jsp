<%@page import="java.text.SimpleDateFormat"%>
<%@include file="cabecalho.jsp"%>
<%    if (request.getParameter("txtFiltro") != null) {
        pessoas = pessoaDAO.listar("txtFiltro");
    }
%>
<div class="content">
    <div class="product-model">	 
        <div class="container">
            <h2>Pessoas cadastradas no sistema</h2>			
            <div class="col-md-12 product-model-sec">
                <%
                    
                    if (!pessoas.isEmpty()) {
                        for (Pessoa item : pessoas) {
                            String data_nasc = "Não informada";
                            SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
                            try {
                                data_nasc = df.format(item.getDataNasc());
                            } catch (Exception e) {

                            }

                %>
                <a href="single.jsp?id=<%=item.getId()%>">
                    <div class="product-grid">
                        <div class="more-product"><span> </span></div>						
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <%if (item.getUriFoto() != null) {%>
                            <img src="../fotos/<%=item.getUriFoto()%>" class="img-responsive" alt=""/>
                            <%
                            } else {
                            %>
                            <img src="../fotos/arvore.png" class="img-responsive" alt=""/>
                            <%}%>
                            <div class="b-wrapper">
                                <h4 class="b-animate b-from-left  b-delay03">							
                                    <button> > </button>
                                </h4>
                            </div>
                            <!--</div>
                        </div>-->
                        </div>
                </a>					
                <div class="product-info simpleCart_shelfItem">
                    <div class="product-info-cust prt_name">
                        <h4><%=item.getNome()%></h4>								
                        <div class="ofr">
                            <p class="pric1"><%=data_nasc%></p><br>

                        </div>

                        <div class="clearfix"> </div>
                    </div>												
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p>Desculpe, não encontramos registros.</p>
            <%
                }
            %>
        </div>	
    </div>
</div>
</div>
<!---->
<%@include file="rodape.jsp"%>
