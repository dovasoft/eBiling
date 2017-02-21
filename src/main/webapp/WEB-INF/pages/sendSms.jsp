<!DOCTYPE >
<html>
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>
</head>
<body>

<script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/CustomPagenation.js"></script> 
 <script type="text/javascript" src="js/product.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	
});

function dataClear(){
	$("#message").val("");
}
function sendSms(){
	data = {};
	data["message"] = $("#message").val();
	data["sendTo"] = $("#sendTo").val();
	if($('#message').val().length == 0 ) {
	    $('#message').css('color','red');
	    $("#message").css("border-color","red");
	    $("#message").attr("placeholder","Please Enter Message");
	    $('#message').addClass('your-class');
	    return false;
	    }
	$.ajax({
        type: "POST",
        url: "sendSms.htm",
        data: "jsondata= "+JSON.stringify(data),
        success: function (response) {
       		 if(response != "" ){
	       		$("#unc").text('Send Sucessfully');
	       	  	$("#unc").show();
	       	  	$("#unc").fadeOut(15000);
	       	 $("#message").val("");
       		 }
            },
        error: function (e) { 
            $("#btn-save").prop("disabled", false);
        }

}); 
}

</script>
		
		<section class="container">
			<div class="block" id="" style=" margin-bottom: 1px; margin-left: 2px; margin-right: 17px; margin-top: 5px;">
				<h2><span class="icon1">&nbsp;</span>Send Sms</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal"  onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="" >
							<label>Message</label>
							 <textarea rows="4" cols="30" name="message" id="message" ></textarea>
						</div>
						<div class="block-searchbill-input">
							<label>Send To</label>
							<select id="sendTo" name="sendTo"    tabindex="2"  />
                        <option value="0">Purchaser</option>
                        <option value="1">Custmor</option>
                    </select>
						</div> 
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="Clear"  name="Cancel" type="button" onclick="dataClear();" >
                    <input class="btn-save" value="Submit" id="Submit" type="button" onClick="sendSms();">
						</aside>
					</div>
				</form>
			</div>
			
</section>
		
</body>
</html>


		
