<%-- 
    Document   : cadastro
    Created on : 21 de nov. de 2025, 12:06:25
    Author     : Heraldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>       
        <!-- Meta -->
        <meta charset="utf-8">  
        <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">  
        <link rel="stylesheet" href="css/style_page.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_cadastro.css" type="text/css">  
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">        
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"> 
        <title> Promone </title>
    </head>
    <body>
        <div id="container">
            <div id="header"> 
   
            </div><!-- Fim da div HEADER-->  
            <div id="conteudo">
                <div class="container">       
                    <form action="gerenciarCadastro" method="POST" class="cadastro-usuario">
                        <h3 class="">Cadastro de Usuários</h3><hr>
                        <input type="hidden" name="idUsuario" value="${usuario.idUsuario}">      
                        <input type="hidden" name="idPerfil" value="${usuario.perfil.idPerfil}"> 
                        <input type="hidden" name="status" value="${usuario.status}"> 
                        <input type="hidden" name="dataCadastro" value="${usuario.dataCadastro}">

                        <!-- Agrupamento Nome | Login | Senha -->
                        <div class="agrupamento-nome-login-senha">   
                            <div class="nome">
                                <label> Nome: </label>
                                <div class="">
                                    <input type="text" class=""
                                        name="nome"
                                        value="${usuario.nome}"
                                        required=""
                                    />                                    
                                </div>                                
                            </div>

                            <!-- Login -->
                            <div class="login">
                                <label> Login: </label>
                                <div class="">
                                    <input type="text" class=""                                       
                                        name="login"
                                        value="${usuario.login}"
                                        required=""
                                    />                                   
                                </div>                                
                            </div>

                            <!-- Senha -->
                            <div class="senha">
                                <label> Senha: </label>
                                <div class="">
                                    <input type="password" class=""
                                        name="senha"
                                        value="${usuario.senha}"
                                        required=""
                                    />                                    
                                </div>                                
                            </div>
                        </div> <!-- fim do agrupamento Nome | Login | Senha  -->
                                         
                        <!-- Salvar | Cancelar -->
                        <div class="btn-form">
                            <div class="btn-cadastrar">
                                <button > Cadastrar </button>  
                            </div>

                            <div class="btn-cancelar">
                                <a href="home.jsp"                                       
                                   accesskey="" role="button"> Cancelar </a>
                            </div>
                        </div>
                    </form>                                     
                </div> <!-- class CONTAINER -->                                      
            </div> <!-- id CONTEUDO --> 
                <div id="footer">
                    <jsp:include page="template/footer.jsp"></jsp:include>   
                </div>   
        </div> <!-- id CONTAINER -->
    </body>       
        <script src="bootstrap/bootstrap.min.js"></script>  
</html>
