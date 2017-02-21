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
<link href="css/jquery-ui.css" rel="stylesheet" type="text/css" />
</head>
<body>

<script type="text/javascript" src="js/jquery.min.js"></script>
 <script type="text/javascript" src="js/CustomPagenation.js"></script> 
 <script type="text/javascript" src="js/productStock.js"></script>
 <script type="text/javascript" src="js/commonUtils.js"></script>
  <script type="text/javascript" src="js/jquery-ui.js"></script>
<!-- <script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/blitzer/jquery-ui.css"
rel="stylesheet" type="text/css" /> -->
<script type="text/javascript">
var lstOrders ='${getAllStock}';
$(document).ready(function() {
	getAllProducts();
	showProductData(JSON.parse(lstOrders));
	$("#oldStock").attr("disabled", "disabled");
	$("#stock").attr("disabled", "disabled");
	
	$('#newStock').keypress(function (e) {
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
	var allProducts = '${sessionScope.allProducts}';
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
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>Stock</h2>
				<form name="myForm" method="post" id="contact-form" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill" id="">
						<div class="block-searchbill-input" id="">
							<label style="margin-bottom: 4px;">Product Name</label>
							 <select style="margin-left:158px; margin-top:-27px;" id="productId" name="productId" onchange="addProductStock(this.id);">
                                                            	<option value="">--Select--</option>
                                                        </select>
							 <input  type="hidden" id="productName">
							 <input  type="hidden" id="stockId">
						</div>
						<div class="block-searchbill-input">
							<label>Stock</label>
							<input type="text" name="stock" id="stock" tabindex="3" />
						</div> 
						<div class="block-searchbill-input">
							<label>Old Stock</label>
							<input type="text" name="oldStock" id="oldStock"  tabindex="3" />
						</div>
					</div>
					<div class="block-searchbill" id="">
					<div class="block-searchbill-input">
							<label style="margin-right: 5px; margin-left: 20px">New Stock</label>
							<input type="text" name="newStock" id="newStock"   tabindex="3" />
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							 <input class="btn-cancel" value="Clear"  name="Cancel" type="button" onclick="ProductStockDataClear();" >
                    <input class="btn-save" value="Save" id="saveIds" type="button" onClick="productStock();">
						</aside>
					</div>
				</form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Stock Details <aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
					<ul class="table-list">
						<!-- <li class="five-box">No
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>              -->   
						<li class="nine-box" style="width:309%;">Product Name
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:146%;">Stock
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>
						<li class="five-box" style="width:144%;">New Stock
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li> 
						<li class="five-box" style="width:143%;">Old Stock
							<ul>
								<li><a class="top" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
								<li><a class="bottom" href="http://localhost:8080/personal/reg#">&nbsp;</a></li>
							</ul>
						</li>                
						<li class="eleven-box" style="width:144%;">Edit</li>
						<li class="ten-box " style="width:132%;">Delete</li>
						<li class="ten-box last" style="width:20%; border-left: 1px solid #cccccc;">Details</li>
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
			</div>
			<div id="dialog" style="display: none;"></div>
</section>
		
</body>
</html>


		
