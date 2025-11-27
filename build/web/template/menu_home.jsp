<%-- 
    Document   : menu-home
    Created on : 15 de nov. de 2025, 12:21:57
    Author     : Heraldo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<header>        
    <nav id="menuBar" class="menu-bar">   
        <ul>
            <li><a href="home.jsp">Página Inicial</a></li>
            <li><a href="contato.jsp">Contato</a></li>
            <li><a href="sobre.jsp">Sobre</a></li>    
            <li>
                <div class="registrar_login">
                    <div class="btnHomeRegistrar">
                        <a href="cadastro.jsp"
                           class="btnRegistrar"
                           role="button">
                           Registrar
                        </a> 
                    </div>                
                    <div class="btnHomeLogin">
                        <a href="login.jsp"
                           class="btnLogin"
                           role="button">
                           Login
                        </a> 
                    </div>  
                </div>
            </li>   
        </ul>
    </nav>
</header>