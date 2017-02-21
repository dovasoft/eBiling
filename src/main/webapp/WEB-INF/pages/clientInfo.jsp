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

<!-- <script type="text/javascript" src="js/jquery-1.7.min.js"></script> -->
<script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/clientInfo.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
 <script type="text/javascript">
 $(document).ready(function() {
		var lstClientInfo = '${allClientInfo}';
		lstClientInfo = lstClientInfo.replace(/\\/g, "////");
		showClientData(JSON.parse(lstClientInfo));
		
		
		
		$("#regName").keypress(function() {
			var textbox = document.getElementById("regName");
			if (textbox.value.length < 3){
		    	
		    	 $("#unc").text(' min 3 characters reqiured');
		        	$("#unc").show();
		           	$("#unc").fadeOut(2000);
		    } else {
		    	
		    }
		}); 
		
		
	    $('#regName').keypress(function (e) {
	        var regex = new RegExp("^[a-zA-Z]+$");
	        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	        if (regex.test(str)) {
	            return true;
	        }
	        else
	        {
	        e.preventDefault();
	        //alert('Please Enter Alphabate');
	        $("#unc").text('Please Enter Alphabates');
        	$("#unc").show();
           	$("#unc").fadeOut(2000);
	        return false;
	        }
	    });
		
		 $('#mobileNo').keypress(function (e) {
	        var regex = new RegExp("^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$");
	        //var regex = new RegExp("/^(\+91-|\+91|0)?\d{10}$/");
	       
	        var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
	        if (regex.test(str)) {
	            return true;
	        }
	        else
	        {
	        e.preventDefault();
	        //alert('Please Enter Alphabate');
	        $("#unc").text('Please Enter Numbers');
        	$("#unc").show();
           	$("#unc").fadeOut(2000);
	        return false;
	        }
	    });
		
		 $('#clientEmail').keyup(function() {
			    $('span.error-keyup-7').remove();
			    var inputVal = $(this).val();
			    var clientEmailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			    if(!clientEmailReg.test(inputVal)) {
			    	 $("#unc").text('Invalid Email Format.');
	        			$("#unc").show();
	           			$("#unc").fadeOut(2000);
			        return false;
			    }
			}); 
		
		
		
			
			
			
	});
 
 
 
 </script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>Client Info<aside class="block-footer-right sucessfully" id="unc2" style="display:none;" >Delete Sucessfully</aside></h2>
				<form name="cf_form" method="post" onsubmit="return false;" id="contact-form" >
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>Company Name</label>
							<input type="text" name="companyName" id="companyName" onkeyup="removeError(this.id);" >
							<input type="hidden" id="clientId">
						</div> 
						<div class="block-searchbill-input">
							<label>Email</label>
							<input type="text" name="clientEmail" id="clientEmail" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>Address</label>
							<!-- <input type="t" name="address" id="address"> -->
							<textarea rows="5" cols="" name="address" onkeyup="removeError(this.id);" id="address" onsubmit="return false;" style="width:52.2%;margin-top:10px;"></textarea>
						</div>
					</div>
					<div class="block-searchbill">
					
						<div class="block-searchbill-input last">
							<label>Contact Person</label>
							<input type="text" name="contactPerson" id="contactPerson" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>Contact Number</label>
							<input type="text" name="contactNo" id="contactNo" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input">
						  <label>Tin No</label>
							<input type="text" name="tinNo" id="tinNo" onkeyup="removeError(this.id);">
						</div>
						</div>
						<div class="block-searchbill">
					     <div class="block-searchbill-input last">
							<label>uploadlogo </label>
							<input type="file" name="uploadLogo" id="uploadLogo" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input last">
							<label>Sms Support</label>
							<input type="checkbox" name="smsSuport" id="smsSuport" onkeyup="removeError(this.id);" style="width: 8%;">
						</div>
						<div class="block-searchbill-input last">
							<label>Email Support</label>
							<input type="checkbox" name="emailSupport" id="emailSupport" onkeyup="removeError(this.id);" style="width: 8%;">
						</div>
						</div>
						<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>SmsURL</label>
							<input type="text" name="smsUrl" id="smsUrl" onkeyup="removeError(this.id);" >
							<input type="hidden" id="clientId">
						</div> 
						<div class="block-searchbill-input">
							<label>Sms UserName</label>
							<input type="text" name="smsUserName" id="smsUserName" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input">
							<label>Sms Password</label>
							<input type="text" name="smsPassword" id="smsPassword" onkeyup="removeError(this.id);">
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button" onclick="clientDataClear();">
							<input class="btn-save" name="" value="Save" id="saveId" type="button" onclick="clientUser();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Client Details<aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<li class="nine-box" style="width:75%;">UploadImage
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:150%;">Company Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:100%;">email
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>    
						<li class="five-box" style="width:125%;">Address
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>            
						<li class="ten-box" style="width:45%;">Edit</li>
						<li class="ten-box last" style="width:45%;">Delete</li>
					</ul>
					<div class="table-list-blk" id="userData">
						<!-- <ul>
							<li class="nine-box">Shirts</li>
							<li class="five-box">1,000</li>
							<li class="five-box">Nos</li>                    
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="ten-box last"><a href="#">Delete</a></li>
						</ul>
						<ul>
							<li class="nine-box">Phants</li>
							<li class="five-box">2,000</li>
							<li class="five-box">Mts</li>                    
							<li class="ten-box"><a href="#">Edit</a></li>
							<li class="ten-box last"><a href="#">Delete</a></li>
						</ul>    -->                                         
					</div>
				</div>
				<div class="block-footer">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
						<!-- <input class="btn-cancel" name="" value="Clear" type="button">
						<input class="btn-save" name="" value="Save" type="submit"> -->
					</aside>
				</div>
			</div>
		</section>
</body>