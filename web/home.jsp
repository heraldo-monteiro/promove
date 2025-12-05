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
        <link rel="stylesheet" href="css/style_menu_home.css" type="text/css"> 
        <link rel="stylesheet" href="css/style_table.css" type="text/css">
        <link rel="stylesheet" href="css/style_footer.css" type="text/css">         
        <link rel="stylesheet" href="css/msg_erro.css" type="text/css">         
        <!-- JQuary | Bootstrap -->
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
                <jsp:include page="template/menu_home.jsp"></jsp:include>          
            </div><!-- Fim da div MENU-->                   
            <div id="conteudo">
                <div class="" style="margin: 10px; background: greenyellow">
                    Bem-vindo ao Promove — Onde ideias ganham força e oportunidades acontecem
                    <br>                    
                    O Promove nasce com um propósito simples e poderoso: conectar pessoas, negócios e soluções de forma inteligente.
                    Aqui, você encontra um ambiente desenvolvido para facilitar sua rotina, ampliar possibilidades e entregar resultados reais.
                    Trabalhamos com foco na inovação, na usabilidade e na experiência do usuário, oferecendo ferramentas que tornam processos mais ágeis e eficientes.
                    <br>
                    Nosso compromisso é criar pontes que aproximem você do que realmente importa.
                    Cada detalhe foi pensado para proporcionar clareza, praticidade e confiança em cada interação.
                    No Promove, acreditamos que promover é muito mais que divulgar — é transformar, impulsionar e gerar novas oportunidades.
                    <br>
                    Por isso, estamos constantemente evoluindo, ouvindo nossos usuários e adaptando nossas soluções às suas necessidades.
                    Queremos ser mais do que uma plataforma: queremos ser um parceiro no crescimento, na organização e no sucesso de cada pessoa que passa por aqui.
                    <br>
                    Seja para explorar, aprender, compartilhar ou conquistar novos objetivos, o Promove está pronto para acompanhar você em cada passo.
                    Sinta-se à vontade, descubra nossos recursos e aproveite tudo o que preparamos para facilitar sua jornada.
                    <br>
                    Promove — promovendo conexões, promovendo resultados, promovendo você.
                </div>                
                
            </div> <!-- Id CONTEUDO --> 
            <div id="footer">                
                <jsp:include page="template/footer.jsp"></jsp:include>
            </div><!-- Id FOOTER -->            
        </div> <!-- Id CONTAINER -->
    </body>
</html>
