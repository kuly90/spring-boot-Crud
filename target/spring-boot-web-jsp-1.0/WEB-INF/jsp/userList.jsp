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
<title>List User</title>
</head>
<jsp:include page="navbar.jsp"></jsp:include>
<body>
	<div class="container">
		<h2 style="text-align: center;">User List</h2>
		<form action="${contextPath}/searchUser">
          <div class="input-group" style="margin: 28px 0px 10px 28px;width: 350px; float: right;">            
            <input type="text" class="form-control" name="searchVal" 
              placeholder="input id, name"/>         
              <input class="btn btn-primary btn-md" type="submit" value="Search"></input>
          </div>
        </form>
		<table class="table">
			<thead>
				<tr>
					<th>User Id</th>
					<th>Name</th>
					<th>Year Old</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${userList}">
					<tr>
						<td>${user.userId}</td>
						<td>${user.name}</td>
						<td>${user.yearOld}</td>
						<td style="white-space: nowrap;">
							<a href="${contextPath}/update?userId=${user.userId}">
								<button type="button"
								class="btn btn-sm btn-primary confirm-button"
								style="width: 60px">Update</button>
							</a>
						    <a href="${contextPath}/delete?userId=${user.userId}">
								<button type="button"
								class="btn btn-sm btn-danger confirm-button"
								style="width: 60px">Delete</button>
						</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>