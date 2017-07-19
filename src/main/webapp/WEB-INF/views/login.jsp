<%--
  Created by IntelliJ IDEA.
  User: Satheesh Reddy
  Date: 5/28/2017
  Time: 4:50 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="/WEB-INF/views/template/header.jsp"%>
<div class="container-wrapper">
    <div class="container">
        <div id="login-box">
            <h1>Login with Username and Password</h1>

            <c:if test="${not empty msg}">
                <div class="msg">${msg}</div>
            </c:if>
            <form name="loginForm" action="<c:url value="/j_spring_security_check"/>" method="post">

                <c:if test="${not empty error}">
                    <div class="msg" style="color:red">${error}</div>
                </c:if>
                <div  class="form-group">
                    <label for="username">Username: </label>
                    <input type="text" name="username" id="username" class="form-control">

                </div>
                <div name="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" class="form-control">

                </div>

                <input type="submit" value="Submit" class="btn btn-success">

                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>



            </form>



        </div>

    </div>
</div>




<%@include file="/WEB-INF/views/template/footer.jsp"%>
