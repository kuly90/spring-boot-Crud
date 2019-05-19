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
  </style>
</head>
<script type="text/javascript">
    $(document).ready(function(){
        var maxField = 10; //Input fields increment limitation
        var addButton = $('.add_button'); //Add button selector
        var wrapper = $('.field_wrapper'); //Input field wrapper
        var fieldHTML = '<div><input type="text" name="countryId" placeholder="enter country id"/>'
                      + '<input type="text" name="countryName" placeholder="enter country name"/>'
                      +' <a class="remove_button">'
                      +'<button class="btn btn-danger btnRemove"><span>x</span></button>'
                      +'</a></div>'; //New input field html 
        var x = 1; //Initial field counter is 1
        
        //Once add button is clicked
        $(addButton).click(function(){
            //Check maximum number of input fields
            if(x < maxField){ 
                x++; //Increment field counter
                $(wrapper).append(fieldHTML); //Add field html
            }
        });
        
        //Once remove button is clicked
        $(wrapper).on('click', '.remove_button', function(e){
            e.preventDefault();
            $(this).parent('div').remove(); //Remove field html
            x--; //Decrement field counter
        });
    });
</script>

<body>
    
    <div class="container">
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
        <a class="add_button" title="Add field">
            <button class="btn btn-primary btnAdd"><span>+</span></button>
        </a>
        <c:url var = "action" value="/saveCountry"/>
        <a onclick="saveCountry('${action}');">
            <button class="btn btn-primary ">Submit</button>
        </a>
    </div>
</body>
<script>
    function saveCountry(action){
        var form = document.getElementsByClassName('field_wrapper')[0];
        var countryIdArr = [];
        var countryNameArr = [];
        var check = false;
        var countryIdNode = document.getElementsByName('countryId');
        var arrayIdList = Array.prototype.slice.call(countryIdNode);
        for(var i=0; i<arrayIdList.length; i++){
            if(arrayIdList[i].value == '' || arrayIdList[i].value.length == 0){
                check = true;
                break;
            }
        }
        
        var countryNameNode = document.getElementsByName('countryName');
        var arrayNameList = Array.prototype.slice.call(countryNameNode);
        for(var i=0; i<arrayNameList.length; i++){
            if(arrayNameList[i].value == '' || arrayNameList[i].value.length == 0){
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
</html>