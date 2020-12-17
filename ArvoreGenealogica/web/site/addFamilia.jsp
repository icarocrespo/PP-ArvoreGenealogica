<%@page import="util.Upload"%>
<%@page import="model.Familia"%>
<%@page import="dao.FamiliaDAO"%>
<%@include file="cabecalho.jsp"%>
<%    if (request.getMethod().equals("POST")) {
        Upload up = new Upload();
        up.setFolderUpload("fotos");
        if (up.formProcess(getServletContext(), request)) {
            if (up.getForm().get("nome").toString() == null) {
                response.sendRedirect("index.jsp");
                return;
            }

            FamiliaDAO dao = new FamiliaDAO();
            Familia obj = new Familia();

            obj.setNome(up.getForm().get("nome").toString());
            obj.setMembros(Integer.parseInt(up.getForm().get("membros").toString()));
            obj.setHistoria(up.getForm().get("historia").toString());

            if (!up.getFiles().isEmpty()) {
                obj.setUriBrasao(up.getFiles().get(0));
            }

            if (dao.incluir(obj)) {
                response.sendRedirect("index.jsp");
            }
        }
    }
%>
<div class="content">
    <div class="product-model">

        <div class="container">
            <h2>Adicionar Familiar</h2>			
            <div class="col-md-12 product-model-sec">
                <div class="panel-body">
                    <form action="#" method="post" enctype="multipart/form-data">
                        <div class="col-lg-4">
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group">
                                <input class="form-control" type="file" accept=".jpg, .jpeg, .png" name="brasao" />
                            </div>
                            <div class="form-group">
                                <label>Nome</label>
                                <input class="form-control" type="text" name="nome" required/>
                            </div>
                            <div class="form-group">
                                <label>História</label>
                                <textarea class="form-control" name="historia" rows="5" cols="33"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Membros</label>
                                <input class="form-control" type="number" name="membros" />
                            </div>
                            <button class="btn btn-primary btn-lg" type="submit">Enviar</button>
                        </div>

                    </form>
                </div>

            </div>
        </div>
    </div>
</div>
<%@include file="rodape.jsp"%>