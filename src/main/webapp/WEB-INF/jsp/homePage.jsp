<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
    <head>
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <script src="${contextPath}/resources/js/validate.js"></script>
        <title>Home Page</title>
    </head>
    
    <body>
        <div class="container">
            <jsp:include page="navbar.jsp"></jsp:include>
            <h1>Hello Spring boot CRUD</h1>
        </div>    
    </body>
    <script src="${contextPath}/resources/js/validate.js"></script>
</html>
