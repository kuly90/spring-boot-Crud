<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<link href="${contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<title>Add User</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
	<div class="container">
		<h2>Add User</h2>
		<p style="color: green;">${msg}</p>
		<form action="/save">
			<div class="form-group">
				<label for="email">User Id:</label> <input type="text"
					class="form-control" placeholder="Enter User Id"
					name="userId" required="required">
			</div>
			<div class="form-group">
				<label for="pwd">Name:</label> <input type="text"
					class="form-control" placeholder="Enter name"
					name="name" required="required">
			</div>
			<div class="form-group">
				<label for="pwd">Year Old:</label> <input type="text"
					class="form-control" placeholder="Enter year Old"
					name="yearOld" required="required">
			</div>
			<button type="submit" class="btn btn-primary">Add</button>
			<a href="${contextPath}/userList"><button
            type="button" class="btn btn-danger" id="btncancel">
            Cancel
          </button></a>         
		</form>
	</div>
</body>
</html>