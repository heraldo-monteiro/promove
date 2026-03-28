<%@page contentType="text/html; utf-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.Usuario, controller.GerenciarLogin"%>


<%
    Usuario usuarioLogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("usuarioLogado", usuarioLogado);
%>

<div class="usuario-info">       
    <c:if test="${usuarioLogado != null}">
        Bem-vindo,  ${usuarioLogado.nome}
    </c:if>
</div>

<header>       
    <nav id="menuBar-user" class="menu-bar">   
        <ul> <!-- Lista de menus -->           
            <c:if test="${usuarioLogado != null && usuarioLogado.perfil != null}">
                <c:forEach items="${usuarioLogado.perfil.menus}" var="menu">
                    <c:if test="${menu.exibir == 1}">
                        <li>
                            <a href="${menu.link}">${menu.nome}</a>
                        </li>                            
                    </c:if>
                </c:forEach>
            </c:if> 
        </ul>  
        
        <c:choose>
            <c:when test="${usuarioLogado != null}">
                <div class="btnLogout">
                    <a href="home.jsp"
                       class="btn-logout"
                       role="button">
                       Sair                
                    </a>
                </div>  
            </c:when> 
            <c:otherwise>      
                <div class="btnLogin">
                    <a href="login.jsp" class="btn-login"> Sign In </a>  
                </div>
            </c:otherwise>
        </c:choose>
    </nav>    
</header>



