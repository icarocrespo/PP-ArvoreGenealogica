<%@page import="util.Criptografia"%>
<%@page import="dao.ClienteDAO"%>
<%@page import="modelo.Cliente"%>
<%@include file="cabecalho.jsp" %>
<%    
    ClienteDAO dao = new ClienteDAO();
    Cliente obj = new Cliente();
    List<Cliente> clientes = dao.listar();

    boolean achou = false;
    if (clientes.isEmpty()) {
        for (Cliente item : clientes) {
            if (request.getParameter("txtEmail").equals(item.getEmail())) {
                achou = true;
            }
        }
    }
    int a = 0;
    if(request.getMethod().equals("POST") && !achou && request.getParameter("txtNome") != null && request.getParameter("txtSenha") != null && request.getParameter("txtEmail") != null && request.getParameter("txtSenhaConfirm") != null && request.getParameter("txtUF") != null && request.getParameter("txtCEP") != null && request.getParameter("txtEndereco") != null){
        obj.setNome(request.getParameter("txtNome"));
        obj.setEmail(request.getParameter("txtEmail"));
        if (request.getParameter("txtSenha").equals(request.getParameter("txtSenhaConfirm"))) {
            obj.setSenha(Criptografia.convertPasswordToMD5(request.getParameter("txtSenha")));
        }
        obj.setBairro(request.getParameter("txtBairro"));
        obj.setCidade(request.getParameter("txtCidade"));
        obj.setEstado(request.getParameter("txtUF"));
        obj.setCep(request.getParameter("txtCEP"));
        obj.setEndereco(request.getParameter("txtEndereco"));
        dao.incluir(obj);
        session.setAttribute("cliente", obj);
        response.sendRedirect("index.jsp");
    }else{
        a = 1;
    }
%>
<div class="content">
    <!-- registration -->
    <div class="main-1">
        <div class="container">
            <div class="register">
                <form action="#" method="post"> 
                    <div class="register-top-grid">
                        <h3>Informações de Usuário<br><br>
                        <%
                            if(a == 1){
                        %>
                            Por favor insira dados em todos os campos.
                        <%
                            }
                        %>
                        </h3>
                        <div class="wow fadeInLeft" data-wow-delay="0.4s">
                            <span>Nome<label>*</label></span>
                            <input type="text" name="txtNome"> 
                        </div>
                        <%
                            if (achou) {
                        %>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Email<label>*</label></span>
                            <input type="text" name="txtEmail" value="Email já cadastrado"> 
                        </div>
                        <%
                        } else {
                        %>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>E-mail<label>*</label></span>
                            <input type="text" name="txtEmail" value=""> 
                        </div>
                        <%
                            }
                        %>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Senha<label>*</label></span>
                            <input type="password" name="txtSenha"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Endereço<label>*</label></span>
                            <input type="text" name="txtEndereco"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Bairro<label>*</label></span>
                            <input type="text" name="txtBairro"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Cidade<label>*</label></span>
                            <input type="text" name="txtCidade"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>UF<label>*</label></span>
                            <input type="text" maxlength="2" name="txtUF"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>CEP<label>*</label></span>
                            <input type="number"  max="9" name="txtCEP"> 
                        </div>
                        <div class="wow fadeInRight" data-wow-delay="0.4s">
                            <span>Confirmar Senha<label></label></span>
                            <input type="password" name="txtSenhaConfirm">
                        </div>
                    </div>
                    <div class="register-but">
                        <button class="btn btn-primary btn-sm" type="submit">Enviar</button>
                        <div class="clearfix"> </div>
                    </div>    
                </form>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
    <!-- registration -->
</div>
<%@include file="rodape.jsp" %>