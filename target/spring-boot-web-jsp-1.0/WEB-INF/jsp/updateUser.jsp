<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
		<link href="${contextPath}/resources/css/jquery-ui.css" rel="stylesheet">
		<script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
		<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
		<script src="${contextPath}/resources/js/jquery-ui.js"></script>
<title>Edit User</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
    <div class="container">
        <h2>Update User</h2>
        <form:form modelAttribute="userEditForm" id="formEdit" method = "POST">
	        <div class="form-group">
	            <form:label path="userID">User Id:</form:label>
	            <form:input type="text" path ="userID" class="form-control" id="userId" value="${userEdit.userId}"/>
	            <p id="errUserId">${errUserId}</p>
	        </div>
	        <div class="form-group">
	            <form:label path="name">Name:</form:label> 
	            <form:input type="text" class="form-control" path="name" id="name" value="${userEdit.name}"/>
	            <p id="errName"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="birthday">Birthday:</form:label>
	            <form:input type="text" class="form-control" path="birthday" id="datepicker" value="${userEdit.birthday}"/>
	            <p id="errBirthday"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="email">Email Address:</form:label>
	            <form:input type="text" class="form-control" path="email" id="email" value="${userEdit.phoneNumber}"/>
	            <p id="errEmail"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="phoneNumber">Phone Number:</form:label>
	            <form:input type="text" class="form-control" path="phoneNumber" id="phoneNumber" value="${userEdit.phoneNumber}"/>
	            <p id="errPhoneNumber"></p>
	        </div>
	        <c:url var="action" value="/saveUpdate"/>
	        <a onclick="editUser('${action}');">
	         <button type="button" class="btn btn-primary">
	           Save
	         </button></a>
	         <a href="${contextPath}/userList">
	         <button type="button" class="btn btn-danger">
	           Cancel
	         </button></a>
	          
        </form:form>
    </div>
</body>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</html>