<%--
  Created by IntelliJ IDEA.
  User: Satheesh Reddy
  Date: 5/11/2017
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@include file="/WEB-INF/views/template/header.jsp" %>

<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Details</h1>

            <p class="lead">Here is the detail information about the product!</p>
        </div>
        <div class="form-group">
            <c:set var="myContext" value="${pageContext.request.contextPath}"/>
            <form:form action="${myContext}/admin/productinventory/addproduct" method="post" commandName="product"
                       enctype="multipart/form-data">
            <label for="name">Name: </label>
            <form:errors path="productName" cssStyle="color: red"/>
            <form:input class="form-control" path="productName" id="name"/>
        </div>

        <div class="form-group">
            <label for="category"> Category:</label>
            <label class="radio-inline"><form:radiobutton value="Movie" path="productCategory"
                                                          checked="checked"/>Movie</label>
            <label class="radio-inline"><form:radiobutton value="Intruments" path="productCategory"/>Intruments</label>
            <label class="radio-inline"><form:radiobutton value="Audio" path="productCategory"/>Audio</label>
        </div>
        <div class="form-group">
            <label for="description">Product Description: </label>
            <form:textarea class="form-control" path="productDescription" id="description"/>
        </div>
        <div class="form-group">
            <label for="price"> Price</label>
            <form:errors path="productPrice" cssStyle="color: red"/>
            <form:input class="form-control" path="productPrice" id="price"/>
        </div>
        <div class="form-group">
            <label for="condition"> Product condition:</label>
            <label class="radio-inline"><form:radiobutton value="New" path="productCondition" />New</label>
            <label class="radio-inline"><form:radiobutton value="Old" path="productCondition" />Old</label>
        </div>
        <div class="form-group">
            <label for="status"> Product Status:</label>
            <label class="radio-inline"><form:radiobutton value="Active" path="productStatus" id="status"/>Active</label>
            <label class="radio-inline"><form:radiobutton value="Inactive" path="productStatus" id="status"/>Inactive</label>
        </div>
        <div class="form-group">
            <label for="stock">Unit in Stock</label>
            <form:errors path="unitInStock" cssStyle="color: red"/>
            <form:input class="form-control" path="unitInStock" id="stock"/>
        </div>
        <div class="form-group">
            <label for="manufacturer">Manufacturer</label>
            <form:input class="form-control" path="productManufacturer" id="stock"/>
        </div>
        <div class="form-group">
            <label class="control-label" for="productImage">Product Picture</label>
            <form:input class="form:input-large" path="productImage" id="productImage" type="file"/>
        </div>
        <div class="form-group">
            <input type="submit" class="btn btn-success" value="Submit" name="Submit"/>
            <a href="<spring:url value="/admin/productinventory"/>">
                <button type="button" class="btn btn-warning">Cancel</button>
            </a>
        </div>

        </form:form>
        <%@include file="/WEB-INF/views/template/footer.jsp" %>
