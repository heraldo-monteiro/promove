<%-- 
    Document   : listarUsuario
    Created on : 9 de nov. de 2025
    Author     : Heraldo
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <!-- Meta ---------------------------------------------------------- -->
        <meta charset="UTF-8">  
        <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">      
        <link rel="stylesheet" href="css/style_page.css" type="text/css">      
        <link rel="stylesheet" href="css/style_menu.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">                
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css" type="text/css">
        <title>Promove</title>
    </head>
    <body>
        <div id="container">
            <div id="header">
                
            </div>          
            <div id="menu">
                <jsp:include page="template/menu_user.jsp"></jsp:include>                
            </div>
            <div id="conteudo">
                <h3 class="text-center mt-5"> Lista de Usuários</h3>
                <div class="container">                
                    <table id="listarUsuario" class="table table-hover table-striped mt-3">
                        <thead>                          
                            <tr>
                                <th style="border:none ">  <a href="cadastrarUsuario.jsp" 
                                       class="btn btn-success btn-sm" 
                                       role="button">
                                       Novo
                                    </a>
                                </th>                                                           
                            </tr>  

                            <tr>
                                <th> Código</th>
                                <th> Nome</th>
                                <th> Perfil</th>
                                <th> Cadastrado</th>                               
                                <th> Login</th>
                                <th> Senha</th>
                                <th> Status</th>     
                                <th> Atualizar</th>
                                <th> Ação</th>
                            </tr>                         
                        </thead>
                        <tbody>                            
                            <c:forEach items="${usuarios}" var="usuario">
                                <tr>
                                    <td> ${usuario.idUsuario}</td>
                                    <td>${usuario.nome} </td> 
                                    <td> ${usuario.perfil.nome} </td> 

                                    <td> 
                                        <fmt:formatDate pattern="dd/MM/yyyy" 
                                            value="${usuario.dataCadastro}"/>
                                    </td>                                   

                                    <td> ${usuario.login}</td>                                     
                                    <td> ${usuario.senha}</td>   
                                    <td> 
                                        <c:choose>
                                            <c:when test="${usuario.status == 1}">
                                             Ativo  
                                            </c:when>
                                            <c:otherwise>
                                                Inativo
                                            </c:otherwise>
                                        </c:choose>
                                    </td>   

                                    <td>                                                                              
                                        <a href="gerenciarUsuario?acao=alterar&idUsuario=${usuario.idUsuario}"
                                           class="btn btn-warning btn-sm"
                                           role="button"> Atualizar </a>  
                                    </td> 
                                    <td class=""> 
                                        <c:choose>
                                            <c:when test="${usuario.status == 1}">
                                                <button class="btn btn-danger btn-sm"
                                                        onclick="confirmDesativar('${usuario.idUsuario}', '${usuario.nome}')">
                                                        Desativar
                                                </button>                                                
                                            </c:when>            
                                            <c:otherwise>
                                                <button class="btn btn-success btn-sm"
                                                        onclick="confirmAtivar('${usuario.idUsuario}', '${usuario.nome}')">
                                                        Ativar
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </td> 
                                </tr>  
                            </c:forEach>                        
                        </tbody>                        
                    </table>                   
               </div>             
            </div>  
        </div>
            <!-- 1º --><script src="js/jquery-3.6.0.min.js"></script>
            <!-- 2º --><script src="datatables/jquery.dataTables.min.js"></script>
            <!-- 3º --><script src="bootstrap/bootstrap.min.js"></script> 
            <!-- 4º --><script src="datatables/dataTables.bootstrap4.min.js"></script>             
        <script>
            $(document).ready(function () { 
                $('#listarUsuario').dataTable({                      
                    columnDefs: [
                        { width: '0px',  targets: 0 }, // Código
                        { width: '200px', targets: 1 }, // Nome
                        { width: '0px', targets: 2 }, // Perfil
                        { width: '0px', targets: 3 }, // Cadastrado
                        { width: '100px', targets: 4 }, // Login
                        { width: '0px', targets: 5 }, // Senha
                        { width: '0px', targets: 6 }, // Status
                        { width: '0px', targets: 7 }, // Atualizar
                        { width: '0px',  targets: 8 }  // Ação
                     ],
                    autoWidth: false,
                    
                    dom: '<"d-flex justify-content-between align-items-center"lf> t <"d-flex justify-content-between"ip>',                  
                    /*  
                        l  =  lengthMenu
                        f  =  sSearch (pesquisa)           
                        t  =  Tabela centraliza entre o bloco1 e bloco2            
                        i  =  sInfo 
                        p  =  oPaginate (paginação)                        
                    */     
                   
                   
                   
                    "ordering": false,   /* remove o icone de ordem crescente ou decrescente */                 
                    "bJQueryUI": true,
                    "lengthMenu": [[5, 10, 20, 25, -1], [5, 10, 20, 25, "Todos"]],                                       
                    "oLanguage": {
                        "sProcessing": "Processando",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Mostrando _START_ até _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrado de 0 até 0 de 0 registros",
                        "sInfoFiltered": "",
                        "sInfoPostFix": "",
                        "sSearch": "Pesquisar",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "Primeiro",
                            "sPrevious": "Anterior",
                            "sNext": "Próximo",
                            "sLast": "Último"
                        }
                    }
                });
            });
        </script>         
    </body>
</html>
