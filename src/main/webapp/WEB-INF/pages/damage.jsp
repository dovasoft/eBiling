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
 <script type="text/javascript" src="js/damage.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>

<script type="text/javascript">
var lstDamage ='${allDamages}';
$(document).ready(function() {
	
	getAllProducts();
	showDamageData(JSON.parse(lstDamage));
	
	$('#quantity').keypress(function (e) {
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
function getAllProducts() {
	var allProducts = '${sessionScope.getAllStock}';
	if(typeof allProducts != ''){
		allProducts = JSON.parse(allProducts); 
		if(allProducts != null && allProducts.length > 0){
		var html = "<option value=''>-- Select --</option>";
		$.each(allProducts,function(i, produtObj) {
			 html = html + '<option value="'
				+ produtObj.productId + '">'
				+ produtObj.productName + '</option>';
		});
		$('#productId').empty().append(html);
		}	
	} else {
		
	}
}


</script>
		
		<section class="container">
			<div class="block" id="">
				<h2><span class="icon1">&nbsp;</span>Damage</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label style="margin-bottom: 4px;">Product Name</label>
							<select style="margin-left:120px; margin-top:-27px;" id="productId" name="productId">
							
                                                            	<option value="">--Select--</option> 
                                                        </select>
                              <input  type="hidden" name="damageId" id="damageId">                          
							<!-- <input type="text" name="productName" id="productName"   placeholder="Enter Product name" tabindex="1" onkeydown=""  /> -->
							 <input type="hidden" name="productId" id="productId"/>
							 <input type="hidden" name="productName" id="productName"/>
						</div>
						
						<div class="block-searchbill-input">
							<label>Quantity</label>
							<input type="text" name="prate" id="quantity"  placeholder="Enter quantity" tabindex="3" />
						</div>
						<div class="block-searchbill-input">
							<label>Description</label>
							<textarea name="description" id="description" rows="5" style="margin-top: 8px;margin-left: 9px;margin-right: 110px;"></textarea>
							<!-- <input type="textbox" name="prate" id="description"  placeholder="Enter description" tabindex="3" /> -->
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="Clear"  name="Clear" type="button" onclick="damageDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="damageRegister();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Damage Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box" style="width:300%;">Product Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">Quantity
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:140%;">Description
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


		
