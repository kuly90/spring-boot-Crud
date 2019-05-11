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
		<form id="formAdd" method = "POST">
			<div class="form-group">
				<label for="email">User Id:</label> <input type="text"
					class="form-control" placeholder="Enter User Id"
					name="userId" id="userId">
					<p id="errUserId">${errUserId}</p>
			</div>
			<div class="form-group">
				<label for="pwd">Name:</label> 
				<input type="text"
					class="form-control" placeholder="Enter name"
					name="name" id="name">
					<p id="errName"></p>
			</div>
			<div class="form-group">
				<label for="pwd">Year Old:</label> <input type="text"
					class="form-control" placeholder="Enter year Old"
					name="yearOld" id="yearOld">
					<p id="errYearOld"></p>
			</div>
			<a onclick="addUser();"><button
            type="button" class="btn btn-primary" id="btncancel">
            Add
          </button></a>
          <a href="${contextPath}/userList"><button
            type="button" class="btn btn-danger" id="btncancel">
            Cancel
          </button></a>         
		</form>
	</div>
</body>
<script type="text/javascript">
	function addUser() {
		var userId = document.getElementById('userId').value;
		var name = document.getElementById('name').value;
		var yearOld = document.getElementById('yearOld').value;
		var error = false;
		// check validat userId
		if(userId == ''){
			document.getElementById('errUserId').innerHTML = 'userId must not empty.';
			error = true;
		}else{
			document.getElementById('errUserId').innerHTML = '';
		}
		
		//check validate name
		if(name == ''){
			document.getElementById('errName').innerHTML = 'name must not empty.';
			error = true;
		}else{
			if(!validateString(name)){
				document.getElementById('errName').innerHTML = 'name must not exists number.';
				error = true;
			}else{
				document.getElementById('errName').innerHTML = '';
			}
		}
		
		//check validate year Old
		if(yearOld == ''){
			document.getElementById('errYearOld').innerHTML = 'yearOld must not empty.';
			error = true;
		}else{
			if(!validateNuber(yearOld)){
				document.getElementById('errYearOld').innerHTML = 'yearOld must not exists character.';
				error = true;
			}else{
				document.getElementById('errYearOld').innerHTML = '';
			}
		}
		
		if(!error){
			var formAdd = document.getElementById('formAdd');
			formAdd.action = '/save';
			formAdd.submit();
		}
		
	}
	
	function validateString(str){ 
		str = str.replace(/\s/g, '');
	    var re = /^[A-Za-z]+$/;
	    var e = re.test(str);
	    return re.test(str);      
	}
	
	function validateNuber(str){  
		str = str.replace(/\s/g, '');
	    var re = /^[0-9]+$/;
	    var e = re.test(str);
	    return re.test(str);      
	}

</script>
</html>