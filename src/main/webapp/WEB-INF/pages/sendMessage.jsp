<!DOCTYPE >
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head><body>

<script type="text/javascript">
function sendSms() {
	alert('data........');
	data = {};
	data["sendAaddress"] = $("#sendAaddress").val();
	$.ajax({   
		method: 'POST',			
		   url: 'sendMessage.htm',
		   data:"jsondata= "+JSON.stringify(data), 
		   success: function(data) {
			   console.log("sendSmssendSmssendSmssendSms");
		}
	});
}

</script>


		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>UploadPage Info<aside class="block-footer-right sucessfully" id="unc2" style="display:none;" >Delete Sucessfully</aside></h2>
				<form name="cf_form" method="post" onsubmit="return false;" id="contact-form" >
					
					
						<div class="block-searchbill">
					     <div class="block-searchbill-input last">
							<label>Send SMS</label>
							<textarea rows="4" cols="" name="address"  id="sendAaddress" onsubmit="return false;"></textarea>
						</div>
						</div>
						
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button" >
							<input class="btn-save" name="" value="Send" id="sendId" type="button" onclick=" sendSms();">
						</aside>
					</div>
				</form>
			</div>
			
		</section>
</body>