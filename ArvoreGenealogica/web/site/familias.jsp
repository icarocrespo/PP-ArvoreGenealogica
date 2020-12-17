<%@page import="java.util.List"%>
<%@page import="dao.FamiliaDAO"%>
<%@page import="model.Familia"%>
<%@include file="cabecalho.jsp"%>

<%
    FamiliaDAO familiaDAO = new FamiliaDAO();

    List<Familia> familias;

    if (request.getParameter("codigo") != null) {
        familias = familiaDAO.listar(request.getParameter("codigo"));
    } else {
        familias = familiaDAO.listar();
    }
%>
<div class="content">
    <div class="product-model">	 
        <div class="container">
            <h2>Famílias cadastradas no sistema</h2>			
            <div class="col-md-12 product-model-sec">
                <%
                    if (!familias.isEmpty()) {
                        for (Familia item : familias) {
                %>
                <a href="sobreFamilia.jsp?id=<%=item.getId()%>">
                    <div class="product-grid">
                        <div class="more-product"><span> </span></div>						
                        <div class="product-img b-link-stripe b-animate-go  thickbox">
                            <%if (item.getUriBrasao() != null) {%>
                            <img src="../fotos/<%=item.getUriBrasao()%>" class="img-responsive" alt=""/>
                            <%
                            } else {
                            %>
                            <img src="" class="img-responsive" alt=""/>
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
<%@include file="rodape.jsp"%>