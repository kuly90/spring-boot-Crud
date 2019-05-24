<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<html lang="en">
    <head>
        <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
        <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'>
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
    
    <body>
        <div class="container">
            <jsp:include page="navbar.jsp"></jsp:include>
            <h2 style="text-align: center;">User List</h2>
            <div id="search">
                <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Enter Key Search..." title="Type in a name">
            </div>
            <table class="table" id="myTable">
                <thead>
                    <tr>
                        <th>User Id
                            <c:url var="position0" value="0"/>
                            <c:url var="sort1" value="asc"/>
                            <button type="button" onclick="sortName('${sort1}','${position0}')"><span class="fas fa-angle-up"></span></button>
                            <c:url var="sort2" value="desc"/>
                            <button type="button" onclick="sortName('${sort2}','${position0}')"><span class="fas fa-angle-down"></span></button>
                        </th>
                        <th>Name 
                            <c:url var="position1" value="1"/>
                            <c:url var="sort1" value="asc"/>
                            <button type="button" onclick="sortName('${sort1}','${position1}')"><span class="fas fa-angle-up"></span></button>
                            <c:url var="sort2" value="desc"/>
                            <button type="button" onclick="sortName('${sort2}','${position1}')"><span class="fas fa-angle-down"></span></button>
                        </th>
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
        <script type="text/javascript">
            function sortName(typeSort, position){
                var table, rows, switching, i, x, y, shouldSwitch;
                table = document.getElementById("myTable");
                switching = true;
                while (switching) {
                    switching = false;
                    rows = table.rows;
                    for (i = 1; i < (rows.length - 1); i++) {
                      shouldSwitch = false;
                      x = rows[i].getElementsByTagName("TD")[position];
                      y = rows[i + 1].getElementsByTagName("TD")[position];
                      
                      if(typeSort == 'asc'){
                          if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
                              shouldSwitch = true;
                              break;
                            }
                      }else if(typeSort == 'desc'){
                          if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
                              shouldSwitch = true;
                              break;
                            }
                      }
                    }
                    if (shouldSwitch) {
                     rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                     switching = true;
                    }
                }
            }
        </script>
    </body>
</html>