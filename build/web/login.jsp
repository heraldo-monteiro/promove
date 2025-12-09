<%-- 
    Document   : login_page
    Created on : 31 de dez. de 2023
    Author     : Heraldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">       
        <link rel="stylesheet" href="css/style_login.css" type="text/css">        
        <link rel="stylesheet" href="css/style_alert-box.css" type="text/css">        
        <title> Promove </title>
    </head>
    <body>
        <main id="container">           
            <form id="login_form" action="gerenciarLogin" method="POST">                

                <div id="form_header">
                    <h1>Login</h1>                    
                </div>

                

                <div id="input">
                    <!-- Campo Usuário -->
                    <div class="input-box">
                        <label for="name">Usuário</label>
                        <div class="input-field">
                            <img src="icons/user.svg" class="icon">
                            <input 
                                type="text"
                                id="name"
                                name="login"
                                placeholder="Digite seu usuário"
                                value="${loginDigitado}"
                                required
                            >
                        </div>
                    </div>

                    <!-- Campo Senha -->
                    <div class="input-box">
                        <label for="password">Senha</label>
                        <div class="input-field">
                            <img src="icons/password.svg" class="icon">
                            <input 
                                type="password"
                                id="password"
                                name="senha"
                                placeholder="Digite sua senha"
                                required
                            >
                        </div>
                    </div>

                </div>

                <button type="submit" id="login-button">
                    Login
                </button>
                <!-- Inclui mensagem de alerta -->
                <jsp:include page="scripts/alert_login.jsp"></jsp:include>
                
                <div id="forgot_password">
                    <a href="#">Esqueceu sua senha?</a>
                </div>
                
            </form>              
        </main>         
    </body>
</html>
   

