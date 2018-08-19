<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>    
        <link href="../resources/css/bootstrap.css" rel="stylesheet">
        <link href="../resources/css/global.css" rel="stylesheet">
        <link href="../resources/css/cadastro.css" rel="stylesheet">
    </head>

    <body>
        <div class="cadastro-form">
            <!-- Cabecalho -->
            <div class="d-flex bg-light p-3 align-text-bottom">
                <h6 class="mt-auto mb-0 ml-3">Crie sua conta:</h6>
                <img class="ml-auto mr-3" src="../resources/img/logo.png" height="40"/> 
            </div>

            <!-- Corpo do formulario -->
            <form>   
                <div class="row">
                    <!-- Primeira coluna -->
                    <div class="col mr-4">
                        <div class="form-label-group">
                            <label class="mb-0"> Nome: </label>
                            <input type="text" name="nome" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Email: </label>
                            <input type="email" name="email" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Sexo: </label>
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
                            <input type="password" name="senha" class="form-control">
                        </div>
                        
                        <div class="form-label-group">
                            <label class="mb-0"> Confirme sua senha: </label>
                            <input type="password" name="senha2" class="form-control">
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
                            <input type="text" name="rua" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Cidade: </label>
                            <input type="text" name="cidade" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Estado: </label>
                            <input type="text" name="estado" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> Número: </label>
                            <input type="text" name="numero" class="form-control">
                        </div>

                        <div class="form-label-group">
                            <label class="mb-0"> CEP: </label>
                            <input type="text" name="cep" class="form-control">
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

        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/popper.js"></script>
        <script src="../resources/js/bootstrap.js"></script>
    </body>
</html>
