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
		<title>Add User</title>
		<style>
			p{
				color: red;
			}
		</style>
	</head>
	<jsp:include page="navbar.jsp"></jsp:include>
	<body>
		<div class="container">
			<h2>Add User</h2>
			<p style="color: green;">${msg}</p>
			<form:form  id="formAdd" method = "POST" modelAttribute="userForm">
	      		<div class="form-group">
	            <form:label path="userId">User Id:</form:label>
	            <form:input type="text" path ="userId" class="form-control" id="userId" />
	            <p id="errUserId">${errUserId}</p>
	        </div>
	        <div class="form-group">
	            <form:label path="name">Name:</form:label> 
	            <form:input type="text" class="form-control" path="name" id="name" />
	            <p id="errName"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="birthday">Birthday:</form:label>
	            <form:input type="text" class="form-control" path="birthday" id="datepicker" />
	            <p id="errBirthday"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="email">Email Address:</form:label>
	            <form:input type="text" class="form-control" path="email" id="email" />
	            <p id="errEmail"></p>
	        </div>
	        <div class="form-group">
	            <form:label path="phoneNumber">Phone Number:</form:label>
	            <form:input type="text" class="form-control" path="phoneNumber" id="phoneNumber"/>
	            <p id="errPhoneNumber"></p>
	        </div>
				<c:url var="action" value="/save"/>
				<a onclick="addUser('${action}');"><button
	            type="button" class="btn btn-primary" id="btncancel">
	            Add
	          </button></a>
	          <a href="${contextPath}/userList"><button
	            type="button" class="btn btn-danger" id="btncancel">
	            Cancel
	          </button></a>
	      
	        </form:form>
	
		</div>
	</body>
	<script src="${contextPath}/resources/js/validate.js"></script>
		
</html>