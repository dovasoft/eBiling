<!DOCTYPE section PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>

<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
.login-block {
	font-family: 'Open Sans', sans-serif;
	background: #092756;
	background: -moz-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%),-moz-linear-gradient(top,  rgba(57,173,219,.25) 0%, rgba(42,60,87,.4) 100%), -moz-linear-gradient(-45deg,  #670d10 0%, #092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -webkit-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -webkit-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -o-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -o-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -o-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -ms-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), -ms-linear-gradient(top,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), -ms-linear-gradient(-45deg,  #670d10 0%,#092756 100%);
	background: -webkit-radial-gradient(0% 100%, ellipse cover, rgba(104,128,138,.4) 10%,rgba(138,114,76,0) 40%), linear-gradient(to bottom,  rgba(57,173,219,.25) 0%,rgba(42,60,87,.4) 100%), linear-gradient(135deg,  #670d10 0%,#092756 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#3E1D6D', endColorstr='#092756',GradientType=1 );
}
</style>

</head><body>

<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<script type="text/javascript" src="js/jquery.min.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
 
 <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
 <script type="text/javascript">

 $(document).ready(function() {
		var lstOrders ='${sessionScope.allPurchaseInfo}';
		//showPurchaseData(JSON.parse(lstOrders));
		
		
	});
 function resetPassword() {
 	data = {};
 	data["mobileNoEmail"] = $("#mobileNoEmail").val();
 	data["oldPassword"] = $("#oldPassword").val();
 	data["newPassword"] = $("#newPassword").val();
 	
 	 if(!$('#mobileNoEmail').val().match(/^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i) ) {
    	
	    $('#mobileNoEmail').css('color','red');
	    $("#mobileNoEmail").css("border-color","red");
	    $("#mobileNoEmail").attr("placeholder","Please enter email");
	    $('#mobileNoEmail').addClass('your-class');
	    $('#unc').text("Please enter valid emailid.");
	     $('#unc').show();
	     $("#unc").fadeOut(10000);
	    setTimeout(function(){$('#mobileNoEmail').focus();},0);
	    return false;
	    }
 	else if($('#newPassword').val().length <=5 ) {
 	    $('#newPassword').css('color','red');
 	    $("#newPassword").css("border-color","red");
 	    $("#newPassword").attr("placeholder","Please enter newPassword");
 	    $('#newPassword').addClass('your-class');
 	   $("#unc").text('Please Enter Minimum 6 Charecters');
	   		$("#unc").show();
  	 	$("#unc").fadeOut(15000);
 	    setTimeout(function(){$('#newPassword').focus();},0);
 	    return false;
 	    }
 	else if($('#oldPassword').val().length <=0 ) {
 	    $('#oldPassword').css('color','red');
 	    $("#oldPassword").css("border-color","red");
 	    $("#oldPassword").attr("placeholder","Please enter oldPassword");
 	    $('#oldPassword').addClass('your-class');
 	    setTimeout(function(){$('#newPassword').focus();},0);
 	    return false;
 	    }

 	 else if($('#confirmPassword').val().length <=0 ) {
 		    $('#confirmPassword').css('color','red');
 		    $("#confirmPassword").css("border-color","red");
 		    $("#confirmPassword").attr("placeholder","Please enter confirmPassword");
 		    $('#confirmPassword').addClass('your-class');
 		    setTimeout(function(){$('#confirmPassword').focus();},0);
 		    return false;
 		 }else if ($('#newPassword').val() != $('#confirmPassword').val()) {
 			     $('#unc').show();
 			     $('#unc').text("Passwords do not match.");
 			     $("#unc").fadeOut(25000);
 	          return false;
 	 } 
 	$.ajax({   
 		method: 'POST',			
 		   url: 'resetPassword.htm',
 		   data:"jsondata= "+JSON.stringify(data), 
 		   success: function(data) {
 			  $("#mobileNoEmail").val("");
 			 $("#oldPassword").val("");
 			 $("#newPassword").val("");
 			 $("#confirmPassword").val("");
 			   if(data != ""){
 				   resJSON=JSON.parse(data);
 				   if(resJSON.status == "ERROR"){
 					  console.log(data);
 		 			  	$("#unc").text('Sucessfully Reset Your Password. Login with New Password.');
 		       	   		$("#unc").show();
 		           	 	$("#unc").fadeOut(10000);
 		           	window.location.href = "loginHome";
 				   }else{
 					  	$("#unc").text('Please Enter Valid EmailId');
		       	   		$("#unc").show();
		           	 	$("#unc").fadeOut(10000);
 				   }
 			   
 			   }
 		}
 	});
 }
 function dataClear() {
	 $("#mobileNoEmail").val("");
		 $("#oldPassword").val("");
		 $("#newPassword").val("");
		 $("#confirmPassword").val("");
}
 
 
 /* if($('#newPassword').val().length <=3 ) {
    $('#newPassword').css('color','red');
    $("#newPassword").css("border-color","red");
    $("#newPassword").attr("placeholder","Please enter newPassword");
    $('#newPassword').addClass('your-class');
    setTimeout(function(){$('#newPassword').focus();},0);
    //return false;
    }

 else if($('#confirmPassword').val().length ==0 ) {
	    $('#confirmPassword').css('color','red');
	    $("#confirmPassword").css("border-color","red");
	    $("#confirmPassword").attr("placeholder","Please enter confirmPassword");
	    $('#confirmPassword').addClass('your-class');
	    setTimeout(function(){$('#confirmPassword').focus();},0);
	   // return false;
	 }else if ($('#newPassword').val() != $('#confirmPassword').val()) {
		     $('#unc').show();
		     $('#unc').text("Passwords do not match.");
		     $("#unc").fadeOut(10000);
          return false;
 } */
 
 </script>
	<!-- 	<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>Reset Password</h2>
				<form name="cf_form" method="post" id="contact-form"  onsubmit="return false;">
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>Mobile No/Email:</label>
							<input type="text" name="mobileEmail" id="mobileNoEmail" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>OldPassword:</label>
							<input type="text" name="oldPassword" id="oldPassword" onkeyup="removeError(this.id);">
						</div> 
					</div>
					<div class="block-searchbill">
					<div class="block-searchbill-input ">
							<label>NewPassword:</label>
							<input type="text" name="newPassword" id="newPassword" onkeyup="removeError(this.id);">
						</div>
					<div class="block-searchbill-input last">
							<label>ConfirmPassword:</label>
							 <input type="text" name="confirmPassword" id="confirmPassword"> 
						</div>
						</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button">
							<input class="btn-save" name="" value="Save" type="submit" onclick="resetPassword();">
						</aside>
					</div>
				</form>
			</div>
			</section> -->
			
			<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>User ResetForm</h2>
        <form name="cf_form" method="post" id="loginForm" onsubmit="return false;">
            <div class="login-block">                
                <div class="login-un">
                    <label class="login-label-text" style="margin-right: 48px;margin-left: 73px;font-size: 15px;">Email:</label>
                    <input class="input-login" type="text" name="mobileNoEmail"  value="" id="mobileNoEmail" onkeydown="removeBorder(this.id);" style="margin-bottom: 9px;width: 53%;margin-left: -8%;"/>
                </div>
                <div class="login-un">
                    <label class="login-label-text" style="margin-right:43px;margin-left: -13px;font-size: 15px;" >OTP/OldPassword:</label>
                    <input class="input-login" type="password" name="oldPassword"  value="" id="oldPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53.5%;margin-left: -7%;" />
                </div>
                <div class="login-un">
                    <label class="login-label-text" style="margin-right:43px;margin-left: 17px;font-size: 15px;">NewPassword:</label>
                    <input class="input-login" type="password" name="newPassword"  value="" id="newPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53.5%;margin-left: -7.2%;" />
                </div>
                <div class="login-un">
                    <label class="login-label-text" style="margin-right:26px;margin-left: -5px;font-size: 15px;">ConfirmPassword:</label>
                    <input class="input-login" type="password" name="confirmPassword"  value="" id="confirmPassword" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53.6%;margin-left: -3%;" />
                </div>
               <!--  <div class="login-pwd">
                    <label class="login-label-text">OldPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);"  style="margin-left: 37px;width: 54%;" />
                </div>
                 <div class="login-pwd">
                    <label class="login-label-text">NewPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);" style="margin-left:10px;" />
                </div>
                 <div class="login-pwd">
                    <label class="login-label-text">ConfirmPassword</label>
                    <input class="input-login" type="text" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);" style="margin-left:10px;" />
                </div> -->
               <!--  <div class="blck-login"> 
                	<a href="#" class="login-links" style="padding-right:36px;">Forgot Password</a>  | <a href="registration" class="login-links" style="padding-left:29px;">Register</a> 
                </div> -->            
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
                    <input class="btn-save" name="" id="login" value="Submit" type="submit" onclick="resetPassword();">
                </aside>
            </div>
        </form>
    </div>

</div>
<!-- END: MAIN CONTENT --> 
</body>