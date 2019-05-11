function addUser(action) {
    var formAdd = document.getElementById('formAdd');
    checkValidateUser(action, formAdd);
}

function editUser(action) {
    var formEdit = document.getElementById('formEdit');
    checkValidateUser(action, formEdit);
}

function checkValidateUser(action,form) {
			var userId = document.getElementById('userId').value;
			var name = document.getElementById('name').value;
			var phoneNumber = document.getElementById('phoneNumber').value;
			var birthday = document.getElementById('datepicker').value;
			var email = document.getElementById('email').value;
			var error = false;
			// check validat userId
			if(userId == ''){
				document.getElementById('errUserId').innerHTML = 'userId must not empty.';
				error = true;
			}else{
				document.getElementById('errUserId').innerHTML = '';
			}
			
			
			// check validat Birthday
			if(birthday == ''){
				document.getElementById('errBirthday').innerHTML = 'Birthday must not empty.';
				error = true;
			}else{
				document.getElementById('errBirthday').innerHTML = '';
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
			
			//check validate phone Number
			if(phoneNumber == ''){
				document.getElementById('errPhoneNumber').innerHTML = 'phone Number must not empty.';
				error = true;
			}else{
				if(!validateNumber(phoneNumber)){
					document.getElementById('errPhoneNumber').innerHTML = 'phone Number must not exists character.';
					error = true;
				}else{
					document.getElementById('errPhoneNumber').innerHTML = '';
				}
			}
			
			//check validate email
			if(email == ''){
				document.getElementById('errEmail').innerHTML = 'email must not empty.';
				error = true;
			}else{
				if(!validateEmail(email)){
					document.getElementById('errEmail').innerHTML = 'email must not exists character.';
					error = true;
				}else{
					document.getElementById('errEmail').innerHTML = '';
				}
			}
			
			if(!error){
				var form = document.getElementById(form);
				form.action = action;
				form.submit();
			}
			
		}
		
		function validateString(str){ 
			str = str.replace(/\s/g, '');
		    var re = /^[A-Za-z]+$/;
		    var e = re.test(str);
		    return re.test(str);      
		}
		
		function validateNumber(str){  
			str = str.replace(/\s/g, '');
		    var re = /^[0-9]+$/;
		    var e = re.test(str);
		    return re.test(str);      
		}
		
		
		function validateEmail(email) {
			var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			return re.test(email);
		   };