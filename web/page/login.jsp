<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>    
        <link href="../resources/css/bootstrap.css" rel="stylesheet">
        <link href="../resources/css/global.css" rel="stylesheet">
        <link href="../resources/css/login.css" rel="stylesheet">
    </head>

    <body>
        <form class="form-signin">
            <img src="../resources/img/logo.png" class="img-fluid mb-3"/>

            <div class="form-label-group">
                <label class="mb-0"> Email </label>
                <input type="email" name="email" class="form-control">
            </div>

            <div class="form-label-group">
                <label class="mb-0"> Senha </label>
                <input type="password" name="senha" class="form-control">
            </div>

            <button class="btn btn-lg btn-primary btn-block mb-3" type="submit">Login</button>

            <p>Não possui cadastro? <a href="#">crie uma conta.</a></p>
        </form>

        <script src="../resources/js/jquery.js"></script>
        <script src="../resources/js/popper.js"></script>
        <script src="../resources/js/bootstrap.js"></script>
    </body>
</html>

