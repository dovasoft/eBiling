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
 <script type="text/javascript" src="js/status.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>

<script type="text/javascript">
var lstStatus ='${allStatus}';
$(document).ready(function() {
	
	showStatusData(JSON.parse(lstStatus));
	
	 $("#status").keypress(function() {
		var textbox = document.getElementById("status");
		if (textbox.value.length < 3){
	    	
	    	 $("#unc").text(' min 3 characters reqiured');
	        	$("#unc").show();
	           	$("#unc").fadeOut(2000);
	           //	$("#regName").focus();
	         // Enable submit button
	    } else {
	    	
	    	//return false;
	         // Disable submit button
	    }
	}); 
	$('#status').keypress(function (e) {
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
	
	$('#statusPriority').keypress(function (e) {
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
	
});

 
 
</script>
		
		<section class="container">
			<div class="block" id="">
				<h2><span class="icon1">&nbsp;</span>Status</h2>
				<form name="myForm" method="post" id="contact-form"  onsubmit="return false;">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Status</label>
							 <input type="text" name="status" id="status"   placeholder="Enter Status" tabindex="1" />
							  <input type="hidden" name="statusId" id="statusId"/> 
						</div>
						<div class="block-searchbill-input" id="">
							<label>Description</label>
							 <input type="text" name="description" id="description"   placeholder="Enter Description" tabindex="1" onkeydown=""  />
							 <!-- <input type="hidden" name="productId" id="productId"/> -->
						</div>
						<div class="block-searchbill-input">
							<label>Status Priority</label>
							<input type="text" name="statusPriority" id=statusPriority   tabindex="3" maxlength="2" style="WIDTH: 40px; HEIGHT: 20px" size="2" />
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="Clear"  name="Cancel" type="button" onclick="statusDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="statusReg();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Status Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box">Status
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Description
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box">Status Priority
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box">Edit</li>
						<li class="ten-box last">Delete</li>
					</ul>
					<div class="table-list-blk" id='statusData'>
						<div class="pagenation">
							<div class="holder"></div>           
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
</html>


		

		