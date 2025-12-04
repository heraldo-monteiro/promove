<%-- 
    Document   : alert_login
    Created on : 13 de nov. de 2025
    Author     : Heraldo
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:if test="${not empty msg}">
    <div class="alert-box">
        ${msg}
    </div>
</c:if>
