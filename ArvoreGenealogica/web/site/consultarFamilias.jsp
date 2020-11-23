<%@page import="model.Pessoa"%>
<%@page import="java.util.List"%>
<%@page import="dao.PessoaDAO"%>
<%
    PessoaDAO pdao = new PessoaDAO();
    List<Pessoa> listaPessoa;
    
    if(request.getParameter("txtFiltro") != null){
        listaPessoa = pdao.listar("txtFiltro");
    }else{
        listaPessoa = pdao.listar();
    }
    
    
%>

<html>
    <head>
        <title>Árvore Genealógica</title>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <meta name="description" content="" />
        <meta name="keywords" content="" />
        <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,900' rel='stylesheet' type='text/css'>
        <!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
        <script src="js/skel.min.js"></script>
        <script src="js/skel-panels.min.js"></script>
        <script src="js/init.js"></script>
        <noscript>
        <link rel="stylesheet" href="css/skel-noscript.css" />
        <link rel="stylesheet" href="css/style.css" />
        </noscript>
        <!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
        <!--[if lte IE 9]><link rel="stylesheet" href="css/ie/v9.css" /><![endif]-->
    </head>
    <body>
        <div id="wrapper">

            <!-- Header -->
            <div id="header">
                <div class="container"> 

                    <!-- Logo -->
                    <div id="logo">
                        <h1><a href="index.jsp">Árvore Genealógica</a></h1>
                    </div>

                    <!-- Nav -->
                    <nav id="nav">
                        <ul>
                            <li><a href="index.jsp">Home</a></li>
                            <li class="active"><a href="consultarFamilias.jsp">Consulte famílias</a></li>
                            <li><a href="familias.jsp">Gerencie famílias</a></li>
                            <li><a href="familiares.jsp">Gerencie familiares</a></li>
                        </ul>
                    </nav>
                </div>
            </div>

            <!-- Footer -->
            <div id="footer">
                <div class="container">
                    <div class="row">
                        <div class="8u">
                            <section id="box2">
                                <header>
                                    <h2>Familias</h2>
                                </header>
                                <div> <a href="#" class="image full"><img src="images/pics02.jpg" alt=""></a> </div>
                                <p>Nulla enim eros, porttitor eu, tempus id, varius non, nibh. Duis enim nulla, luctus eu, dapibus lacinia, venenatis id, quam. Vestibulum imperdiet, magna nec eleifend rutrum, nunc lectus vestibulum velit, euismod lacinia quam nisl id lorem. Quisque erat. Vestibulum pellentesque, justo mollis pretium suscipit, justo nulla blandit libero, in blandit augue justo quis nisl.</p>
                            </section>
                        </div>
                        <div class="4u">
                            <section id="box3">
                                <header>
                                    <h2>Pesquise aqui</h2>
                                </header>
                                <form class="form" action="#" method="post">
                                    <div>
                                        <input type="text" name="txtFiltro" placeholder="digite...">
                                        <span><button class="button" type="submit"><i class="fa fa-search"></i></button></span>
                                    </div>
                                </form>
                            </section>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Copyright -->
            <div id="copyright">
                <div class="container">
                    Design: <a href="http://templated.co">TEMPLATED</a> Images: <a href="http://unsplash.com">Unsplash</a> (<a href="http://unsplash.com/cc0">CC0</a>)
                </div>
            </div>

        </div>
    </body>
</html>