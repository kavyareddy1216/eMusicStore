<%--
  Created by IntelliJ IDEA.
  User: Satheesh Reddy
  Date: 5/11/2017
  Time: 3:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h>All Products</h>
            <br/>
            <p class="lead">Checkout all the awesome products available now!</p>
        </div>

        <table class="table table-striped table-hover">
            <thead>
            <tr class="bg-success">
                <th>Photo Thumb</th>
                <th>Product Name</th>
                <th>Category</th>
                <th>Condition</th>
                <th>Price</th>
                <th></th>
            </tr>
            </thead>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><img  class = "one" src="<c:url value="/resources/images/${product.productId}.png"/> " alt="image"  />
                    </td>
                    <td>${product.productName}</td>
                    <td>${product.productCategory}</td>
                    <td>${product.productCondition}</td>
                    <td>${product.productPrice} USD</td>
                    <td><a href="<spring:url value="/productList/viewProduct/${product.productId}" />"
                    ><span class="glyphicon glyphicon-info-sign"></span></a>
                        <a href="<spring:url value="/admin/productinventory/deleteproduct/${product.productId}" />"
                        ><span class="glyphicon glyphicon-remove"></span></a>
                        <a href="<spring:url value="/admin/productinventory/editproduct/${product.productId}" />"
                        ><span class="glyphicon glyphicon-pencil"></span></a>
                    </td>
                </tr>
            </c:forEach>
        </table>
        <spring:url value="/admin/productinventory/addproduct" var="url"></spring:url>
        <a href="${url}"><button type="button" class="btn btn-primary">Add product</button></a>
        <%@include file="/WEB-INF/views/template/footer.jsp"%>
