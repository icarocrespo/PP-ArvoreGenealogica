<%@page import="util.Criptografia"%>
<%@page import="modelo.Cliente"%>
<%@page import="dao.ClienteDAO"%>
<%@include file="cabecalho.jsp" %>
<%   
    if (request.getMethod().equals("POST")) {
        ClienteDAO dao = new ClienteDAO();
        List<Cliente> cliente = dao.listar();
        
        for (Cliente item : cliente) {
            if (request.getParameter("txtEmail").equals(item.getEmail()) && Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")).equals(item.getSenha())) {
               session.setAttribute("cliente", item);
               response.sendRedirect("index.jsp");
            }
        }
    }
%>
        <div class="content">
            <div class="main-1">
                <div class="container">
                    <div class="login-page">
                        <div class="account_grid">
                            <div class="col-md-6 login-left">
                                <h3>Novos Clientes</h3>
                                <p>Ao criar uma conta em nossa loja, você será capaz de fazer compras, receber novidades, obter cupons de disconto, entre outras novidades.</p>
                                <a class="acount-btn" href="account.jsp">Criar uma conta</a><br><br>
                                <%
                                    if(request.getParameter("texto") != null && request.getParameter("texto").equals("true")){
                                %>
                                <h3>Para finalizar um pedido por favor logue-se.</h3>
                                <%
                                    }
                                %>
                            </div>
                            <div class="col-md-6 login-right">
                                <h3>Registro de Clientes</h3>
                                <p>Se você já possuir uma conta conosco, por favor logue-se.</p>
                                <form action="#" method="post">
                                    <div>
                                        <span>Email<label>*</label></span>
                                        <input type="text" name="txtEmail"> 
                                    </div>
                                    <div>
                                        <span>Senha<label>*</label></span>
                                        <input type="password" name="txtSenha">Esqueceu sua senha? <a class="forgot" href="#">Clique aqui</a>
                                    </div>
                                    <input type="submit" value="Enviar">
                                </form>
                            </div>	
                            <div class="clearfix"> </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
<%@include file="rodape.jsp" %>

