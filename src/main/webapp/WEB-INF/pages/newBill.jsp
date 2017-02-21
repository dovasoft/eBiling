<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE section PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html><head>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style type="text/css">
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>
</head><body>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <script type="text/javascript" src="js/jquery.min.js"></script> -->
		 <script type="text/javascript" src="js/newBill.js"></script>
		<script type="text/javascript">
		var billId = '${sessionScope.BillId}';
		var printBill= '${sessionScope.printInfo}';
		var disMsg='${sessionScope.getAllStock}';
		var updateCarts='${sessionScope.updateCart}';
		$(document).ready(function() {
			getAllProducts();
			getAllPurchase();
      		showBillDetailsData(updateCarts);
		});
		$(document).ready(function() {
				if(lstBill != undefined && lstBill.length > 0){
					purchaseArr = JSON.parse(lstBill)[0].listPurchase;
					getAllPurchase(purchaseArr); 	
				}
				
				$("#labelId").hide();
				$("#labelId1").hide();
				$("#labelId2").hide();
				$("#labelId3").hide();
				
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
		           	$("#unc").fadeOut(20000);
			        return false;
			        }
			    });
				
		});
		
		$(function() {
			$("#lrDate").datepicker({
				changeDate : true,
				changeMonth : true,
				changeYear : true,
				showButtonPanel : false,
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#dispatchedDate").datepicker({
				changeDate : true,
				changeMonth : true,
				changeYear : true,
				showButtonPanel : false,
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#orderDate").datepicker({
				changeDate : true,
				changeMonth : true,
				changeYear : true,
				showButtonPanel : false,
				dateFormat : 'dd-mm-yy'
			});
		});
		$(function() {
			$("#billDate").datepicker({
				changeDate : true,
				changeMonth : true,
				changeYear : true,
				showButtonPanel : false,
				dateFormat : 'dd-mm-yy'
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
		var getPurchase='${sessionScope.getAllPurchaser}';
		var parchaserAll= JSON.parse(getPurchase);
		function getAllPurchase() {
			var lstOrders = parchaserAll;
			if(lstOrders != null && lstOrders.length > 0){
			var html = "<option value=''>Select</option>";
			$.each(lstOrders,function(i, catObj) {
				 html = html + '<option value="'
					+ catObj.name + '">'
					+ catObj.name + '</option>';
			});
			$('#name').empty().append(html);
		}
	} 
		
		function populateProduct() {
			var productId = $("#productId").val();
			var lstOrders ='${allProducts}';
			lstOrders = JSON.parse(lstOrders);
			if(lstOrders != null && lstOrders.length > 0){
				$.each(lstOrders,function(i, catObj) {
					 if(productId == catObj.productId){
						 $('#rate').val(catObj.mrp);
						 $('#mrp').val(catObj.mrp);
						 $('#productName').val(catObj.productName);
						 
						 return false;
					} 
				});
			}
		}
		function newCustomer() {
			if($("oldCustmer").val(['oldCustmer'])){
				$("#name").show();
				$("#purchaserName").hide();
				$("#newCustmer").prop('checked', false);
			}else{
				$("#name").attr("disabled", "disabled");
			}
		}
		function oldCustomer() {
			if($("newCustmer").val(['newCustmer'])){
				$("#name").hide();
				$("#purchaserName").show();
			}
		}
		function moreInfoShow()
		{
			if($("show").val(['show'])){
				
				$("#labelId").show();
				$("#labelId1").show();
				$("#labelId2").show();
				$("#labelId3").show();
			}else{
				moreInfoHide();
			}
		}
		function moreInfoHide()
		{
			if($("hide").val(['hide'])){
				
				$("#labelId").hide();
				$("#labelId1").hide();
				$("#labelId2").hide();
				$("#labelId3").hide();
				$("#show").prop('checked', false);
			}
			
		}
		$(document).ready(function () {
	          var dateNewFormat, onlyDate, today = new Date();

	          //dateNewFormat = today.getFullYear() + '-' + (1 + today.getMonth());
	          dateNewFormat = (1 + today.getMonth())+ '-' + today.getFullYear();
	          
	          onlyDate = today.getDate();

	          if (onlyDate.toString().length == 2) {
	           onlyDate += '-' + dateNewFormat;
	          }
	          else {
	              dateNewFormat += '-0' + onlyDate;
	          }
	          $('#billDate').val(onlyDate);
	          //$('#lrDate').val(onlydate);
	          //$('#dispatchedDate').val(onlyDate);
	          //$('#orderDate').val(onlyDate);
	      });
		function editPurchaser() {
			//alert("hiii");
			var name = $("#name").val();
			var lstOrders = parchaserAll;
			if(lstOrders != null && lstOrders.length > 0){
				$.each(lstOrders,function(i, catObj) {
					 if(name == catObj.name){
						 $('#phone').val(catObj.mobileNo);
						 $('#eMail').val(catObj.eMail);
						 $('#tinNo').val(catObj.tinNo);
						 $('#address').val(catObj.address);
						 return false;
					} 
				});
			}
		}
		function customerType() {
			var custType =$("#customerType").val();
			if(custType == "oldCustmer"){
				$("#purchaserName").val("");
				$("#name").show();
				
				$("#purchaserName").hide();
			}else{
				 $('#phone').val("");
		  		 $('#address').val("");
		  		$('#name').val("");
		  		$('#eMail').val("");
		  		$('#tinNo').val("");
				$("#name").hide();
				$("#purchaserName").show();
			}
			 //oldCustomer();
			 //newCustomer();
		}
		$(document).ready(function(){
		       $("button").click(function(){
		           $("#moreInfoId").toggle();
		       });
		   });
	</script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>New Bill</h2>
				<form:form name="cf_form" method="post" id="contact-form" commandName="productCmd" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
					<div class="block-searchbill">
						<div class="block-searchbill-input">
							<label>Product Name</label>
							<!-- <select id="productType" name="ptype"    tabindex="2"  />
                                                            <option value="0">Saree</option>
                                                            <option value="1">Blouse</option>
                                                        </select> -->
                         <form:select name="productId" path="productId" id="productId" onchange="populateProduct();"  tabindex="3">
											<form:option value="">--Select--</form:option>
											<%-- <form:options value="${}" onclick="editBill()" items="${productSelectName}"></form:options> --%>	
											
												
						 </form:select>
						</div>
						<div class="block-searchbill-input">
							<label>Quantity</label>
							<input  type="text"   name="quantity" id="quantity" onkeypress="onkeyQuantity(this.id);"/>
							<input  type="hidden" id="mrp">
							<input  type="hidden" id="productName">
							<input  type="hidden" id="billDetailsId">
							<input  type="hidden" id="totalMrp">
							<input  type="hidden" id="totalQuantity">
							<input  type="hidden" id="totalRate">
							<input  type="hidden" id="billId">
							<!-- <input  type="hidden" id="billDate"> -->
							
						</div> 
						<div class="block-searchbill-input">
							<label>Rate</label>
							<form:input path="mrp" type="text" name="rate" id="rate" onkeypress="onkeyRate(this.id)"></form:input>
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully"  id="unc" style="display: none">Sucessfully Message</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
							<input class="btn-save" value="Save" id="saveIds" type="button" onClick="newBill();">
						</aside>
					</div>
				</form:form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Bill Products<aside class="block-footer-right sucessfully" id="unc1" style="display:none" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
                                    <ul class="table-list">
                                        <li class="five-box">S.No
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                
                                        <li id="bil-prod-box">Description
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box">MRP
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                                         
                                        <li class="five-box">Quantity
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box">Rate
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                                               
                                        <li class="five-box">Amount
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>        
                                        <li class="eleven-box">Edit</li>        
                                        <li class="ten-box last" >Delete</li>
                                    </ul>
                                    <div class="table-list-blk" id="userData"> </div>
                                    </ul>
					<div class="table-list-total" id="totalTable "><ul class="table-list" >
							
                        
                            <li class="five-box">&nbsp;</li>
                            <li class="bil-prod-box"><b>Total</b></li>
                            <li class="five-box"><b><div id="totalMrpDisp"></div></b></li>
                            <li class="five-box"><b><div id="totalQuantityDisp"></div></b></li>
                            <li class="five-box"><b><div id="totalRateDisp"></div></b></li>
                            <li class="five-box"><b><div id="totalAmountDisp"></div></b></li>  
                            <li class="ten-box">&nbsp;</li>
                            <li class="eleven-box last">&nbsp;</li> 
                                             
                                  
                </ul></div>
						
                                                <ul>
                                                    <div class="block-box-exp">
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Bill No</label>
                                                                <input type="text" name="billNo" id="billNo">   
                                                            </div> 
                                                            <div class="block-input">
                                                                 <label>Bill Date</label>
                                                                <input type="text" name="billDate" id="billDate">
                                                            </div>                 
                                                            <div class="block-input  last">
                                                                <label>Payment Type</label>
                                                                <select id="payment" name="addclient">
                                                                    <option value="Cash">Cash</option>
                                                                    <option value="Card">Card</option>
                                                                    <option value="Cheque">Cheque</option>
                                                                </select> 
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                         <div class="block-input ">
                                                                <label>Customer Type</label>
                                                                <select id="customerType" name="customerType" onchange="customerType();">
                                                                    <option value="oldCustmer" selected="selected">Old Custmer</option>
                                                                    <option value="newCustmer">New Custmer</option>
                                                                </select> 
                                                            </div>
                                                        <!-- <div class="block-input"  style="margin-right: 42px;">
                                                       
                                                      <label>Old Customer</label>  <input type="radio" id="oldCustmer" name="oldCustmer" checked="checked" value="oldCustmer" onclick="newCustomer();"  style="margin-left: -91px;"> 
														<label>New Customer</label><input type="radio" id="newCustmer" name="newCustmer" value="newCustmer" onclick="oldCustomer()"  style="margin-left: -91px;"> 
                                                        
                                                        </div> -->
                                                            <div class="block-input">
                                                                <label>Name</label>
                                                                 <input  style="margin-left:120px; margin-top:-27px;" type="text" name="purchaserName" id="purchaserName">
                                                                <select style="margin-left:120px; margin-top:-27px;" id="name" name="name" onchange="editPurchaser();">
                                                            	<option value="">--Select--</option>
                                                        </select>                  
                                                            </div>  
                                                            <div class="block-input last">
                                                                <label><b>Total Amount</b></label>
                                                                <input disabled="disabled" type="text" name="totalAmount" id="totalAmount" >
                                                            </div>
                                                            
                                                        </div>
                                                        <div class="block-searchbill">
                                                        <div class="block-input ">
                                                                <label>Email</label>
                                                                <input type="text" name="eMail" id="eMail">
                                                            </div>
                                                            <div class="block-input">
                                                                <label>Mobile No</label>
                                                                <input type="text" name="phone" id="phone">                 
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Discount</label>
                                                                <input  type="text" name="discount" id="discount" onchange="netAmount()">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                        
                                                            <div class="block-input">
                                                                <label>Address</label>
                                                                <textarea name="address" id="address" rows="3"></textarea>                  
                                                            </div>                                                        
                                                            <div class="block-input">
                                                                <label>Tin No</label>
                                                                <input type="text" name="tinNo" id="tinNo">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Net Amount</label>
                                                                <input disabled="disabled" type="hidden" name="netAmount" id="netAmount" onchange=" test();">
                                                                <div id="showAmount" style="margin-top: 16px;margin-top: -10px;font-size: 43px;color: green;"></div>
                                                                <div id="wordsAmount" style="margin-left: -379px;margin-top: 23px;color: red;font-size: 15px;text-align: center;font-weight: bold;"></div>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill" id="labelId" style="margin-top: -120px; margin-bottom: -1px;" >
                                                        
                                                            <div class="block-input" style="margin-top: 124px;">
                                                                <label>Show Our Tin NO</label>
                                                                <input type="checkbox" name="showPan" value="1" id="showPan" style=" margin-left:-89px;">                
                                                            </div>                                                        
                                                           
                                                        </div>
                                                        <div class="block-searchbill" ><aside class="block-footer-right sucessfully" id="unc2" style="display:none" >Delete Sucessfully</aside>
																<div><button style="margin-bottom: 138px;margin-right: 8px;margin-left: 72px;">More info</button></div>                                                         
                                                         </div>
                                                         
                                                          <div id="moreInfoId" style="display:none;">
                                                         <div class="block-searchbill" id="labelId" style="margin-top: -120px; margin-bottom: -1px;" >
                                                        
                                                            <div class="block-input">
                                                                <label>Order No</label>
                                                                <input type="text" name="orderNo" id="orderNo">                  
                                                            </div>                                                        
                                                            <div class="block-input">
                                                                <label>Order Date</label>
                                                                <input type="text" name="orderDate" id="orderDate">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Ordered By</label>
                                                                <input type="text" name="orderBy" id="orderBy">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="block-searchbill" id="labelId1" style=" margin-top: -83px;">
                                                        
                                                            <div class="block-input">
                                                                <label>LR No</label>
                                                                <input type="text" name="lrNo" id="lrNo">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>LR Date</label>
                                                                <input type="text" name="lrDate" id="lrDate">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>No of Packages</label>
                                                                <input type="text" name="noOfPacks" id="noOfPacks">
                                                            </div>
                                                        </div>
                                                        
                                                        <div class="block-searchbill" id="labelId2" style="margin-top: -47px; margin-bottom: -22px;" >
                                                        
                                                            <div class="block-input">
                                                                <label>Pack Slip No</label>
                                                                <input type="text" name="packSlipNo" id="packSlipNo">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Despatched Date</label>
                                                                <input type="text" name="dispatchedDate" id="dispatchedDate">
                                                            </div>
                                                             <div class="block-input">
                                                                <label>Despatched By</label>
                                                                <input type="text" name="dispatchedBy" id="dispatchedBy"> 
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill" id="labelId3"  style="margin-top: -9px;">
                                                        
                                                            <div class="block-input">
                                                                <label>Terms of Payment</label>
                                                                <input type="text" name="termOfPayment" id="termOfPayment">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Terms</label>
                                                                <input type="text" name="terms" id="terms">
                                                            </div>
                                                            
                                                        </div>
                                                         </div>
                                                </ul>                                             
					
				</div>
				<div class="block-footer" id="print">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
					<input class="btn-cancel" name="" value="Cancel" type="button" onclick="cancelBill(this.id)">
						<input class="btn-save" name="" value="Consignment" type="button" onclick="saveInfoCart();" style="    margin-right: 71px;margin-top: -25px;">>
						<input class="btn-save" name="" value="Bill" id="printBill" type="submit" onclick="updateBillInfoCart();" style="margin-right: 177px;margin-top: -26px;">
					</aside>
				</div>
			</div>
		</section>
		
		</body></html>
