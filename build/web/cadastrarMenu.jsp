<%-- 
    Document   : cadastrarMenu
    Created on : 8 de nov. de 2025
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
        <link rel="stylesheet" href="css/style_jquary-table.css" type="text/css">   
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"> 
        <title> Promove </title>
    </head>
    <body>
        <div id="container">   
            <div id="header"> 
              
            </div><!-- Fim da div HEADER--> 
            <div id="conteudo">               
                <div class="container">   
                    <form action="gerenciarMenu" method="POST" class="form-menu"  style="min-height: 392px">                             
                            <input type="hidden" name="idMenu" value="${menu.idMenu}" />                        
                            <h3 class="text-center "> Cadastro de Menus </h3><hr>
                                        
                                <!-- Nome -->
                                <div class="input-container">
                                    <label> Nome:</label>
                                    <div class="nome">
                                        <input type="text" class="input-nome"
                                           name="nome"
                                           value="${menu.nome}"/>  
                                    </div>    
                                </div>
                                
                                <!-- Link -->
                                <div class="input-container">
                                    <label> Link:</label>
                                    <div class="link">
                                        <input type="text" class="input-link"
                                           name="link"
                                           value="${menu.link}"/>                                
                                    </div>
                                </div>
                            <!-- Menu -->
                            <div class="agrupamento-nenu-status">
                                
                                <div class="input-menu">
                                    <label> Menu:</label>
                                    <div>
                                        <label>
                                            <input type="radio" name="exibir" value="1"
                                                <c:if test="${menu.exibir == 1}">checked</c:if> />
                                            Exibir
                                        </label>
                                    </div>
                                    <div>
                                        <label>
                                            <input type="radio" name="exibir" value="0"
                                                <c:if test="${menu.exibir == 0}">checked</c:if> />
                                            Não exibir
                                        </label>
                                    </div>
                                </div>
                                 
                                <!-- Sttus  -->
                                <div class="input-status">
                                    <label> Status:</label>
                                    <div>
                                        <label>
                                            <input type="radio" name="status" value="1"
                                                <c:if test="${menu.status == 1}">checked</c:if> />
                                            Ativado
                                        </label>
                                    </div>                                            
                                    <div>
                                        <label>
                                            <input type="radio" name="status" value="0"
                                                <c:if test="${menu.status == 0}">checked</c:if> />
                                            Desativado
                                        </label>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Salvar | Cancelar -->
                            <div class="btn-form">
                                <div class="btn-salvar">
                                    <button> Salvar </button>  
                                </div>                                
                                <div class="btn-cancelar">
                                    <a href="gerenciarMenu?acao=listar"                                       
                                       accesskey="" role="button"> Cancelar </a>
                                </div>
                            </div> 
                        </form>                 
                </div> <!-- fim da div Class CONTAINER-->  
            </div> <!-- fim da div CONTEÚDO-->    
        </div> <!-- fim da div CONTAINER-->
    </body>
        <script src="js/jquery-3.6.0.min.js"></script>          
        <script src="bootstrap/bootstrap.min.js"></script>  
</html>
