
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
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_cadastro.css" type="text/css">

        <link rel="stylesheet" href="css/style_footer.css" type="text/css">          
        <link rel="stylesheet" href="css/style_jquary-table.css" type="text/css">     <!-- Style da Tabela -->
        <link rel="stylesheet" href="css/msg_erro.css" type="text/css">             <!-- Mensagem de Erro -->

        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">        
        <title> Cadsatro de Cliente </title>
    </head>
    <body>
        <div id="container">    
            <div id="header">    

            </div> <!-- Fim da div HEADER--> 
            <div id="menu">            

            </div>     

            <div id="conteudo">                
                <div class="container">  
                    <form action="gerenciarCliente" method="POST" class="form-cliente"> 
                        <input type="hidden" name="idCliente" value="${cliente.idCliente}">                              
                        <h3 class="text-center mt-3"> Cadastro de Cliente </h3><hr>

                        <!-- Nome -->
                        <div class="nome">
                            <label> Nome: </label>
                            <div class="">
                                <input type="text" class="input-cliente" id="nome"
                                   name="nome"
                                   value="${cliente.nome}"
                                   />                                
                            </div>                            
                        </div>

                        <!-- Cpf_Cnpj -->
                        <div class="cpf_cnpj">
                            <label> Cpf-Cnpj</label>
                            <div class="cpf_cnpj">
                                <input type="text" class="input-cliente" id="cpf_cnpj"                                       
                                   name="cpf_cnpj"
                                   value="${cliente.cpf_cnpj}"
                                   maxlength="14"
                                    /> 
                            </div>                                                         
                        </div>

                        <!-- Email -->
                        <div class="email">
                            <label> Email</label>
                            <div class="">                                
                                 <input type="text" class="input-cliente"  id="email"
                                   name="email"
                                   value="${cliente.email}"
                                   />  
                            </div>                                                        
                        </div>

                        <!-- Telefone -->
                        <div class="telefone">
                            <label> Telefone</label>
                            <div class="telefone">                                
                                 <input type="text" id="telefone" class=""
                                   name="telefone"
                                   value="${cliente.telefone}" 
                                   maxlength="11"
                                   />                                
                            </div>                                                      
                        </div>

                        <!-- Status -->
                        <div class="status">
                            <label class="lbl-status"> Status: </label>   
                            <div>
                                <label>
                                    <input type="radio"
                                           name="status" value="1"
                                           <c:if test="${cliente.status == 1}"> checked </c:if> />
                                           Ativado
                                    </label>
                                </div>

                                <div>
                                    <label>
                                        <input type="radio"
                                               name="status" value="0"
                                        <c:if test="${cliente.status == 0}"> checked </c:if> />
                                    Desativado
                                </label>
                            </div>  
                        </div>                            

                        <!-- Salvar  |  Cancelar -->
                        <div class="btn-form">
                            <div class="btn-salvar">
                                <button> Salvar </button>                                    
                            </div>  

                            <div class="btn-cancelar">
                                <a href="gerenciarCliente?acao=listar"
                                   accesskey="" role="button"> Cancelar </a>                                
                            </div> 
                        </div>   

                    </form>              
                </div> <!-- fim da div Class CONTAINER-->  
            </div> <!-- fim da div CONTEÚDO-->    
        </div> <!-- fim da div CONTAINER-->            
        <script src="js/jquery-3.6.0.min.js"></script>          
        <script src="bootstrap/bootstrap.min.js"></script>        
    </body>
</html>