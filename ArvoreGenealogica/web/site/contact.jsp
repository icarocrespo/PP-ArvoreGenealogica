<%@include file="cabecalho.jsp"%>
<%@page import="util.EnviarEmail"%>
<%
    String mensagemUsuario = null;

    if (request.getMethod().equals("POST") && request.getParameter("txtNome") != null && request.getParameter("txtMensagem") != null && request.getParameter("txtRemetente") != null) {
        EnviarEmail enviar = new EnviarEmail();
        enviar.setEmailDestinatario("icarocrespo@gmail.com");
        enviar.setAssunto("Contato - Bom Coffee");
        //uso StringBuffer para otimizar a concatenação de string
        StringBuffer texto = new StringBuffer();
        texto.append("<h2 align='center'>BomCoffee</h2>");
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
                        <!--<div class="google-map">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d424396.3176723366!2d150.92243255000002!3d-33.7969235!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b129838f39a743f%3A0x3017d681632a850!2sSydney+NSW%2C+Australia!5e0!3m2!1sen!2sin!4v1431587453420"></iframe>
                        </div>-->
                        <div class="contact-grids">
                            <div class="col-md-6 contact-left">
                                <p>Sinta se livre para fazer reclamações ou sugestões.</p>
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
