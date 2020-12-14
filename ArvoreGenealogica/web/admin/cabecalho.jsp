<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("../login.jsp");
        return;
    }
%>
<html lang="pt-br">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="�caro Crespo">

        <title>Sistema de �rvore Geneal�gica</title>

        <!-- Bootstrap Core CSS -->
        <link href="../css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="../css/sb-admin.css" rel="stylesheet">

        <!-- Custom Fonts -->
        <link href="../font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
    <body>

        <div id="wrapper">

            <!-- Navigation -->
            <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="../home">
                        �rea Administrativa
                    </a>
                </div>
                <!-- Top Menu Items -->
                <ul class="nav navbar-right top-nav">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> <%=session.getAttribute("usuario")%> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="../usuario/index.jsp"><i class="fa fa-fw fa-user"></i> Perfil</a>
                            </li>
                            <li>
                                <a href="#"><i class="fa fa-fw fa-envelope"></i> Inbox</a>
                            </li>
                            <li>
                                <a href="../usuario/index.jsp"><i class="fa fa-fw fa-gear"></i> Configura��es</a>
                            </li>
                            <li class="divider"></li>
                            <li>
                                <a href="../sair.jsp"><i class="fa fa-fw fa-power-off"></i> Sair</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
                <div class="collapse navbar-collapse navbar-ex1-collapse">
                    <ul class="nav navbar-nav side-nav">
                        <li>
                            <a href="../familia/"><i class="fa fa-fw fa-edit"></i> Fam�lias</a>
                        </li>
                        <li>
                            <a href="../localidades/"><i class="fa fa-fw fa-edit"></i> Localidades</a>
                        </li>
                        <li>
                            <a href="../escolaridades/"><i class="fa fa-fw fa-edit"></i> Escolaridades</a>
                        </li>
                        <li>
                            <a href="../usuario/"><i class="fa fa-fw fa-edit"></i> Usu�rio</a>
                        </li>
                        <li>
                            <a target="_blank" href="http://github.com/icarocrespo">Desenvolvido por �caro Crespo</a>
                        </li>
                    </ul>
                    
                </div>
                <!-- /.navbar-collapse -->
            </nav>
                        
            <div id="page-wrapper">

                <div class="container-fluid">

                    <!-- Page Heading -->
