<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
<head>
<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<link href="${contextPath}/resources/css/listUser.css" rel="stylesheet">
<script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function(){
	  $("#myInput").on("keyup", function() {
	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(function() {
	      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
	    });
	  });
	});
</script>
<title>List User</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
	<div class="container">
		<h2 style="text-align: center;">User List</h2>
		<div id="search">
			<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Key Search..." title="Type in a name">
		</div>
		
		<table class="table" id="myTable">
			<thead>
				<tr>
					<th>User Id</th>
					<th>Name</th>
					<th>Phone Number</th>
					<th>Email Address</th>
					<th>Birthday</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.userId}</td>
						<td>${user.name}</td>
						<td>${user.phoneNumber}</td>
						<td>${user.email}</td>
						<td>${user.birthday}</td>
						<td style="white-space: nowrap;">
							<a href="${contextPath}/update?userId=${user.userId}">
								<button type="button"
								class="btn btn-sm btn-primary confirm-button"
								style="width: 60px">Update</button>
							</a>
							<c:url var="action" value="/delete" />
						    <a onclick="confirmDel('${user.userId}','${user.name}','${action}');">
								<button type="button"
								class="btn btn-sm btn-danger"
								style="width: 60px" >Delete</button>
						</a>
						</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="${contextPath}/resources/js/validate.js"></script>
</body>

</html>