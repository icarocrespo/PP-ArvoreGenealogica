<%@include file="cabecalho.jsp"%>
<%    
    
%>

<div class="banner-section">
    <div class="container">
        <div class="banner-grids">
            <div class="col-md-6 banner-grid">
                <h2>Sistema gerenciador de árvore genealógica</h2>
                <!--<p>Trabalho de Práticas de Programação.</p>--><br>
                <a href="pessoas.jsp" class="button"> veja as pessoas </a>
                <a href="addFamiliar.jsp" class="button"> solicite novas pessoas</a>
            </div>
            <div class="col-md-6 banner-grid1">
                <img src="../fotos/arvore.png" class="img-responsive" height="600" width="600" alt=""/><br><br><br><br>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<div class="banner-bottom">
    <div class="gallery-cursual">
        <!--requried-jsfiles-for owl-->
        <script src="js/owl.carousel.js"></script>
        <script>
            $(document).ready(function () {
                $("#owl-demo").owlCarousel({
                    items: 3,
                    lazyLoad: true,
                    autoPlay: true,
                    pagination: false,
                });
            });
        </script>
        <!--requried-jsfiles-for owl -->
        <!--start content-slider-->
        <div id="owl-demo" class="owl-carousel text-center">
            <%
                for (Pessoa item : pessoas) {
                    if(item.getUriFoto() != null){
            %>
            <a href="single.jsp?id=<%=item.getId()%>">
                <div class="item">
                    <img class="lazyOwl" data-src="../fotos/<%=item.getUriFoto()%>" height="100" width="80" alt="">
                    <div class="item-info">
                        <h5><%=item.getNome()%></h5>
                    </div>
                </div>
            </a>
            <%
                }else{
            %>
            <a href="single.jsp?id=<%=item.getId()%>">
                <div class="item">
                    <img class="lazyOwl" data-src="../fotos/arvore.png" alt="">
                    <div class="item-info">
                        <h5><%=item.getNome()%></h5>
                    </div>
                </div>
            </a>
            <%
            }}
            %>
        </div>
        <!--sreen-gallery-cursual-->
    </div>
</div>
<div class="gallery">
    <div class="container">
        
        <div class="gallery-grids">
            
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<%@include file="rodape.jsp"%>
