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
 <script type="text/javascript" src="js/userRegister.js"></script>
 <!-- <script type="text/javascript" src="js/jquery-3.1.1.min.js"></script> -->
 <script type="text/javascript">
 $(document).ready(function() {
	 $("#regType").attr("disabled", "disabled");
	 $("#password").attr("disabled", "disabled");
	 $("#cPassword").attr("disabled", "disabled");
		//var lstOrders ='${allregInfo}';
		//showRegisterData(JSON.parse(lstOrders));
		$('#email').keyup(function() {
		       var inputVal = $(this).val();
		       var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
		       if(!emailReg.test(inputVal)) {
		           $("#unc").text('Invalid Email Format');
		           $("#unc").show();
		              $("#unc").fadeOut(2000);
		           return false;
		       }
		   });
		
		$('#regName').keypress(function (e) {
	        var regex = new RegExp("^[a-zA-Z ]+$");
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
		
		/*  $('#mobileNo').keyup(function() {
			    $('span.error-keyup-1').hide();
			    var inputVal = $(this).val();
			    var numericReg = /^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/;
			    if(!numericReg.test(inputVal)) {
			       // $(this).after('<span class="error error-keyup-1" style="color:blue">Numeric characters only.</span>');
			        return false;
			    }
			}); */
		 $('#email').keyup(function() {
			    $('span.error-keyup-7').remove();
			    var inputVal = $(this).val();
			    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
			    if(!emailReg.test(inputVal)) {
			    	 $("#unc").text('Invalid Email Format.');
			        	$("#unc").show();
			           	$("#unc").fadeOut(10000);
			        return false;
			    }
			}); 
		
		
		/*  $('#email').focusout(function(){

             $('#email').filter(function(){
                var emil=$('#email').val();
           var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
         if( !emailReg.test( emil ) ) {
             alert('Please enter valid email');
             } else {
             alert('Thank you for your valid email');
             }
             })
         }); */
			
			
			
	});
 
 
 /* $(function () {
     $("#saveId").click(function () {
         var password = $("#password").val();
         var confirmPassword = $("#cPassword").val();
         if (password != confirmPassword) {
             alert("Passwords do not match.");
             return false;
         }
         //return false;
     });
 }); */
 </script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>New Register<aside class="block-footer-right sucessfully" id="unc2" style="display:none;" >Delete Sucessfully</aside></h2>
				<form name="cf_form" method="post" onsubmit="return false;" id="contact-form" style=" background-color: #ffffff;">
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label >Name</label>
							<input type="text" name="regName" id="regName" onkeyup="removeError(this.id);">
						</div>
						<div class="block-searchbill-input">
							<label>Mobile No</label>
							<input type="text" name="mobileNo" id="mobileNo" onkeyup="removeError(this.id);" >
						</div> 
						<div class="block-searchbill-input last">
							<label>Email</label>
							<input type="text" name="email" id="email" onkeyup="removeError(this.id);">
							<input type="hidden" id="regType" name="regType"  value="User">
							<input type="hidden" id="regId">
						</div>
					</div>
					<!-- <div class="block-searchbill">
					<div class="block-searchbill-input">
							<label>Register Type</label>
							<input>
							<select id="regType" name="regType"    tabindex=""  />
															<option value="User">User</option>
                                                            <option value="Admin">Admin</option>
															<option value="Vendor">Vendor</option>
                                                        </select> 
						</div>
						<div class="block-searchbill-input last">
							<label>Password</label>
							<input type="password" name="password" id="password" onkeyup="removeError(this.id);">
							<input type="hidden" id="regId">
						</div>
						<div class="block-searchbill-input last">
							<label>Confirm Password</label>
							<input type="password" name="cPassword" id="cPassword" onkeyup="removeError(this.id);">
						</div>
						</div> -->
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
							<input class="btn-save" name="" value="Save" id="saveId" type="button" onclick="userRegister();">
						</aside>
					</div>
				</form>
			</div>
			<!-- <div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Register Details<aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<li class="nine-box" style="width:300%">Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%">Mobile No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:221%">email
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>    
						<li class="five-box" style="width:100%">RegisterType
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>            
						<li class="ten-box" style="width:100%">Edit</li>
						<li class="ten-box last" style="width:100%">Delete</li>
					</ul>
					<div class="table-list-blk" id="userData">
						<ul>
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
						</ul>                                            
					</div>
				</div>
				<div class="block-footer">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
						<input class="btn-cancel" name="" value="Clear" type="button">
						<input class="btn-save" name="" value="Save" type="submit">
					</aside>
				</div>
			</div> -->
		</section>
</body>