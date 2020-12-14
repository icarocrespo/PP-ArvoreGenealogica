<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Pessoa"%>
<%@page import="java.util.List"%>
<%@page import="dao.PessoaDAO"%>
<%
    PessoaDAO pessoaDAO = new PessoaDAO();
    List<Pessoa> pessoas = pessoaDAO.listar();
    //abaixo é referente à pesquisa
//    
//    Cliente clientee;
//    String nome;
//    if(session.getAttribute("cliente") != null){
//        clientee = (Cliente) session.getAttribute("cliente");
//        nome = clientee.getNome();
//    }else{
//        nome = "Login";
//    }
%>
<html>
    <head>
        <title>Árvore Genealógica</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all"/>
        <link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/owl.carousel.css" rel="stylesheet">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery.min.js"></script>
        <script type="text/javascript" src="js/bootstrap-3.1.1.min.js"></script>
        <!--Parte do Single -->
        <script>
            // Can also be used with $(document).ready()
            $(window).load(function () {
                $('.flexslider').flexslider({
                    animation: "slide",
                    controlNav: "thumbnails"
                });
            });
        </script>        

        <script src="js/jquery.min.js"></script>
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <script src="js/imagezoom.js"></script>
        <!-- FlexSlider -->
        <script defer src="js/jquery.flexslider.js"></script>
        <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <script type="text/javascript" id="sourcecode">
            $(function ()
            {
                $('.scroll-pane').jScrollPane();
            });
        </script>
        <!-- cart -->
        <script src="js/simpleCart.min.js"></script>
        <!-- cart -->
        <!-- the jScrollPane script -->
        <script type="text/javascript" src="js/jquery.jscrollpane.min.js"></script>
        <!-- //the jScrollPane script -->
        <link href="css/form.css" rel="stylesheet" type="text/css" media="all" />
        <!-- the mousewheel plugin -->
        <script type="text/javascript" src="js/jquery.mousewheel.js"></script>
    </head>
    <body>
        <!--header-->
        <div class="header">
            <div class="header-top">
                <div class="container">
                    
                    <div class="top-right">
                        <ul>
                            <li class="text"><a href="login.jsp">Teste</a></li>
                        </ul>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </div>
            <div class="header-bottom">
                <div class="container">
                    <!--/.content-->
                    <div class="content white">
                        <nav class="navbar navbar-default" role="navigation">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                    <span class="sr-only">Toggle navigation</span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                                <h1 class="navbar-brand"><a  href="index.jsp">Árvore Genealógica</a></h1>
                            </div>
                            <!--/.navbar-header-->

                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="nav navbar-nav">
                                    <li class="dropdown">
                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mais frequentes <b class="caret"></b></a>
                                        <ul class="dropdown-menu multi-column columns-1">
                                            <div class="row">
                                                <div class="col-sm-2">
                                                    <ul class="multi-column-dropdown">
                                                        <li><a class="list" href="pessoas.jsp?localidades">Localidades</a></li>
                                                        <li><a class="list" href="pessoas.jsp?escolaridade">Escolaridade</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </ul>
                                    </li>
                                    <li class="dropdown">
                                        <a href="pessoas.jsp" >Pessoas <b class="caret"></b></a>
                                    </li>
                                </ul>
                            </div>
                            <!--/.navbar-collapse-->
                        </nav>
                        <!--/.navbar-->
                    </div>
                    <div class="search-box">
                        <div id="sb-search" class="sb-search">
                            <form action="pessoas.jsp" method="post">
                                <input class="sb-search-input" placeholder="Digite o texto de sua pesquisa..." type="search" name="txtFiltro" id="search">
                                <input class="sb-search-submit" type="submit" value="">
                                <span class="sb-icon-search"> </span>
                            </form>
                        </div>
                    </div>

                    <!-- search-scripts -->
                    <script src="js/classie.js"></script>
                    <script src="js/uisearch.js"></script>
                    <script>
            new UISearch(document.getElementById('sb-search'));
                    </script>
                    <!-- //search-scripts -->
                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!--header-->