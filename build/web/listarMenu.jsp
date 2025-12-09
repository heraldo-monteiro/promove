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
        <!-- CSS  --------------------------------------------------------   -->
        <link rel="stylesheet" href="css/style_page.css" type="text/css">      
        <link rel="stylesheet" href="css/style_menu_user.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_button.css" type="text/css">
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
                <h3 class="text-center mt-5"> Lista de Menus</h3>   
                <div class="container">  
                                  
                    <table id="listarMenu" 
                           class="table 
                           table-hover
                           table-striped mt-3">
                        
                        <thead>    
                            <tr>
                        <th style="border: none">  
                            <a href="cadastrarMenu.jsp" 
                               class="btn btn-success btn-sm" 
                               role="button">
                               Novo 
                            </a>
                        </th> 
                    </tr>
                            <tr>
                                <th> Código</th>
                                <th> Nome</th>
                                <th> Link</th>
                                <th> Exibir</th>
                                <th> Status</th>
                                <th> Gerenciar </th>  
                                <th> Ação </th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${menus}" var="menu">
                                <tr>
                                    <td> ${menu.idMenu}</td>
                                    <td> ${menu.nome}</td> 
                                    <td> ${menu.link}</td>                                     
                                    <td> 
                                        <c:choose> 
                                            <c:when test="${menu.exibir == 1}">
                                                <div>
                                                    <img src="icons/icon_ativo.svg" class="icon">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div>
                                                    <img src="icons/icon_inativo.svg" class="icon">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>                                     
                                    <td> 
                                        <c:choose>
                                            <c:when test="${menu.status == 1}">
                                                <div class="status-on status">Ativo</div>                                                  
                                            </c:when>
                                            <c:otherwise>
                                                <div class="status-off status">Inativo</div> 
                                            </c:otherwise>
                                        </c:choose>
                                    </td> 
                                    
                                    <td>                                                                              
                                        <a href="gerenciarMenu?acao=alterar&idMenu=${menu.idMenu}"
                                           class="btn btn-warning btn-sm"
                                           role="button"> Atualizar </a>     
                                    </td> 
                                    
                                    <td> 
                                        <jsp:include page="scripts/ativar_desativar_menu.jsp"></jsp:include>
                                        <c:choose>
                                            <c:when test="${menu.status == 1}">                                            
                                                    <button class="btn btn-danger btn-sm"
                                                            onclick="confirmDesativar('${menu.idMenu}', '${menu.nome}')">
                                                            Desativar
                                                    </button>  
                                            </c:when>            
                                            <c:otherwise>                                               
                                                    <button class="btn btn-success btn-sm"
                                                            onclick="confirmAtivar('${menu.idMenu}', '${menu.nome}')">
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
            <!-- 1º --> <script src="js/jquery-3.6.0.min.js"></script>
            <!-- 2º --> <script src="datatables/jquery.dataTables.min.js"></script>
            <!-- 3º --> <script src="bootstrap/bootstrap.min.js"></script> 
            <!-- 4º --> <script src="datatables/dataTables.bootstrap4.min.js"></script>     
                        
        <script>
            $(document).ready(function () {                  
                $('#listarMenu').dataTable({
                    columnDefs: [
                        { width: '0px',  targets: 0 }, // Código
                        { width: '60px', targets: 1 }, // Nome
                        { width: '190px', targets: 2 }, // Link
                        { width: '60px', targets: 3 }, // Exibir
                        { width: '60px', targets: 4 }, // Status
                        { width: '0px', targets: 5 }, // Gerenciar
                        { width: '0px', targets: 6 }  // Ação
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
                    "lengthMenu": [[10,30,50, -1], [10,30,50, "Todos"]],
                    "oLanguage": {
                        "sProcessing": "Processando",
                      "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Mostrando _END_ de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando 0 de 0 registros",
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
