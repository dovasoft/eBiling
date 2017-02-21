

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>


<html><head>
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

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
$(document).ready(function() {
$('#menuDiv').hide;

});
function validateLogin(){
	// data = {};
	 
	//data["regName"] = $("#regName").val();
	//data["password"] = $("#password").val();
	if($('#email').val().length == 0) {
    	
	    $('#email').css('color','red');
	    $("#email").css("border-color","red");
	    $("#email").attr("placeholder","Please enter email");
	    $('#email').addClass('your-class');
	    $('#unc').text("Please enter valid emailid.");
	     $('#unc').show();
	     $("#unc").fadeOut(10000);
	    setTimeout(function(){$('#email').focus();},0);
	    return false;
	    }
	else if($('#password').val().length == 0 ) {
		$('#password').css('color','red');
		$("#password").css("border-color","red");
		$("#password").attr("placeholder","Password is Required");
		$('#password').addClass('your-class');
		     			 
		 return false;
	}	
	
	$.ajax({
           type: "POST",
           url: "validateLogin.htm",
           data:  "email= "+$("#email").val()+"&password="+$("#password").val(),
           success: function (response) {
        	   $("#unc").text('login sucessfully');
        	   $("#unc").show();
            	 $("#unc").fadeOut(5000);
        	   console.log('response'+response);
        	   if(response == 'Invalid Username and Pwd'){
        		     $("#unc").text('login Failed');
        		     $("#unc").show();
                	 $("#unc").fadeOut(5000);
					 $("#email").val("");
					 $("#password").val("");
        		}else if(response == 'Unable to login'){
	        				$("#unc").text('login Failed');
	       		    	 	$("#unc").show();
	               	 		$("#unc").fadeOut(5000);
							$("#email").val("");
							$("#password").val("");
        		}else {
        		  	 $("#unc").text('login sucessfully');
             	  	 $("#unc").show();
                  	 $("#unc").fadeOut(5000);
					 $("#email").val("");
					 $("#password").val("");
        		   window.location.href="/eBilling/productHome";
        		}
           }
              

	}); 
}

function dataClear() {
	$("#email").val("");
	 $("#password").val("");
}

</script>
<script type="text/javascript">
$(document).ready(function() {
	$('#email').focus();
	$('#login').click(function(event) {
		
		 if($('#email').val().length == 0  || $('#password').val().length == 0  ){			    
		 if($('#email').val().length == 0 ) {
		    $('#email').css('color','red');
		    $("#email").css("border-color","red");
		    $("#email").attr("placeholder","UserName is Required");
		    $('#email').addClass('your-class');
		     			    } 
		 if($('#password').val().length == 0 ) {
			$('#password').css('color','red');
			$("#password").css("border-color","red");
			$("#password").attr("placeholder","Password is Required");
			$('#password').addClass('your-class');
			     			 }
			 return false;
		}	

	});
});

function removeBorder(el){
	 $("#"+el).css("border", "2px solid #767676"); 	 
	  $("#"+el).css('color','black');
	  $('#'+el).addClass('default-class'); 
}
function addBorder(el){
	 $("#"+el).css("border", "1px solid #AAA"); 	 
	  $("#"+el).css('color','black');
	  $('#'+el).addClass('default-class'); 
}

$(function() {
    var button = $('#loginButton');
    var box = $('#loginBox');
    var form = $('#loginForm');
    button.removeAttr('href');
    button.mouseup(function(login) {
        box.toggle();
        button.toggleClass('active');
    });
    form.mouseup(function() { 
        return false;
    });
    $(this).mouseup(function(login) {
        if(!($(login.target).parent('#loginButton').length > 0)) {
            button.removeClass('active');
            box.hide();
        }
    });
});



</script>


<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>User Login</h2>
        <form name="cf_form" method="post" id="loginForm" onsubmit="return false;">
            <div class="login-block">                
                <div class="login-un">
                    <label class="login-label-text">User Name</label>
                    <input class="input-login" type="text" name="cperson"  value="" id="email" onkeydown="removeBorder(this.id);" style="margin-bottom:10px;" />
                </div>
                <div class="login-pwd">
                    <label class="login-label-text">Password</label>
                    <input class="input-login" type="password" name="cnumber" value="" id="password" onkeydown="removeBorder(this.id);" style="margin-left:12px; width: 233px;" />
                </div>
                <!-- <div class="blck-login"> 
                	<a href="resetPasswordHome" class="login-links" style="padding-right:36px;">Reset Password</a>  | <a href="registration" class="login-links" style="padding-left:29px;">Register</a> 
                </div>    -->         
            </div>
            <div class="block-footer">
                <aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
                    <input class="btn-save" name="" id="login" value="Login" type="submit" onclick="validateLogin();">
                </aside>
            </div>
        </form>
    </div>

</div>
<!-- END: MAIN CONTENT --> 
</body></html>
