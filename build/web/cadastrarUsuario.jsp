<%-- 
    Document   : cadastrarUsuario
    Created on : 9 de nov. de 2025
    Author     : Heraldo
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
    <head>       
        <!-- Meta -->
        <meta charset="utf-8">  
        <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">  

        <link rel="stylesheet" href="css/style_page.css" type="text/css">      
        <link rel="stylesheet" href="css/style_menu.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_cadastro.css" type="text/css">
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">      
        <link rel="stylesheet" href="css/msg_erro.css" type="text/css">
        
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="stylesheet" href="css/style_jquary-table.css" type="text/css">
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"> 
      
        <title> Promone </title>
    </head>
    <body>
        <div id="container">
            <div id="header"> 
   
            </div><!-- Fim da div HEADER-->  
            <div id="conteudo">
                <div class="container">             
                    <form action="gerenciarUsuario" method="POST" class="form-usuario">
                        <h3 class="">Cadastro de Usuários</h3> <hr>
                        <input type="hidden" name="idUsuario" value="${usuario.idUsuario}">
                        <input type="hidden" name="dataCadastro" value="${usuario.dataCadastro}">

                        <!-- Agrupamento Nome | Login | Senha -->
                        <div class="agrupamento-nome-login-senha">   
                            
                            <div class="input-container">
                                <label> Nome: </label>
                                <div class="nome">
                                    <input type="text" class="input-nome"
                                        name="nome"
                                        placeholder="Nome do usuário!"
                                        value="${usuario.nome}"
                                    />                                    
                                </div>                                
                            </div>

                            <!-- Login -->
                            <div class="input-container">
                                <label> Login: </label>
                                <div class="login">
                                    <input type="text" class="input-login"                                       
                                        name="login"
                                        placeholder="Login do usuário!"
                                        value="${usuario.login}" />                                    
                                </div>                                
                            </div>

                            <!-- Senha -->                             
                            <div class="input-container">                               
                                <label> Senha: </label>                
                                <div class="senha">                                       
                                    <jsp:include page="scripts/exibir_senha.jsp"></jsp:include>
                                    <input type="password" class="input-senha" style="height: 32px"
                                        name="senha"
                                        placeholder="Senha de acesso!"
                                        value="${usuario.senha}"/>   
                                    <i class="fa fa-eye exibir-senha" onclick="exibirSenha(this)"> </i>
                                </div>     
                                   
                            </div>   

                        </div> <!-- fim do agrupamento Nome | Login | Senha  -->

                        <!-- Perfil | Status -->    
                        <div class="agrupamento-perfil-status">
                            
                            <div class="input-perfil">
                                <label class="">Perfil:</label>
                                <div class="perfil">
                                    <jsp:useBean class="persistence.PerfilDao" id="perfilDao"/>
                                    <c:forEach items="${perfilDao.listarPerfil}" var="perfil">
                                        <div class="form-check">
                                            <input class="form-check-input" type="radio" 
                                                   name="idPerfil" 
                                                   value="${perfil.idPerfil}"
                                                   <c:if test="${perfil.idPerfil == usuario.perfil.idPerfil}">
                                                       checked
                                                   </c:if>>
                                            <label class="form-check-label">
                                                ${perfil.nome}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>

                            <!-- Status  -->
                            <div class="input-status">
                                <label> Status: </label>
                                <div>                                
                                    <label>
                                        <input type="radio" name="status" value="1"
                                               <c:if test="${usuario.status == 1}"> checked </c:if> />
                                            Ativado   
                                    </label>                                    
                                </div>  
                                <div>            
                                    <label>
                                        <input type="radio" name="status" value="0"
                                               <c:if test="${usuario.status == 0}"> checked </c:if> />
                                            Desativado   
                                    </label>
                                </div> 
                            </div> <!-- fim da div  Status -->            
                        </div> <!-- fim da div  Perfil | Status -->   

                        <!-- Salvar | Cancelar -->
                        <div class="btn-form">
                            <div class="btn-salvar">
                                <button > Salvar </button>  
                            </div>

                            <div class="btn-cancelar">
                                <a href="gerenciarUsuario?acao=listar"                                       
                                   accesskey="" role="button"> Cancelar </a>
                            </div>
                        </div>
                    </form>                                     
                </div>         
            </div>            
        </div>
    </body>
        <script src="js/jquery-3.6.0.min.js"></script>          
        <script src="bootstrap/bootstrap.min.js"></script>  
</html>
