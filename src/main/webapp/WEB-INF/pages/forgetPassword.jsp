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
		
		
	});
 function forgetPassword() {
 	data = {};
 	data["forgetEmail"] = $("#forgetEmail").val();
 	data["forgetMobileNo"] = $("#forgetMobileNo").val();

 	$.ajax({   
 		method: 'POST',			
 		   url: 'forgetPassword.htm',
 		   data:"jsondata= "+JSON.stringify(data), 
 		   success: function(data) {
 			  $("#forgetEmail").val("");
 			 $("#forgetMobileNo").val("");
 			   if(data != ""){
 				   resJSON=JSON.parse(data);
 				   if(resJSON.status == "ERROR"){
 					  console.log(data);
 		 			  	$("#unc").text('Please Enter Valid EmailId And Password.');
 		       	   		$("#unc").show();
 		           	 	$("#unc").fadeOut(10000);
 				   }else{
 					  	$("#unc").text('Password sent Your email suceefully.');
		       	   		$("#unc").show();
		           	 	$("#unc").fadeOut(10000);
 				   }
 			   
 			   }
 		}
 	});
 }
 function dataClear() {
	 $("#forgetEmail").val("");
		 $("#forgetMobileNo").val("");
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
			
			<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Forget Password</h2>
        <form name="cf_form" method="post" id="loginForm" onsubmit="return false;">
            <div class="login-block">                
                <div class="login-un">
                    <label class="login-label-text" style="margin-right:43px; font-size: 15px;">Email:</label>
                    <input class="input-login" type="text" name="forgetEmail"  value="" id="forgetEmail" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%;margin-left:11%"/>
                </div>
                <div class="login-un">
                    <label class="login-label-text" style="margin-right:43px;     font-size: 15px;" >MobileNo:</label>
                    <input class="input-login" type="text" name="forgetMobileNo"  value="" id="forgetMobileNo" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;width: 53%; margin-left:-12%" />
                </div>
                           
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
                    <input class="btn-save" name="" id="forget" value="submit" type="submit" onclick="forgetPassword();">
                </aside>
            </div>
        </form>
    </div>

</div>
<!-- END: MAIN CONTENT --> 
</body>