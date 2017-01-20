<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<!DOCTYPE section PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">	
<html><head></head><body>


<script type="text/javascript" src="js/jquery.min.js"></script>
		 <script type="text/javascript" src="js/newBill.js"></script>
		<script type="text/javascript">
		var lstBill= ${sessionScope.allBillingDetaisCart};
		$(document).ready(function() {
				getAllProducts();
				showBillDetailsData(lstBill);
				 billInfoCart = ${allGetBillInfoCart};
				 showTotalBill(billInfoCart); 
				 
		});
		
		function getAllProducts() {
			var lstOrders = ${allProducts};
			if(lstOrders != null && lstOrders.length > 0){
			var html = "<option value=''>Select</option>";
			/* alert('lstOrders==='+lstOrders.length); */ 
			$.each(lstOrders,function(i, catObj) {
				/* alert('i=='+i); */
				 html = html + '<option value="'
					+ catObj.productId + '">'
					+ catObj.productName + '</option>';
				
				
			});
			$('#productId').empty().append(html);
			}
			
		}
		
		function populateProduct() {
			var productId = $("#productId").val();
			var lstOrders =${allProducts};
			if(lstOrders != null && lstOrders.length > 0){
				$.each(lstOrders,function(i, catObj) {
					 if(productId == catObj.productId){
						 alert('matched');
						 $('#rate').val(catObj.mrp);
						 $('#mrp').val(catObj.mrp);
						 $('#productName').val(catObj.productName);
						 exit;
					} 
				});
			}
		}
			function onSelect(){
		var productId = $("#productId").val();
		$.ajax({
			type: "POST",
            url: "selectProduct",
            data:"productId=" + productId,
            success: function (response){
            	response = JSON.parse(response);
            	$('#rate').val(response[0].mrp);
			
			}
		});
		
	}
	function productRegister() {
		
		 data = {};
		data["productId"] = $("#productId").val();
		data["productName"] = $("#productName").val();
		data["quantity"] = $("#quantity").val();
		data["rate"] = $("#rate").val();
		data["mrp"] = $("#mrp").val();
		data["billDetailsId"] = $("#billDetailsId").val();
		if($("#billDetailsId").val() != "" && $("#billDetailsId").val() != null ){
			updateBillProduct();
		}else{
			$("#btn-save").prop("disabled", true);
			saveBillProduct();
		}
		
		
	
	}

	function saveBillProduct(){
		 alert('------4--------'); 
		$.ajax({
	             type: "POST",
	             url: "saveBillProduct.htm",
	             data: data,
	             success: function (response) {
	            	 resJSON = JSON.parse(response);
	                 if(response != null ){
	                  
	                	  allBillingDetaisCart(resJSON);
	                	  $("#unc").text("Save Sucessfully");
	            		   $("#unc").show();
	                       $("#unc").fadeOut(5000);
	                  
	                 }
	            	
	                 },
	             error: function (e) { 
	                 $("#btn-save").prop("disabled", false);
	             }
	             
	             
		}); 
	}
		
	function updateBillProduct(){
		var billDetailsId=$("#billDetailsId").val();
		
		$.ajax({
	             type: "POST",
	             url: "updateBillDetailsCart.htm",
	             data: "jsondata= "+JSON.stringify(data),
	             success: function (response) {

	            	 if(response != 0){
	            		 //alert('aaaasaas');
	            		     $("#unc").text("Update Sucessfully");
	            		   $("#unc").show();
	                       $("#unc").fadeOut(5000); 
	                       
	                      showBillDetailsData(JSON.parse(response));
	            		 $("#productId").val("");
	  					$("#quantity").val("");
	  					$("#rate").val("");
	  					 stop = true;
	                 }
	                 
	             },
	             error: function (e) { 
	                 $("#btn-save").prop("disabled", false);
	             }

		}); 
	}
	function saveBillInfo(){
		
		data = {};
		data["billId"] = $("#billId").val();
		data["billNo"] = $("#billNo").val();
		data["orderNo"] = $("#orderNo").val();
		data["orderDate"] = $("#orderDate").val();
		
		data["payment"] = $("#payment").val();
		data["discount"] = $("#discount").val();
		data["totalAmount"] = $("#totalAmount").val();
		data["name"] = $("#name").val();
		data["phone"] = $("#phone").val();
		data["address"] = $("#address").val();
		data["lrNo"] = $("#lrNo").val();
		data["lrDate"] = $("#lrDate").val();
		data["dispatchedBy"] = $("#dispatchedBy").val();
		data["orderBy"] = $("#orderBy").val();
		data["dispatchedDate"] = $("#dispatchedDate").val();
		data["noOfPacks"] = $("#noOfPacks").val();
		data["packSlipNo"] = $("#packSlipNo").val();
		data["termOfPayment"] = $("#termOfPayment").val();
		data["totalMrp"] = $("#totalMrp").val();
		data["terms"] = $("#terms").val();
		data["totalQuantity"] = $("#totalQuantity").val();
		data["totalRate"] = $("#totalRate").val();
		data["totalAmount"] = $("#totalAmount").val();
		data["billNo"] = $("#billNo").val();
		data["tinNo"] = $("#tinNo").val();

		$.ajax({
	             type: "POST",
	             url: "saveBillInfo.htm",
	             data: data,
	             success: function (response) {
	            	 resJSON = JSON.parse(response);
	                 if(response != null ){
	                  if(resJSON.status == "ERROR"){
	                	 /*  $("#unc").text('Name already exists. Please choose other Name');
	                	  $("#unc").show();
	                      $("#unc").fadeOut(5000);*/
	                  }else{ 
	                	  allBillingDetaisCart(resJSON);
	                	  $("#unc").text("Save Sucessfully");
	            		   $("#unc").show();
	                       $("#unc").fadeOut(5000);
	                  }
	                 }
	            	
	                 },
	             error: function (e) { 
	                 $("#btn-save").prop("disabled", false);
	             }
	             
	             
		}); 
	}
	</script>
		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>New Bill..............</h2>
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
							<input  type="text"   name="quantity" id="quantity" />
							<input  type="hidden" id="mrp">
							<input  type="hidden" id="productName">
							<input  type="hidden" id="billDetailsId">
							<input  type="hidden" id="totalMrp">
							<input  type="hidden" id="totalQuantity">
							<input  type="hidden" id="totalRate">
							<input  type="hidden" id="billId">
							
						</div> 
						<div class="block-searchbill-input">
							<label>Rate</label>
							<form:input path="mrp" type="text" name="prate" id="rate"></form:input>
						</div>
					</div>
					<div class="block-footer">
						<aside class="block-footer-left sucessfully"  id="unc" style="display: none">Sucessfully Message</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Cancel" type="button" onclick="dataClear();">
							<!-- <input class="btn-save" name="" value="Save" onclick="addBillProduct();" type="submit"> -->
							<input class="btn-save" value="Save" id="saveIds" type="button" onClick="productRegister();">
						</aside>
					</div>
				</form:form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Bill Products<aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
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
                                        <li class="ten-box">Delete</li>
                                        <li class="eleven-box last">Edit</li>
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
                                                                <label>Payment Type</label>
                                                                <select id="payment" name="addclient">
                                                                    <option value="Cash">Cash</option>
                                                                    <option value="Card">Card</option>
                                                                    <option value="Cheque">Cheque</option>
                                                                </select> 
                                                            </div> 
                                                            <div class="block-input">
                                                                <label>Discount</label>
                                                                <input type="text" name="discount" id="discount">
                                                            </div>                 
                                                            <div class="block-input  last">
                                                                <label><b>Total Amount</b></label>
                                                                <input disabled="disabled" type="text" name="totalAmount" id="totalAmount">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Name</label>
                                                                <input type="text" name="name" id="name">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Mobile No</label>
                                                                <input type="text" name="phone" id="phone">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Address</label>
                                                                <textarea name="address" id="address" rows="3"></textarea>
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>LR No</label>
                                                                <input type="text" name="lrNo" id="lrNo">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>LR Date</label>
                                                                <input type="text" name="lrDate" id="lrDate">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
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
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Despatched By</label>
                                                                <input type="text" name="dispatchedBy" id="dispatchedBy">                  
                                                            </div>
                                                            <div class="block-input">
                                                                <label>Despatched Date</label>
                                                                <input type="text" name="dispatchedDate" id="dispatchedDate">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>No of Packages</label>
                                                                <input type="text" name="noOfPacks" id="noOfPacks">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Pack Slip No</label>
                                                                <input type="text" name="packSlipNo" id="packSlipNo">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Terms of Payment</label>
                                                                <input type="text" name="termOfPayment" id="termOfPayment">
                                                            </div>
                                                            <div class="block-input last">
                                                                <label>Terms</label>
                                                                <input type="text" name="terms" id="terms">
                                                            </div>
                                                        </div>
                                                        <div class="block-searchbill">
                                                            <div class="block-input">
                                                                <label>Bill No</label>
                                                                <input type="text" name="billNo" id="billNo">                  
                                                            </div>  
                                                            <div class="block-input">
                                                                <label>Tin No</label>
                                                                <input type="text" name="tinNo" id="tinNo">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ul>                                             
					
				</div>
				<div class="block-footer">
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">
						<input class="btn-cancel" name="" value="Cancel" type="button">
						<input class="btn-save" name="" value="Save" type="submit" onclick="saveBillInfo();">
					</aside>
				</div>
			</div>
		</section>
		
		</body></html>
