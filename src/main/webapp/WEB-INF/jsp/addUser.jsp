<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
    <script>
        $( function() {
            $( "#datepicker" ).datepicker({
                dateFormat:'yy/mm/dd'
                });
          });
    </script>
    <jsp:include page="navbar.jsp"></jsp:include>
    <body>
        <div class="container">
            <h2>Add User</h2>
            <p style="color: green;">${msg}</p>
            <p style="color: red;">${addFail}</p>
            <form:form id="formAdd" method = "POST" modelAttribute="userForm">
                  <div class="form-group">
                <label >User Id:</label>
                <input type="text" name ="userId" class="form-control" id="userId" value="${userForm.userId}"/>
                <p id="errUserId">${errUserId}</p>
            </div>
            <div class="form-group">
                <label >Name:</label> 
                <input type="text" class="form-control" name="name" id="name" value="${userForm.name}"/>
                <p id="errName"></p>
            </div>
            <div class="form-group">
                <label >Birthday:</label>
                <input type="text" class="form-control" name="birthday" style="background-color: white; width: 25%;"
                       id="datepicker" readonly placeholder="yyyy/mm/dd" value="${userForm.birthday}"/>
                <p id="errBirthday"></p>
            </div>
            <div class="form-group">
                <label>Email Address:</label>
                <input type="text" class="form-control" name="email" id="email" value="${userForm.email}"/>
                <p id="errEmail"></p>
            </div>
            <div class="form-group">
                <label >Phone Number:</label>
                <input type="text" class="form-control" name="phoneNumber" id="phoneNumber" value="${userForm.phoneNumber}"/>
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
                <a onclick="clearInput();"><button
                type="button" class="btn btn-warning" id="btncancel">
                Clear
              </button></a>
            </form:form>
    
        </div>
    </body>
    <script src="${contextPath}/resources/js/validate.js"></script>
        
</html>