<%-- 
    Document   : cadastrarMenuPerfil
    Created on : 11 de nov. de 2025, 10:00:07
    Author     : Heraldo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">  
        <meta http-equiv="X-UA-Compatible" content="IE-edge, chrome=1">  
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">              
        
        <link rel="stylesheet" href="css/style_page.css" type="text/css">      
        <link rel="stylesheet" href="css/style_menu_user.css" type="text/css">         
        <link rel="stylesheet" href="css/style_cadastro.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">  
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_button.css" type="text/css">
        
        <link rel="stylesheet" href="css/style_jquary-table.css" type="text/css">   <!-- Style da Tabela JQuary -->
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css"> 
        <title> Promone </title>
    </head>
    <body>        
        <div id="container">
            <div id="header">    
                
            </div>
            <div id="menu">
                <jsp:include page="template/menu_user.jsp"></jsp:include>  
            </div>
            
            <div id="conteudo">
                <div class="container">                     
                    <div class="form-table">
                        <form action="gerenciarMenuPerfil" method="POST" class="form" style="min-width: 100%;  min-height: 100px">                                             
                            <input type="hidden" name="idPerfil" value="${vincularP.idPerfil}" />
                            <h3 class=""> Gerenciar Permições </h3>
                            
                            <!-- Container Nome | Menu -->
                            <div class="nome-menu">    
                                <div class="campo nome.">  
                                    <label>Nome:</label> 
                                    <input type="text" class="input-nome"
                                           name="nome"                                                                     
                                           value="${vincularP.nome}"
                                           readonly                                           
                                    />
                                </div> 

                                <!-- Menus Desvinculados -->
                                <div class="campo menu">  
                                    <label>Menu:</label> 
                                    <select name="idMenu" class="select-menu">
                                        <option value="">Menus Desvinculados</option>
                                        <c:forEach items="${vincularP.naoMenus}" var="menu">
                                            <c:if test="${menu.status == 1}">
                                                <option value="${menu.idMenu}">${menu.nome}</option>  
                                            </c:if>                              
                                        </c:forEach>
                                    </select>                        
                                </div>
                            </div>
                                            
                            <!-- Button Vincular | Listar Perfil -->   
                            <div class="btn-vincule-list">                        
                                <button type="submit" class="btn btn-primary btn-sm mr-4" id="btnVincular">Vincular</button> 
                                <a href="gerenciarPerfil?acao=listar" class="btn btn-danger btn-sm">Listar Perfis</a>
                            </div>
                        </form> 
                         
                        <!-- Table de Perfis -->                            
                        <table id="tableMenuPerfil" class="table table-hover table-striped" >
                            <thead>
                                <tr>
                                    <th> Código</th> 
                                    <th> Nome</th> 
                                    <th> Link</th> 
                                    <th> Exibir</th> 
                                    <th> Ação</th> 
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${vincularP.menus}" var="menu">
                                    <tr>
                                        <td> ${menu.idMenu}</td>
                                        <td> ${menu.nome}</td>
                                        <td> ${menu.link}</td>                                        
                                        <td> 
                                            <c:if test="${menu.exibir == 1}">
                                                 <div>
                                                    <img src="icons/icon_ativo.svg" class="icon">
                                                </div>
                                            </c:if>
                                            <c:if test="${menu.exibir == 0}">
                                                <div>
                                                    <img src="icons/icon_inativo.svg" class="icon">
                                                </div>
                                            </c:if>
                                        </td>     
                                        
                                        <td> 
                                            <jsp:include page="scripts/alert_desvincular_menu.jsp"></jsp:include>
                                            <div class="btn btn-danger btn-sm"
                                                    onclick="desvincular_Menu('${menu.idMenu}', '${menu.nome}', '${vincularP.idPerfil}')">
                                                    Desvincular    
                                            </div>
                                        </td>  
                                    </tr>
                                    </c:forEach>                              
                            </tbody>
                        </table>    
                    </div><!-- fim agrupamento Form-Table --> 
            </div>
        </div>              
            
            <!-- 1º --><script src="js/jquery-3.6.0.min.js"></script>
            <!-- 2º --><script src="datatables/jquery.dataTables.min.js"></script>
            <!-- 3º --><script src="bootstrap/bootstrap.min.js"></script> 
            <!-- 4º --><script src="datatables/dataTables.bootstrap4.min.js"></script> 
                       
        <script>
            $(document).ready(function () {
                $('#tableMenuPerfil').dataTable({
                    columnDefs: [
                      //{ width: '0px',  targets: 0 }, // Código                     
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
                    "lengthMenu": [[20, 30, -1], [20, 30, "Todos"]],
                    "oLanguage": {
                        "sProcessing": "Processando",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "Não foram encontrados resultados",
                        "sInfo": "Total de registros: _TOTAL_",
                        "sInfoEmpty": "",
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
