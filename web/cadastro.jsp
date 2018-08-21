<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title> Cadastro </title>    
        <link href="resources/css/bootstrap.css" rel="stylesheet">
        <link href="resources/css/global.css" rel="stylesheet">
        <link href="resources/css/cadastro.css" rel="stylesheet">
    </head>

    <body>
        <%-- Variavel de erros --%>
        <%! Map<String, String> errors; %>
        <% errors = (HashMap) request.getAttribute("errors"); %>
        
        <%! String isInvalid(String attName){
            if (errors == null || errors.get(attName) == null) { return ""; }
            else { return "is-invalid"; }       
        } %>
        
        <%! String getErrorMsg(String attName){
            if (errors == null || errors.get(attName) == null) { return ""; }
            else { return errors.get(attName); }       
        } %>
        
        <div class="cadastro-form">
            <!-- Cabecalho -->
            <div class="d-flex bg-light p-3 align-text-bottom">
                <h6 class="mt-auto mb-0 ml-3">Crie sua conta:</h6>
                <img class="ml-auto mr-3" src="resources/img/logo.png" height="40"/>
            </div>

            <!-- Corpo do formulario -->
            <form action="main" method="post">
                <input type="hidden" name="action" value="cadastro">
                
                <div class="row">
                    <!-- Primeira coluna -->
                    <div class="col mr-4">
                        <div class="form-label-group">
                            <label class="mb-0"> Nome: </label>                                                                                   
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroNome")%> </small>
                            <input type="text" name="nome" class="form-control <%= isInvalid("erroNome") %> "> 
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Email: </label>                                                        
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroEmail")%> </small>
                            <input type="email" name="email" class="form-control <%= isInvalid("erroEmail") %> ">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Sexo <small>(opcional)</small>: </label>
                            <div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sexo" value="m">
                                    <label class="form-check-label" for="sexo">
                                        Masculino
                                    </label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="sexo" value="f">
                                    <label class="form-check-label" for="sexo">
                                        Feminino
                                    </label>
                                </div>
                            </div>
                        </div>
                        
                        <div class="form-label-group">
                            <label class="mb-0"> Senha: </label>                                                                                    
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroSenha")%> </small>
                            <input type="password" name="senha" class="form-control <%= isInvalid("erroSenha") %> ">
                        </div>
                        
                        <div class="form-label-group">
                            <label class="mb-0"> Confirme sua senha: </label>                                                                                   
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroSenha2")%> </small>
                            <input type="password" name="senha2" class="form-control <%= isInvalid("erroSenha2") %> "> 
                        </div>
                                                
                        <div class="form-label-group">
                            <label class="mb-0"> Telefone <small>(opcional)</small>: </label>
                            <input type="text" name="profissao" class="form-control">
                        </div>
                    </div>

                    <!-- Segunda coluna -->
                    <div class="col">                        
                        <div class="form-label-group">
                            <label class="mb-0"> Rua: </label>                            
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroRua")%> </small>
                            <input type="text" name="rua" class="form-control <%= isInvalid("erroRua") %> ">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Cidade: </label>                            
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroCidade")%> </small>
                            <input type="text" name="cidade" class="form-control  <%= isInvalid("erroCidade") %> ">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Estado: </label>                            
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroEstado")%> </small>
                            <input type="text" name="estado" class="form-control <%= isInvalid("erroEstado") %> ">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Número: </label>                            
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroNumero")%> </small>
                            <input type="text" name="numero" class="form-control <%= isInvalid("erroNumero") %> ">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> CEP: </label>                            
                            <small class="invalid-feedback d-inline"> <%= getErrorMsg("erroCep")%> </small>
                            <input type="text" name="cep" class="form-control <%= isInvalid("erroCep") %> ">
                        </div>
                        
                        <div class="form-label-group">
                            <label class="mb-0"> Profissão <small>(opcional)</small>: </label>
                            <input type="text" name="profissao" class="form-control">
                        </div>
                    </div>
                </div>

                <!-- Rodape -->
                <div class="row align-items-center">
                    <div class="col-2">
                        <p><a href="login.jsp">voltar</a></p>
                    </div>
                    <div class="col-8">
                        <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">Cadastrar</button>
                    </div>
                </div>
            </form>

        </div>

        <script src="resources/js/jquery.js"></script>
        <script src="resources/js/popper.js"></script>
        <script src="resources/js/bootstrap.js"></script>
    </body>
</html>
