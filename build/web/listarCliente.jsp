<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <link rel="stylesheet" href="css/style_button.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">   

        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/dataTables.bootstrap4.min.css" type="text/css">
        <link rel="stylesheet" href="datatables/jquery.dataTables.min.css" type="text/css">
        <title>Clientes</title>
    </head>
    <body>
        <div id="container">
            <div id="header">
                
                <!-- Esta area e designada para o banner, sua remoção não calsa problemas na aplicação -->                
            </div>
            <div id="menu">
                <jsp:include page="template/menu_user.jsp"></jsp:include>
                </div> <!-- fim do Menu -->
                <div id="conteudo">
                    <h3 class="text-center mt-5"> Lista de Clientes</h3> 
                    <div class="container">
                        <table id="listarCliente" class="table table-hover table-striped mt-3">
                            <thead>
                                <tr>
                                    <th style="border: none">
                                        <a href="cadastrarCliente.jsp"
                                           id="btn-novo"
                                           class="btn btn-success btn-sm"
                                           role="button"> 
                                            Novo Registro
                                        </a>
                                    </th>
                                </tr>
                                <tr>
                                    <th> Código</th>
                                    <th> Nome</th>
                                    <th> CPF_CNPJ</th>                                    
                                    <th> E-mail</th>
                                    <th> Telefone</th>
                                    <th> Status</th>
                                    <th> Atualizar</th>
                                    <th> Ação</th>
                                </tr>
                            </thead>  
                            <tbody>
                            <c:forEach items="${clientes}" var="cliente">
                                <tr>
                                    <td>  ${cliente.idCliente}</td>
                                    <td>  ${cliente.nome}</td>
                                    <td>  ${cliente.cpf_cnpj}</td>
                                    <td>  ${cliente.email}</td>
                                    <td>  ${cliente.telefone}</td>
                                    <td>  
                                        <c:choose>
                                            <c:when test="${cliente.status == 1}">
                                                <div>
                                                    <img src="icons/icon_ativo.svg" class="icon-on">
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div>
                                                    <img src="icons/icon_inativo.svg" class="icon-off">
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>

                                    <td>  
                                        <a href="gerenciarCliente?acao=alterar&idCliente=${cliente.idCliente}"> 
                                            <div class="status-atualizar status"> Atualizar </div>
                                        </a>
                                    </td>

                                    <td class="acoes-btn"> 
                                        <c:choose>
                                            <c:when test="${cliente.status == 1}">
                                                <div class="status-desativar status"
                                                     onclick="">
                                                    Desativar
                                                </div>                                            
                                            </c:when>      
                                            <c:otherwise>
                                                <div class="status-ativar status"
                                                     onclick="">
                                                    Ativar
                                                </div>
                                            </c:otherwise>
                                        </c:choose>                                
                                    </td>
                                </tr>                            
                            </c:forEach>
                        </tbody>
                    </table>
                </div><!-- fim do container --> 
            </div><!-- fim do Conteúdo -->
        </div><!-- fim do Container -->

        <!-- 1º --><script src="js/jquery-3.6.0.min.js"></script>
        <!-- 2º --><script src="datatables/jquery.dataTables.min.js"></script>
        <!-- 3º --><script src="bootstrap/bootstrap.min.js"></script> 
        <!-- 4º --><script src="datatables/dataTables.bootstrap4.min.js"></script>             
        <script>
            $(document).ready(function () {
                $('#listarCliente').dataTable({
                    columnDefs: [
                        {width: '0px', targets: 0}, // Código
                        {width: '200px', targets: 1}, // Nome
                        {width: '0px', targets: 2}, // Cpf_Cnpj
                        {width: '0px', targets: 3}, // Email
                        {width: '0px', targets: 4}, // Telefone
                        {width: '0px', targets: 5}, // Status
                        {width: '0px', targets: 6}, // Atualizar
                        {width: '0px', targets: 7}  // Ação
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
                    "ordering": false, /* remove o icone de ordem crescente ou decrescente */
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
