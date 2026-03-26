<%-- 
    Document   : listarPerfil
    Created on : 26 de out. de 2023, 16:28:53
    Author     : Heraldo
--%>

<%@page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
        <link rel="stylesheet" href="css/style_button.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">   

        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css" type="text/css">
        <title>Promove</title>
    </head>
    <body>
        <div id="container">
            <div id="header">

            </div> <!-- fim da div HEADER-->            
            <div id="menu">               
                <jsp:include page="template/menu_user.jsp"></jsp:include>            
                </div><!-- fim da div MENU-->
                <div id="conteudo" class="">
                    <h3 class="text-center mt-5"> Lista de Perfis</h3> 

                    <div class="container">   
                        <table id="listarPerfis"
                               class="table
                               table-hover
                               table-striped mt-3">                        
                            <thead>
                                <tr>
                                    <th style="border:none"> 
                                        <a href="cadastrarPerfil.jsp"
                                           id="btn-novo"
                                           class="btn btn-sm" 
                                           role="button">
                                            Novo Registro
                                        </a>
                                    </th>                                                          
                                </tr>                             
                                <tr>
                                    <th> Código</th>
                                    <th> Nome</th>                                
                                    <th> Status</th>
                                    <th> Gerenciar</th>
                                    <th> Ação</th>
                                </tr>                            
                            </thead>
                            <tbody>
                            <c:forEach items="${perfis}" var="perfil">
                                <tr>
                                    <td>${perfil.idPerfil}</td>
                                    <td>${perfil.nome}</td>                                   
                                    <td>
                                        <c:choose>
                                            <c:when test="${perfil.status == 1}">
                                                <div class="status-on status">Ativo</div>                                                
                                            </c:when>
                                            <c:otherwise>
                                                <div class="status-off status">Inativo</div> 
                                            </c:otherwise>
                                        </c:choose>                                         
                                    </td>    

                                    <td>                                                                              
                                        <a href="gerenciarPerfil?acao=alterar&idPerfil=${perfil.idPerfil}">
                                            <div class="status-atualizar status">Atualizar</div>
                                        </a>  
                                    </td>   
                                    <td> 
                                        <a href="gerenciarMenuPerfil?acao=vincular&idPerfil=${perfil.idPerfil}">
                                            <div class="status-vincular status"> Vincular</div>
                                    </td>                                    
                                </tr>   
                            </c:forEach>
                        </tbody>                        
                    </table>    
                </div> <!-- fim da div Class CONTAINER -->                               
            </div> <!-- fim da div Id CONTEUDO -->      
        </div> <!-- fim da div Id CONTAINER -->    

        <!-- 1º --><script src="js/jquery-3.6.0.min.js"></script>
        <!-- 2º --><script src="datatables/jquery.dataTables.min.js"></script>
        <!-- 3º --><script src="bootstrap/bootstrap.min.js"></script> 
        <!-- 4º --><script src="datatables/dataTables.bootstrap4.min.js"></script>             

        <script>
            $(document).ready(function () {
                $('#listarPerfis').dataTable({
                    columnDefs: [
                        {width: '0px', targets: 0}, // Código
                        {width: '190px', targets: 1}, // Nome
                        {width: '120px', targets: 2}, // Status
                        {width: '120px', targets: 3}, // Gerenciar
                        {width: '120px', targets: 4}  // Ação
                    ],
                    autoWidth: false,

                    dom: '<"d-flex justify-content-between align-items-center"lf> t <"d-flex justify-content-between"ip>',
                    // l  =  lengthMenu
                    // f  =  sSearch (pesquisa)           
                    // t  =  Tabela centraliza entre o bloco1 e bloco2            
                    // i  =  sInfo 
                    // p  =  oPaginate (paginação)                      

                    "ordering": false,
                    "bJQueryUI": true,
                    "lengthMenu": [[-1], [""]],
                    "oLanguage": {
                        "sProcessing": "Processando",
                        "sLengthMenu": "",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Total de registros: _TOTAL_",
                        "sInfoEmpty": "",
                        "sInfoFiltered": "",
                        "sInfoPostFix": "",
                        "sSearch": "Pesquisar",
                        "sUrl": "",
                        "oPaginate": {
                            "sFirst": "",
                            "sPrevious": "",
                            "sNext": "",
                            "sLast": ""
                        }
                    }
                });
            });
        </script>      
    </body>
</html>
