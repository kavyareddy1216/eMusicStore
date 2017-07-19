<%--
  Created by IntelliJ IDEA.
  User: Satheesh Reddy
  Date: 5/11/2017
  Time: 3:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Administrator Page</h1>

            <p class="lead">Checkout product inventory!</p>
            <c:if test="${pageContext.request.userPrincipal.name != null}">
                <h1>
                    Welcome, ${pageContext.request.userPrincipal.name} | <a href="<c:url value="/j_spring_security_logout"/> ">Logout</a>
                </h1>

            </c:if>
        </div>
        <spring:url value="/admin/productinventory" var="url"/>

        <a href="${url}"><button type="button" class="btn btn-primary">Product Inventory</button></a>




<%@include file="/WEB-INF/views/template/footer.jsp"%>