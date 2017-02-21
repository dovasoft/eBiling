var serviceUnitArrayBill ={};
var purchaseArr = [];
var data = {};
function showBillDetailsData(response){
	 /*$("#userData ul").remove();
	$("#userData ul li").remove();*/
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	var i=0;
	if(response != undefined && response.length > 0){
		var productArr = response[0].listBillingInfoCart;
		purchaseArr = response[0].listPurchase;
		if(purchaseArr != null || purchaseArr != ""){
			getAllPurchase(purchaseArr);
			}
		if(productArr != null){
			$.each(productArr,function(i, catObj) {
				serviceUnitArray[catObj.billDetailsId] = catObj;
				 var tblRow ="<ul class=''>"
					 	+ "<li class='five-box'  title='"+catObj.billDetailsId+"'>"
						+ (i+1)  
						+"</li>"
						+ "<li class='bil-prod-box'  title='"+catObj.productName+"'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"'>"
						+ catObj.mrp
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.quantity+"'>"
						+ catObj.quantity
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.rate+"'>"
						+ catObj.rate
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.amount+"'>"
						+ catObj.amount
						+ "</li>"
						+ "<li class='eleven-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='editBill(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='deleteProduct(this.id)' id='editId class='ico del' href='#'>Delete</a>"
						+ '</li>'
						
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
		$('#billNo').val(response[0].billNo);
    	$('#totalMrpDisp').text(response[0].totalMrp);
    	$('#totalQuantityDisp').text(response[0].totalQuantity);
    	$('#totalRateDisp').text(response[0].totalRate);
    	$('#totalAmountDisp').text(response[0].totalAmount);
    	$('#totalAmount').val(response[0].totalAmount);
    	 $('#totalMrp').val(response[0].totalMrp);
		 $('#totalQuantity').val(response[0].totalQuantity);
		 $('#totalRate').val(response[0].totalRate);
		 
		 $('#billId').val(response[0].billId);
		 $('#name').val(response[0].name);
		 //$('#discount').val(response[0].discount);
		 $('#phone').val(response[0].phone);
		 $('#address').val(response[0].address);
		 $('#lrNo').val(response[0].lrNo);
		 $('#lrDate').val(response[0].lrDate);
		 $('#orderNo').val(response[0].orderNo);
		 $('#orderDate').val(response[0].orderDate);
		 $('#dispatchedBy').val(response[0].dispatchedBy);
		 $('#dispatchedDate').val(response[0].dispatchedDate);
		 $('#noOfPacks').val(response[0].noOfPacks);
		 $('#termOfPayment').val(response[0].termOfPayment);
		 $('#terms').val(response[0].terms);
		 $('#lrDate').val(response[0].lrDate);
		 $('#orderBy').val(response[0].orderBy);
		 $('#tinNo').val(response[0].tinNo);
		 $('#packSlipNo').val(response[0].packSlipNo);
		 $('#netAmount').val(response[0].totalAmount);
    	
	}
}
function showUpdateBillData(response){
	/*$("#userData ul").remove();
	$("#userData ul li").remove(); */
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	var i=0;
	if(response != undefined && response.length > 0){
		var productArr = response[0].listBillingInfoCart;
		purchaseArr = response[0].listPurchase;
		if(purchaseArr != null || purchaseArr != ""){
			getAllPurchase(purchaseArr);
			}
		if(productArr != null){
			$.each(productArr,function(i, catObj) {
				serviceUnitArray[catObj.billDetailsId] = catObj;
				 var tblRow ="<ul class=''>"
					 	+ "<li class='five-box'  title='"+catObj.billDetailsId+"'>"
						+ (i+1)  
						+"</li>"
						+ "<li class='bil-prod-box'  title='"+catObj.productName+"'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"'>"
						+ catObj.mrp
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.quantity+"'>"
						+ catObj.quantity
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.rate+"'>"
						+ catObj.rate
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.amount+"'>"
						+ catObj.amount
						+ "</li>"
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='editBill(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='deleteProduct(this.id)' id='editId class='ico del' href='#'>Delete</a>"
						+ '</li>'
						
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
    	$('#totalMrpDisp').text(response[0].totalMrp);
    	$('#totalQuantityDisp').text(response[0].totalQuantity);
    	$('#totalRateDisp').text(response[0].totalRate);
    	$('#totalAmountDisp').text(response[0].totalAmount);
    	$('#totalAmount').val(response[0].totalAmount);
    	 $('#totalMrp').val(response[0].totalMrp);
		 $('#totalQuantity').val(response[0].totalQuantity);
		 $('#totalRate').val(response[0].totalRate);
		 
		 $('#billId').val(response[0].billId);
		 $('#name').val(response[0].name);
		 $('#discount').val(response[0].discount);
		 $('#phone').val(response[0].phone);
		 $('#address').val(response[0].address);
		 $('#lrNo').val(response[0].lrNo);
		 $('#lrDate').val(response[0].lrDate);
		 $('#orderNo').val(response[0].orderNo);
		 $('#orderDate').val(response[0].orderDate);
		 $('#dispatchedBy').val(response[0].dispatchedBy);
		 $('#dispatchedDate').val(response[0].dispatchedDate);
		 $('#noOfPacks').val(response[0].noOfPacks);
		 $('#termOfPayment').val(response[0].termOfPayment);
		 $('#terms').val(response[0].terms);
		 $('#lrDate').val(response[0].lrDate);
		 $('#orderBy').val(response[0].orderBy);
		 $('#tinNo').val(response[0].tinNo);
		 $('#packSlipNo').val(response[0].packSlipNo);
		 $('#billNo').val(response[0].billNo);
    	
	}
}
function showUpdateUnBillData(response){
	/*$("#userData ul").remove();
	$("#userData ul li").remove(); */
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	var i=0;
	if(response != undefined ){
		var productArr = response.listBillingInfoCart;
		if(productArr != null){
			$.each(productArr,function(i, catObj) {
				serviceUnitArray[catObj.billDetailsId] = catObj;
				 var tblRow ="<ul class=''>"
					 	+ "<li class='five-box'  title='"+catObj.billDetailsId+"'>"
						+ (i+1)  
						+"</li>"
						+ "<li class='bil-prod-box'  title='"+catObj.productName+"'>"
						+ catObj.productName
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mrp+"'>"
						+ catObj.mrp
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.quantity+"'>"
						+ catObj.quantity
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.rate+"'>"
						+ catObj.rate
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.amount+"'>"
						+ catObj.amount
						+ "</li>"
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='editBill(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						+ "<li class='ten-box'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.billDetailsId
						+ "' onclick='deleteProduct(this.id)' id='editId class='ico del' href='#'>Delete</a>"
						+ '</li>'
						
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
    	$('#totalAmountDisp').text(response.totalAmount);
    	$('#totalAmount').val(response.totalAmount);
    	 $('#totalMrp').val(response.totalMrp);
		 $('#totalQuantity').val(response.totalQuantity);
		 $('#totalRate').val(response.totalRate);
		 
		 $('#billId').val(response.billId);
		 $('#name').val(response.name);
		 $('#discount').val(response.discount);
		 $('#phone').val(response.phone);
		 $('#address').val(response.address);
		 $('#lrNo').val(response.lrNo);
		 $('#lrDate').val(response.lrDate);
		 $('#orderNo').val(response.orderNo);
		 $('#orderDate').val(response.orderDate);
		 $('#dispatchedBy').val(response.dispatchedBy);
		 $('#dispatchedDate').val(response.dispatchedDate);
		 $('#noOfPacks').val(response.noOfPacks);
		 $('#termOfPayment').val(response.termOfPayment);
		 $('#terms').val(response.terms);
		 $('#lrDate').val(response.lrDate);
		 $('#orderBy').val(response.orderBy);
		 $('#tinNo').val(response.tinNo);
		 $('#packSlipNo').val(response.packSlipNo);
		 $('#billNo').val(response.billNo);
    	
	}
}
function showTotalBill(response) {
	$("#totalTable ul").remove();
	$("#totalTable ul li").remove();
	serviceUnitArrayBill = {};
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length > 0){
	$.each(response,function(i, catObj) {
			 $('#totalMrpDisp').text(catObj.totalMrp);
			 $('#totalQuantityDisp').text(catObj.totalQuantity);
			 $('#totalRateDisp').text(catObj.totalRate);
			 $('#totalAmountDisp').text(catObj.totalAmount);
			 
			 $('#totalAmount').val(catObj.totalAmount);
			 $('#totalMrp').val(catObj.totalMrp);
			 $('#totalQuantity').val(catObj.totalQuantity);
			 $('#totalRate').val(catObj.totalRate);
			 
			 $('#billId').val(catObj.billId);
			 $('#name').val(catObj.name);
			 $('#discount').val(catObj.discount);
			 $('#phone').val(catObj.phone);
			 $('#address').val(catObj.address);
			 $('#lrNo').val(catObj.lrNo);
			 $('#lrDate').val(catObj.lrDate);
			 $('#orderNo').val(catObj.orderNo);
			 $('#orderDate').val(catObj.orderDate);
			 $('#dispatchedBy').val(catObj.dispatchedBy);
			 $('#dispatchedDate').val(catObj.dispatchedDate);
			 $('#noOfPacks').val(catObj.noOfPacks);
			 $('#termOfPayment').val(catObj.termOfPayment);
			 $('#terms').val(catObj.terms);
			 $('#orderBy').val(catObj.orderBy);
			 $('#tinNo').val(catObj.tinNo);
			 $('#packSlipNo').val(catObj.packSlipNo);
			 
			});
	}
	
}

function dataClear(){
	
	$('#productId').val("");
	 $('#productName').val("");
	 $('#rate').val("");
	 $('#quantity').val("");
    
	}
function infoDataClear(){
	
	$('#productName').val("");
	 $('#rate').val("");
	 $('#quantity').val("");
	 $("#userData").html("");
	  $('#totalMrpDisp').text("");
	$('#totalQuantityDisp').text("");
	$('#totalRateDisp').text("");
	$('#totalAmountDisp').text("");
	$('#totalAmount').val("");
	 $('#totalMrp').val("");
	 $('#totalQuantity').val("");
	 $('#totalRate').val("");
	 
	 $('#billId').val("");
	 $('#name').val("");
	 $('#discount').val("");
	 $('#phone').val("");
	 $('#address').val("");
	 $('#lrNo').val("");
	 $('#lrDate').val("");
	 $('#orderNo').val("");
	 $('#orderDate').val("");
	 $('#dispatchedBy').val("");
	 $('#dispatchedDate').val("");
	 $('#noOfPacks').val("");
	 $('#termOfPayment').val("");
	 $('#terms').val("");
	 $('#lrDate').val();
	 $('#billNo').val("");
	 $('#packSlipNo').val("");
	 $('#orderBy').val("");
	 $('#tinNo').val("");
	
	
}
	function editBill(id)
	{		 		
		$('#productId').val( serviceUnitArray[id].productId);
		$('#quantity').val( serviceUnitArray[id].quantity);
		$('#rate').val( serviceUnitArray[id].rate);
		$("#billDetailsId").val(id);
		$("#billId").val( serviceUnitArray[id].billId);
	}
	function deleteProduct(id) {
		
		data = {};
		data["billId"] =serviceUnitArray[id].billId;
		data["billDetailsId"] = serviceUnitArray[id].billDetailsId;
		data["productId"] = serviceUnitArray[id].productId;
		data["quantity"] = serviceUnitArray[id].quantity;
		
		$.ajax({
            type: "POST",
            url: "deleteBillingDetailsCart.htm",
            data: "jsondata= "+JSON.stringify(data),
            success: function (response) {
            	$("#userData ul").remove();
            	$("#userData ul li").remove();
            	$("#userData").html("");
          	  	$('#totalMrpDisp').text("");
            	$('#totalQuantityDisp').text("");
            	$('#totalRateDisp').text("");
            	$('#totalAmountDisp').text("");
            	$('#totalAmount').val("");
            	$('#totalMrp').val("");
            	$('#totalQuantity').val("");
            	$('#totalRate').val("");
            	$('#billNo').val("");
            	$('#showAmount').val("");
            	$('#wordsAmount').val("");
            	$('#netAmount').val("");
            	
           	 if(response != 0){
           		     	$("#unc").text("Deleted Sucessfully");
           		     	$("#unc").show();
           		     	$("#unc").fadeOut(15000); 
           		     		showBillDetailsData(response);
           		     	$('#totalAmount').val("");
           		     	$('#totalMrp').val("");
           		     	$('#totalQuantity').val("");
           		     	$('#totalRate').val("");
                }
                
            },
            error: function (e) { 
                $("#btn-save").prop("disabled", false);
            }

	}); 
		
	}

	
	function saveBillProduct(){
		$.ajax({
	             type: "POST",
	             url: "saveBillProduct.htm",
	             data: "jsondata= "+JSON.stringify(data),
	             success: function (response) {
	            	 data = {};
	            	 $("#userData ul").remove();
	            		$("#userData ul li").remove();
	            	 resJSON = JSON.parse(response);
	                 if(resJSON != null ){
	 	            	 if(resJSON.status == "ERROR"){
	 	            		var stock=0;
	 	            		 var objArr = JSON.parse(disMsg)
	 	            		 for(var i=0;i<objArr.length;i++){
	 	            			if(objArr[i].productId ==$("#productId").val()){
	 	            				stock= objArr[i].stock;
	 	            				//return;
	 	            			}
	 	            		 }
	 	                	  $("#unc").text('Product Stock is Low '+stock);
	 	                	  $("#productName").val("");
	 	                	  $("#unc").show();
	 	                      $("#unc").fadeOut(15000);
	 	                  }else{
	 	                	  
	 	                	 showBillDetailsData(response);
	                	  $("#unc").text("Save Sucessfully");
	            		   $("#unc").show();
	                       $("#unc").fadeOut(15000);
	                       $("#productId").val("");
		  					$("#quantity").val("");
		  					$("#rate").val("");
		  					$("#billDetailsId").val("");
		  					showCurrencey();
	 	                  }
	                 }
	            	
	                 },
	             error: function (e) { 
	                 $("#btn-save").prop("disabled", false);
	             }
	             
	             
		}); 
		
	}
	
	
	 	function poupulatePurchase() {
	var name = $("#name").val();
	var lstOrders =purchaseArr;
	if(lstOrders != null && lstOrders.length > 0){
		$.each(lstOrders,function(i, catObj) {
			 if(name == catObj.name){
				 $('#phone').val(catObj.mobileNo);
				 $('#address').val(catObj.address);
				 $('#name').val(catObj.name);
				 return false;
			} 
		});
	}
			
		} 
function newBill() {
	 data = {};
	data["productId"] = $("#productId").val();
	data["productName"] = $("#productName").val();
	data["quantity"] = $("#quantity").val();
	data["rate"] = $("#rate").val();
	data["mrp"] = $("#mrp").val();
	data["billId"] = $("#billId").val();
	data["billDetailsId"] = $("#billDetailsId").val();
    
	if(!$('#rate').val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) ) {
	    $('#rate').css('color','red');
	    $("#rate").css("border-color","red");
	    $("#rate").attr("placeholder","Please enter rate");
	    $('#rate').addClass('your-class');
	    $("#unc").text("Please enter numbers only.");
		   $("#unc").show();
        $("#unc").fadeOut(15000);
	    return false;
	    }
    else if(!$('#quantity').val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) ) {
	    $('#quantity').css('color','red');
	    $("#quantity").css("border-color","red");
	    $("#quantity").attr("placeholder","Please enter quantity");
	    $('#quantity').addClass('your-class');
	    $("#unc").text("Please enter numbers only.");
		   $("#unc").show();
     $("#unc").fadeOut(15000);
	    return false;
	    }
    else if($("#billDetailsId").val() != ""){
		updateBillProduct();
	}else{
		$("#btn-save").prop("disabled", true);
		saveBillProduct();
	}
	
	

}
function updateBillProduct(){
	$.ajax({
             type: "POST",
             url: "updateBillDetailsCart.htm",
             data: "jsondata= "+JSON.stringify(data),
             success: function (response) {
            	 data = {};
            	 $("#userData ul").remove();
         		$("#userData ul li").remove();
            	 resJSON = JSON.parse(response);
                 if(resJSON != null ){
 	            	 if(resJSON.status == "ERROR"){
 	            		var stock=0;
 	            		 var objArr = JSON.parse(disMsg)
 	            		 for(var i=0;i<objArr.length;i++){
 	            			if(objArr[i].productId ==$("#productId").val()){
 	            				stock= objArr[i].stock;
 	            				//return;
 	            			}
 	            		 }
 	                	  $("#unc").text('Product Stock is Low '+stock);
 	                	  $("#productName").val("");
 	                	  $("#unc").show();
 	                      $("#unc").fadeOut(15000);
 	                  }else{
 	                	  
 	                	 showBillDetailsData(response);
                	  $("#unc").text("update Sucessfully");
            		   $("#unc").show();
                       $("#unc").fadeOut(15000);
                       $("#productId").val("");
	  					$("#quantity").val("");
	  					$("#rate").val("");
	  					$("#billDetailsId").val("");
 	                  }
                 }
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updateBillInfoCart(id){
	  var showPan= "";
	  if($("#showPan").is(':checked')){
		  showPan ="1";
	  }else{
		  showPan ="0";
	  }
	  alert("showPan----"+showPan);
	data = {};
	data["showPan"] = showPan;
	data["customerType"] = $("#customerType").val();
	data["billId"] = $("#billId").val();
	data["billNo"] = $("#billNo").val();
	data["orderNo"] = $("#orderNo").val();
	data["orderDate"] = $("#orderDate").val();
	data["purchaserName"] = $("#purchaserName").val();
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
	data["billDate"] = $("#billDate").val();
	data["tinNo"] = $("#tinNo").val();
	data["eMail"] = $("#eMail").val();
	data["netAmount"] = $("#netAmount").val();
	
	var selCustType = $("#customerType").val();
	 if(selCustType == 'oldCustmer'){
	  var nameSelect = $("#name").val();
	  if(nameSelect.length == 0){
	  //alert("Please Select Name.");
	  return false;
	  }
	 }else{
	  var nameTxt = $("#purchaserName").val();
	  if(nameTxt.length == 0){
	  //alert("Please Enter Name.");
	  return false;
	  }
	 }
	
	if($('#billNo').val().length == 0 ) {
	    $('#billNo').css('color','red');
	    $("#billNo").css("border-color","red");
	    $("#billNo").attr("placeholder","Please enter billNo");
	    $('#billNo').addClass('your-class');
	    return false;
	    }
	else if($('#payment').val().length == 0 ) {
	    $('#payment').css('color','red');
	    $("#payment").css("border-color","red");
	    $("#payment").attr("placeholder","Please enter payment");
	    $('#payment').addClass('your-class');
	    return false;
	    }
    else if($('#totalAmount').val().length == 0 ) {
	    $('#totalAmount').css('color','red');
	    $("#totalAmount").css("border-color","red");
	    $("#totalAmount").attr("placeholder","Please enter totalAmount");
	    $('#totalAmount').addClass('your-class');
	    return false;
	    }
    else if($('#phone').val().length == 0 ) {
	    $('#phone').css('color','red');
	    $("#phone").css("border-color","red");
	    $("#phone").attr("placeholder","Please enter phone");
	    $('#phone').addClass('your-class');
	    return false;
	    }
    
    else if($('#address').val().length == 0 ) {
	    $('#address').css('color','red');
	    $("#address").css("border-color","red");
	    $("#address").attr("placeholder","Please enter address");
	    $('#address').addClass('your-class');
	    return false;
	    }
    else if($('#eMail').val().length == 0 ) {
	    $('#eMail').css('color','red');
	    $("#eMail").css("border-color","red");
	    $("#eMail").attr("placeholder","Please enter email");
	    $('#eMail').addClass('your-class');
	    return false;
	    }

	 $.ajax({
             type: "POST",
             url: "genarateBill.htm",
             data:"jsondata= "+JSON.stringify(data),
             success: function (response) {
            	 $("#userData").html("");
            	  $('#totalMrpDisp').text("");
              	$('#totalQuantityDisp').text("");
              	$('#totalRateDisp').text("");
              	$('#totalAmountDisp').text("");
              	$('#totalAmount').val("");
            	 $('#totalMrp').val("");
        		 $('#totalQuantity').val("");
        		 $('#totalRate').val("");
        		 
        		 $('#billId').val("");
        		 $('#name').val("");
        		 $('#discount').val("");
        		 $('#phone').val("");
        		 $('#address').val("");
        		 $('#lrNo').val("");
        		 $('#lrDate').val("");
        		 $('#orderNo').val("");
        		 $('#orderDate').val("");
        		 $('#dispatchedBy').val("");
        		 $('#dispatchedDate').val("");
        		 $('#noOfPacks').val("");
        		 $('#termOfPayment').val("");
        		 $('#terms').val("");
        		 $('#lrDate').val();
        		 $('#billNo').val("");
        		 $('#packSlipNo').val("");
        		 $('#orderBy').val("");
        		 $('#tinNo').val("");
        		 $('#netAmount').val("");
        	   	 $('#eMail').val("");
        	   	$("#purchaserName").val("");
              	window.location.href = "billInfoHome";
                  
            	
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }
             
             
	}); 
}
function saveInfoCart(){
	data = {};
	data["customerType"] = $("#customerType").val();
	data["purchaserName"] = $("#purchaserName").val();
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
	data["billDate"] = $("#billDate").val();
	data["tinNo"] = $("#tinNo").val();
	data["eMail"] = $("#eMail").val();
	data["netAmount"] = $("#netAmount").val();
	data["showPan"] = $("#showPan").val();
	
	var selCustType = $("#customerType").val();
	 if(selCustType == 'oldCustmer'){
	  var nameSelect = $("#name").val();
	  if(nameSelect.length == 0){
	  //alert("Please Select Name.");
	  $("#unc2").text('Please Select Name.');
		$("#unc2").show();
	   	$("#unc2").fadeOut(20000);
	  return false;
	  }
	 }else{
	  var nameTxt = $("#purchaserName").val();
	  if(nameTxt.length == 0){
	  //alert("Please Enter Name.");
	  $("#unc2").text('Please Select Name.');
		$("#unc2").show();
	   	$("#unc2").fadeOut(20000);
	  return false;
	  }
	 }
	if($('#billNo').val().length == 0 ) {
	    $('#billNo').css('color','red');
	    $("#billNo").css("border-color","red");
	    $("#billNo").attr("placeholder","Please enter billNo");
	    $('#billNo').addClass('your-class');
	    return false;
	    }
	else if($('#payment').val().length == 0 ) {
	    $('#payment').css('color','red');
	    $("#payment").css("border-color","red");
	    $("#payment").attr("placeholder","Please enter payment");
	    $('#payment').addClass('your-class');
	    return false;
	    }
    else if($('#totalAmount').val().length == 0 ) {
	    $('#totalAmount').css('color','red');
	    $("#totalAmount").css("border-color","red");
	    $("#totalAmount").attr("placeholder","Please enter totalAmount");
	    $('#totalAmount').addClass('your-class');
	    return false;
	    }
    else if($('#phone').val().length == 0 ) {
	    $('#phone').css('color','red');
	    $("#phone").css("border-color","red");
	    $("#phone").attr("placeholder","Please enter phone");
	    $('#phone').addClass('your-class');
	    return false;
	    }
    else if($('#address').val().length == 0 ) {
	    $('#address').css('color','red');
	    $("#address").css("border-color","red");
	    $("#address").attr("placeholder","Please enter address");
	    $('#address').addClass('your-class');
	    return false;
	    }
    else if($('#eMail').val().length == 0 ) {
	    $('#eMail').css('color','red');
	    $("#eMail").css("border-color","red");
	    $("#eMail").attr("placeholder","Please enter email");
	    $('#eMail').addClass('your-class');
	    return false;
	    }
    else if($('#name').val().length == 0 ) {
	    $('#name').css('color','red');
	    $("#name").css("border-color","red");
	    $("#name").attr("placeholder","Please enter email");
	    $('#name').addClass('your-class');
	    return false;
	    }
    
	$.ajax({
             type: "POST",
             url: "saveCart.htm",
             data:"jsondata= "+JSON.stringify(data),
             success: function (response) {
            	 data = {};
            	 $("#userData").html("");
            	  $('#totalMrpDisp').text("");
              	$('#totalQuantityDisp').text("");
              	$('#totalRateDisp').text("");
              	$('#totalAmountDisp').text("");
              	$('#totalAmount').val("");
            	 $('#totalMrp').val("");
        		 $('#totalQuantity').val("");
        		 $('#totalRate').val("");
        		 
        		 $('#billId').val("");
        		 $('#name').val("");
        		 $('#discount').val("");
        		 $('#phone').val("");
        		 $('#address').val("");
        		 $('#lrNo').val("");
        		 $('#lrDate').val("");
        		 $('#orderNo').val("");
        		 $('#orderDate').val("");
        		 $('#dispatchedBy').val("");
        		 $('#dispatchedDate').val("");
        		 $('#noOfPacks').val("");
        		 $('#termOfPayment').val("");
        		 $('#terms').val("");
        		 $('#lrDate').val();
        		 $('#billNo').val("");
        		 $('#packSlipNo').val("");
        		 $('#orderBy').val("");
        		 $('#tinNo').val("");
        		 $('#netAmount').val("");
        		 $("#showAmount").val("");
        	   		$("#wordsAmount").val("");
        	   		window.location.href = "billInfoHome";
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }
             
             
	}); 
}
function cancelBill(id) {
	var sBillId =$("#billId").val();
	
	
	$.ajax({
        type: "POST",
        url: "cancelBill.htm",
        data: "sBillId= "+sBillId,
        success: function (response) {
        	 $("#userData").html("");
       	  $('#totalMrpDisp').text("");
         	$('#totalQuantityDisp').text("");
         	$('#totalRateDisp').text("");
         	$('#totalAmountDisp').text("");
         	$('#totalAmount').val("");
       	 $('#totalMrp').val("");
   		 $('#totalQuantity').val("");
   		 $('#totalRate').val("");
   		 
   		 $('#billId').val("");
   		 $('#name').val("");
   		 $('#discount').val("");
   		 $('#phone').val("");
   		 $('#address').val("");
   		 $('#lrNo').val("");
   		 $('#lrDate').val("");
   		 $('#orderNo').val("");
   		 $('#orderDate').val("");
   		 $('#dispatchedBy').val("");
   		 $('#dispatchedDate').val("");
   		 $('#noOfPacks').val("");
   		 $('#termOfPayment').val("");
   		 $('#terms').val("");
   		 $('#lrDate').val();
   		 $('#billNo').val("");
   		 $('#packSlipNo').val("");
   		 $('#orderBy').val("");
   		 $('#tinNo').val("");
   		$('#netAmount').val("");
   		$('#eMail').val("");
   		$("#purchaserName").val("");
   		$("#showAmount").val("");
   		$("#wordsAmount").val("");
        },
        error: function (e) { 
            $("#btn-save").prop("disabled", false);
        }

}); 
}


function onkeyRate(id) {
	if(!$('#rate').val().match(/^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$/) ) {
	    $("#unc").text("Please enter numbers only.");
		   $("#unc").show();
        $("#unc").fadeOut(15000);
	    return false;
	    }
	
}
function onkeyQuantity(id) {
	
	var regex = new RegExp("^\d*[0-9](|.\d*[0-9]|,\d*[0-9])?$");
    var str = String.fromCharCode(!id.charCode ? id.which : id.charCode);
    if (regex.test(str)) {
        return true;
    }
    else
    {
    
    $("#unc").text('Please Enter Numbers');
	$("#unc").show();
   	$("#unc").fadeOut(20000);
    return false;
    }
}
function netAmount() {
	var totalAmount =$('#totalAmount').val();
	var discount =$('#discount').val();
	if(totalAmount !=0){
	var netAmount = parseInt(totalAmount) - parseInt(discount);
	showCurrencey();
	}
}


function showCurrencey(){
	var totalAmount =$('#totalAmount').val();
	var discount =$('#discount').val();
	var numToTxt = "";
	if (totalAmount.length >0) {
		numToTxt = parseInt(totalAmount);
		if (discount.length >0) {
			numToTxt = parseInt(totalAmount) - parseInt(discount);
		}
		var number = parseInt(numToTxt);
		var options = {
			style : "currency",
			currency : "INR"
		};
		var showAmount = number.toLocaleString("hi-IN", options);
		$('#showAmount').text(showAmount);

		var amtWords = number2text(numToTxt);

		$('#wordsAmount').text(amtWords);
	}
}

function number2text(value) {
   var fraction = Math.round(frac(value)*100);
   var f_text  = "";

   if(fraction > 0) {
       f_text = "AND "+convert_number(fraction)+" PAISE";
   }

   return convert_number(value)+" RUPEE "+f_text+" ONLY";
}

function frac(f) {
   return f % 1;
}

function convert_number(number)
{
   if ((number < 0) || (number > 999999999)) 
   { 
       return "NUMBER OUT OF RANGE!";
   }
   var Gn = Math.floor(number / 10000000);  / Crore / 
   number -= Gn * 10000000; 
   var kn = Math.floor(number / 100000);     / lakhs / 
   number -= kn * 100000; 
   var Hn = Math.floor(number / 1000);      / thousand / 
   number -= Hn * 1000; 
   var Dn = Math.floor(number / 100);       / Tens (deca) / 
   number = number % 100;               / Ones / 
   var tn= Math.floor(number / 10); 
   var one=Math.floor(number % 10); 
   var res = ""; 

   if (Gn>0) 
   { 
       res += (convert_number(Gn) + " CRORE"); 
   } 
   if (kn>0) 
   { 
           res += (((res=="") ? "" : " ") + 
           convert_number(kn) + " LAKH"); 
   } 
   if (Hn>0) 
   { 
       res += (((res=="") ? "" : " ") +
           convert_number(Hn) + " THOUSAND"); 
   } 

   if (Dn) 
   { 
       res += (((res=="") ? "" : " ") + 
           convert_number(Dn) + " HUNDRED"); 
   } 


   var ones = Array("", "ONE", "TWO", "THREE", "FOUR", "FIVE", "SIX","SEVEN", "EIGHT", "NINE", "TEN", "ELEVEN", "TWELVE", "THIRTEEN","FOURTEEN", "FIFTEEN", "SIXTEEN", "SEVENTEEN", "EIGHTEEN","NINETEEN"); 
var tens = Array("", "", "TWENTY", "THIRTY", "FOURTY", "FIFTY", "SIXTY","SEVENTY", "EIGHTY", "NINETY"); 

   if (tn>0 || one>0) 
   { 
       if (!(res=="")) 
       { 
           res += " AND "; 
       } 
       if (tn < 2) 
       { 
           res += ones[tn * 10 + one]; 
       } 
       else 
       { 

           res += tens[tn];
           if (one>0) 
           { 
               res += ("-" + ones[one]); 
           } 
       } 
   }

   if (res=="")
   { 
       res = "zero"; 
   } 
   return res;
}

$(document).ready(function(){
	
});