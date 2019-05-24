<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
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
            .btnAdd, .btnRemove{
                border-radius: 50%;
                font-size:50%;
            }
            input[type="text"]{
                margin:.7em;
            }
            span{
                font-size:180%;
                font-weight:bold;
            }
            #list1, #list2 {
                border:1px solid black;
                height: 15em;
                background-color:silver;
            }
            #btn-move{
                padding-top:6%;
                padding-left:2.4%;
            }
            #btn-move .btn{
                margin:5%;
            }
            .divChoose1,.divChoose2{
                background-color:orange;
            }
            h6{
                border-bottom: 1px dotted black;
                text-align: center;
                margin-bottom: 2%;
            }
            #movelist #list1 div p, #movelist #list2 div p {
                margin: 0px 0px 0px 0px;
            }
        </style>
    </head>
    <script type="text/javascript">
        $(document).ready(function(){
            var maxField = 10; 
            var addButton = $('.add_button'); 
            var wrapper = $('.field_wrapper'); 
            var fieldHTML = '<div><input type="text" name="countryId" placeholder="enter country id"/>'
                          + '<input type="text" name="countryName" placeholder="enter country name"/>'
                          +' <a class="remove_button">'
                          +'<button class="btn btn-danger btnRemove"><span>x</span></button>'
                          +'</a></div>'; 
            var x = 1;
            
            $(addButton).click(function(){
                if(x < maxField){ 
                    x++;
                    $(wrapper).append(fieldHTML);
                }
            });
            
            $(wrapper).on('click', '.remove_button', function(e){
                e.preventDefault();
                $(this).parent('div').remove();
                x--;
            });
        });
    </script>
    
    <body>
        <div class="container">
            <div>
                <jsp:include page="navbar.jsp"></jsp:include>
                <h2>ADD COUNTRY</h2>
                <p id="errMsg" style="color:red;">${errMsg}</p>
                <p style="color:green">${msg}</p>
                <form class="field_wrapper" method = "POST">
                    <div>
                        <input type="text" name="countryId" placeholder="enter country id"/>
                        <input type="text" name="countryName" placeholder="enter country name"/>
                    </div>
                </form>
                
                <c:url var = "action" value="/saveCountry"/>
                <a onclick="saveCountry('${action}');" style="margin-left: 1%">
                    <button class="btn btn-primary ">Submit</button>
                </a>
                <a class="add_button" title="Add field" style="margin-left: 28%;">
                    <button class="btn btn-primary btnAdd"><span>+</span></button>
                </a>
            </div><br/>
            <div>
                <p id="errDel" style="margin-left: 25%;color: red;"></p>
            </div>
            <div id="movelist" class="row">
                <div id="list1" class="col-md-2">
                    <h6>List Country</h6>
                    <c:forEach var="item" items="${listCountry}">
                        <div>
                            <input type="hidden" value="${item.countryId}"/>
                            <p>${item.countryName}</p>
                        </div>
                    </c:forEach>
                </div>
                <div id="btn-move" class="col-md-1">
                <c:url var="area1" value=".divChoose1"/>
                    <a onclick="moveItem('${area1}')"><button class="btn"><i class='fas fa-angle-double-right'></i></button></a><br/>
                    <c:url var="area2" value=".divChoose2"/>
                    <a onclick="moveItem('${area2}')"><button class="btn"><i class='fas fa-angle-double-left'></i></button></a>
                </div>
                <div id="list2" class="col-md-2">
                    <h6>Delete</h6>
                    <form id="formDel" method='POST' action="/delCountry">
                    </form>
                    
                </div>
            </div>
            <br/>
            <div class="row" style="position: relative;">
                <input style="position: absolute; left: 35%;" type ="button" value="Delete" class="btn btn-danger" onclick="delCountry()"/>
            </div>
        </div>
        
    </body>
    <script>
        function saveCountry(action){
            var form = document.getElementsByClassName('field_wrapper')[0];
            var check = false;
            var arrayIdList = Array.prototype.slice.call(document.getElementsByName('countryId'));
            for(var i=0; i<arrayIdList.length; i++){
                if(arrayIdList[i].value == '' || arrayIdList[i].value.length == 0){
                    check = true;
                    break;
                }
            }
            var arrayNameList = Array.prototype.slice.call(document.getElementsByName('countryName'));
            for(var i=0; i<arrayNameList.length; i++){
                if(arrayNameList[i].value == '' || arrayNameList[i].value.length == 0 || check){
                    check = true;
                    break;
                }
            }
            if(!check){
                form.action = action;
                form.submit();
            }else{
                document.getElementById('errMsg').innerHTML = 'Field must not be Empty, Try again!'
            }
        }
    </script>
    <script>
        $(document).ready(function() {
             $('#list1').on( 'click', 'div', function () {
                 $(this).toggleClass('divChoose1');
             } );
             
             $('#list2').on( 'click', 'div', function () {
                 $(this).toggleClass('divChoose2');
             });
         });
             
         function moveItem(area){
             var div = $(area);
             for(var i = div.length - 1; i >= 0; i--){
                 var countryId = div[i].getElementsByTagName('input')[0].value;
                 var countryName = div[i].getElementsByTagName('p')[0].innerHTML;
                 if(area == '.divChoose1'){
                     var newDiv = '<div> <input name="countryId" type="hidden" value="' + countryId + '" />'
                                + '<p>' + countryName + '</p> </div>';
                     $('#formDel').append(newDiv);
                     $(area)[i].remove();
                 }else if(area == '.divChoose2'){
                     var newDiv = '<div> <input type="hidden" value="' + countryId + '" />'
                                + '<p>' + countryName + '</p> </div>';
                     $('#list1').append(newDiv);
                     $(area)[i].remove();
                 }
             }
         }    

         function delCountry(){
             var listNode = document.getElementsByName('countryId');
             var listArr = Array.prototype.slice.call(listNode);
             var err = false;
             if(listArr.length > 0){
                 for(var i = 0; i < listArr.length; i++){
                    var child = listArr[i].value;
                     if(!child){
                         err = true;
                     }else{
                         err = false;
                     }
                 }
             }else{
                 document.getElementById('errDel').innerHTML = 'No item choosed to delete!';
             }
             if(err){
                 document.getElementById('errDel').innerHTML = 'No item choosed to delete!';
             }else{
                 var formDel = document.getElementById('formDel');
                 formDel.submit();
             }
         }
    </script>
</html>