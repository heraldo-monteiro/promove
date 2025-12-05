<%-- 
    Document   : index
    Created on : 6 de nov. de 2025
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
        <link rel="stylesheet" href="css/style_menu_user.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">     
        <link rel="stylesheet" href="css/msg_erro.css" type="text/css">    
        <link rel="stylesheet" href="bootstrap/bootstrap.min.css" type="text/css">  
        
        <link rel="shortcut icon" href="./imagens/logo.png">
       <title>Promove</title>
    </head>
    <body>       
        
        <div id="container">
            <div id="header">
              <jsp:include page="template/banner.jsp"></jsp:include>
            </div> <!-- fim da div HEADER -->          
            
            <div id="menu">
                <jsp:include page="template/menu_user.jsp"></jsp:include>          
            </div><!-- Fim da div MENU-->                   
            <div id="conteudo">
                
                
                
            </div> <!-- fim da div Id CONTEUDO --> 
            <div id="footer">                
                <jsp:include page="template/footer.jsp"></jsp:include>
            </div><!-- fim da div FOOTER -->
            
        </div> <!-- fim da div CONTAINER -->
    </body>
</html>
