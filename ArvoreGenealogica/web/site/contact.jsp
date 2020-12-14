<%@include file="cabecalho.jsp"%>
<%@page import="util.EnviarEmail"%>
<%
    String mensagemUsuario = null;

    if (request.getMethod().equals("POST") && request.getParameter("txtNome") != null && request.getParameter("txtMensagem") != null && request.getParameter("txtRemetente") != null) {
        EnviarEmail enviar = new EnviarEmail();
        enviar.setEmailDestinatario("icarocrespo@gmail.com");
        enviar.setAssunto("Contato - Árvore Genealógica");
        //uso StringBuffer para otimizar a concatenação de string
        StringBuffer texto = new StringBuffer();
        texto.append("<h2 align='center'>Árvore Genealógica</h2>");
        texto.append("Informações: <br/>");
        texto.append("Nome Contato: ");
        texto.append(request.getParameter("txtNome"));
        texto.append("<br/>");
        texto.append("Email Contato: ");
        texto.append(request.getParameter("txtRemetente"));
        texto.append("<br/>");
        texto.append("Mensagem: ");
        texto.append(request.getParameter("txtMensagem"));
        enviar.setMsg(texto.toString());

        boolean enviou = enviar.enviarGmail();
        if (enviou) {
            mensagemUsuario = "Mensagem enviada com sucesso!";
        } else {
            mensagemUsuario = "Não foi possível enviar a mensagem!";
        }
}
%>
        <div class="content">
            <!--start-contact-->
            <!--contact-->
            <div class="content">
                <div class="contact">
                    <div class="container">
                        <h2>Fale conosco</h2><br><br>
                        <div class="contact-grids">
                            <div class="col-md-6 contact-left">
                                <p>Envie informações para cadastro via e-mail também!</p>
                                <p>Sinta-se livre para fazer reclamações ou sugestões também.</p>
                                <p>Estamos sempre melhorando a sua experência de compra conosco.</p><br><br>
                                    <%
                                        if(mensagemUsuario != null){
                                    %>
                                    <p><%=mensagemUsuario%></p>
                                    <%
                                        }
                                    %>
                            </div>
                            <div class="col-md-6 contact-right">
                                <form action="#" method="post">
                                    <h5>Nome</h5>
                                    <input type="text" name="txtNome">
                                    <h5>Endereço de Email</h5>
                                    <input type="text" name="txtRemetente">
                                    <h5>Mensagem</h5>
                                    <textarea name="txtMensagem"></textarea>
                                    <input type="submit" value="Enviar">
                                </form>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@include file="rodape.jsp"%>
