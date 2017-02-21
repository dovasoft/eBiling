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
var lstOrders ='${allProducts}';
$(document).ready(function() {
	
	showProductData(JSON.parse(lstOrders));
	
	
	/*  $('#productName').keypress(function (e) {
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
    });  */
	
	$('#mrp').keypress(function (e) {
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
				<h2><span class="icon1">&nbsp;</span>New Product</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label>Product Name</label>
							 <input type="text" name="productName" id="productName"   placeholder="Enter Product Name" tabindex="1" onkeydown=""  />
							 <input type="hidden" name="productId" id="productId"/>
						</div>
						<div class="block-searchbill-input">
							<label>Product Type</label>
							<select id="productType" name="ptype"    tabindex="2"  />
                        <option value="0">Nos</option>
                        <option value="1">Mts</option>
                    </select>
						</div> 
						<div class="block-searchbill-input">
							<label>MRP</label>
							<input type="text" name="prate" id="mrp"  placeholder="Enter MRP" tabindex="3" />
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="Clear"  name="Clear" type="button" onclick="productDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="productRegister();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Product Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box" style="width:300%;">Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">Type
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">MRP
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box" style="width:140%;">Edit</li>
						<li class="ten-box last" style="width:140%;">Delete</li>
					</ul>
					<div class="table-list-blk" id='userData'>
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


		
