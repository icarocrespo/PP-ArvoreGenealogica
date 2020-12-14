<%@page import="model.Localidade"%>
<%@page import="dao.LocalidadeDAO"%>
<%@page import="dao.EscolaridadeDAO"%>
<%@page import="model.Escolaridade"%>
<%@page import="util.Upload"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@include file="cabecalho.jsp"%>
<%    String msg = null;
    PessoaDAO dao = new PessoaDAO();
    List<Pessoa> pais = dao.listar();
    List<Pessoa> maes = dao.listar();

    EscolaridadeDAO escDAO = new EscolaridadeDAO();
    List<Escolaridade> escolaridades = escDAO.listar();

    LocalidadeDAO locDAO = new LocalidadeDAO();
    List<Localidade> localidades = locDAO.listar();

    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (up.getForm().get("nome").toString() == null) {
                response.sendRedirect("index.jsp");
                return;
            }
            Pessoa obj = new Pessoa();
            Pessoa pai;
            Pessoa mae;

            Escolaridade escolaridade = new Escolaridade();
            Localidade localidade_nasc = new Localidade();
            Localidade localidade_obito = new Localidade();

            if (!up.getForm().get("escolaridade").toString().isEmpty() && !up.getForm().get("escolaridade").toString().equals("Selecione")) {
                escolaridade = escDAO.buscarPorChavePrimaria(Integer.parseInt(up.getForm().get("escolaridade").toString()));
                obj.setEscolaridade(escolaridade);
            }
            if (!up.getForm().get("localidade_nasc").toString().isEmpty() && !up.getForm().get("localidade_nasc").toString().equals("Selecione")) {
                localidade_nasc = locDAO.buscarPorChavePrimaria(Integer.parseInt(up.getForm().get("localidade_nasc").toString()));
                obj.setLocalNasc(localidade_nasc);
            }
            if (!up.getForm().get("localidade_obito").toString().isEmpty() && !up.getForm().get("localidade_obito").toString().equals("Selecione")) {
                localidade_obito = locDAO.buscarPorChavePrimaria(Integer.parseInt(up.getForm().get("localidade_obito").toString()));
                obj.setLocalObito(localidade_obito);

            }
            
            if (!up.getForm().get("mae").toString().isEmpty() && !up.getForm().get("mae").toString().equals("Selecione")) {
                mae = dao.buscarPorChavePrimaria(Integer.parseInt(up.getForm().get("mae").toString()));
                obj.setMae(mae);

            }
             if (!up.getForm().get("pai").toString().isEmpty() && !up.getForm().get("pai").toString().equals("Selecione")) {
                pai = dao.buscarPorChavePrimaria(Integer.parseInt(up.getForm().get("pai").toString()));
                obj.setPai(pai);

            }
            //SimpleDateFormat df = new SimpleDateFormat("dd/MM/yyyy");
             
             
            if (!up.getForm().get("data_nasc").toString().isEmpty()) {
                //obj.setDataNasc(new Date(up.getForm().get("data_nasc").toString().isEmpty()));

            }
            if (!up.getForm().get("data_obito").toString().isEmpty()) {
                //obj.setDataNasc(new Date(up.getForm().get("data_obito").toString()));

            }

            obj.setNome(up.getForm().get("nome").toString());
            obj.setHistoria(up.getForm().get("historia").toString());
            obj.setOrigem(up.getForm().get("origem").toString());
            obj.setProfissao(up.getForm().get("profissao").toString());
            obj.setTitulos(up.getForm().get("titulos").toString());

            if (!up.getFiles().isEmpty()) {
                obj.setUriFoto(up.getFiles().get(0));
            }

            if (dao.incluir(obj)) {
                msg = "Pessoa adicionada com sucesso!";
            }
        }
    }
%>
<div class="content">
    <div class="product-model">
        <%if (msg != null) {%>
        <p>
            <%=msg%></p>
        <%}%>
        <div class="container">
            <h2>Adicionar Familiar</h2>			
            <div class="col-md-12 product-model-sec">
                <div class="panel-body">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                            <input class="form-control" type="file" accept=".jpg, .jpeg, .png" name="foto" />
                        </div>
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Nome</label>
                                <input class="form-control" type="text" name="nome" required/>
                            </div>
                            <div class="form-group">
                                <label>História</label>
                                <textarea class="form-control" name="historia" rows="5" cols="33"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Origem</label>
                                <input class="form-control" type="text" name="origem" />
                            </div>
                            <div class="form-group">
                                <label>Profissão</label>
                                <input class="form-control" type="text" name="profissao" />
                            </div>
                            <div class="form-group">
                                <label>Títulos</label>
                                <input class="form-control" type="text" name="titulos" />
                            </div>
                            <div class="form-group">
                                <label>Data de nascimento</label>
                                <input class="form-control" type="date" name="data_nasc" />
                            </div>
                            <div class="form-group">
                                <label>Data de Óbito</label>
                                <input class="form-control" type="date" name="data_obito" />
                            </div>
                        </div>
                        <div class="col-lg-6">

                            <div class="form-group">
                                <label>Pai</label>
                                <select name ="pai" class="form-control"> 
                                    <option>Selecione</option>
                                    <%
                                        for (Pessoa p : pais) {
                                    %>
                                    <option value="<%=p.getId()%>" ><%=p.getNome()%></option>
                                    <%
                                        }
                                    %>
                                </select> <br /> 
                            </div>
                            <div class="form-group">
                                <label>Mãe</label>
                                <select name ="mae" class="form-control"> 
                                    <option>Selecione</option>
                                    <%
                                        for (Pessoa m : maes) {
                                    %>
                                    <option value="<%=m.getId()%>" ><%=m.getNome()%></option>
                                    <%
                                        }
                                    %>
                                </select> <br /> 
                            </div>
                            <div class="form-group">
                                <label>Escolaridade</label>
                                <select name ="escolaridade" class="form-control"> 
                                    <option>Selecione</option>
                                    <%
                                        for (Escolaridade esc : escolaridades) {
                                    %>
                                    <option value="<%=esc.getId()%>" ><%=esc.getGrau()%></option>
                                    <%
                                        }
                                    %>
                                </select> <br /> 
                            </div>
                            <div class="form-group">
                                <label>Localidade de nascimento</label>
                                <select name ="localidade_nasc" class="form-control"> 
                                    <option>Selecione</option>
                                    <%
                                        for (Localidade loc : localidades) {
                                            String address = loc.getCidade() + ", " + loc.getEndereco();
                                    %>
                                    <option value="<%=loc.getId()%>" ><%=address%></option>
                                    <%
                                        }
                                    %>
                                </select> <br /> 
                            </div>
                            <div class="form-group">
                                <label>Localidade de óbito</label>
                                <select name ="localidade_obito" class="form-control"> 
                                    <option>Selecione</option>
                                    <%
                                        for (Localidade loc : localidades) {
                                            String address = loc.getCidade() + ", " + loc.getEndereco();
                                    %>
                                    <option value="<%=loc.getId()%>" ><%=address%></option>
                                    <%
                                        }
                                    %>
                                </select> <br /> 
                            </div>
                            <button class="btn btn-primary btn-lg" type="submit">Enviar</button>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<!---->
<%@include file="rodape.jsp"%>
