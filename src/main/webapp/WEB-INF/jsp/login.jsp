<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Insert title here</title>
		<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
        <script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
        <script src="${contextPath}/resources/js/bootstrap.min.js"></script>
        <style>
        	p{color:red;}
        </style>
	</head>
	<body>
		<div class="container" style="width: 30%;">

            <h2>Login Form</h2>
            <p>${loginFail}</p>
            <form:form id="formLogin" method = "POST" modelAttribute="userForm" action="${contextPath}/login">
                <div class="form-group">
	                <label >User Id:</label>
	                <input type="text" name ="userId" class="form-control" id="userId" value="${userForm.userId}"/>
	                <p id="errUserId">${errUserId}</p>
	            </div>
	            <div class="form-group">
	                <label >Password:</label>
	                <input type="password" class="form-control" name="password" id="password" value="${userForm.password}"/>
	                <input type="checkbox" id="myCheck" onclick="showPassword()"/>&nbsp;<span>show password</span>
	                <p id="errPassword"></p>
	            </div>
                <a onclick="login();"><button
                type="button" class="btn btn-primary" id="btncancel">
                Login
              </button></a>
              
            </form:form>
        </div>
	</body>
	<script src="${contextPath}/resources/js/validate.js"></script>
</html>