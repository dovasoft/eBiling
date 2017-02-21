<%-- <html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%> --%>

<head>
<style type="text/css">
.bill-info-td{
color: #fff;
}

</style>
</head>
<body>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var billInfo = '${sessionScope.printBillVal}';
var unBill = '${sessionScope.printUnBillVal}';
$(document).ready(function() {
	console.log("unbill: "+ unBill);
	console.log("billInfo: "+ billInfo);
	if(billInfo != ""){
		showBillDetailsData(billInfo);
		showPrintData(billInfo);	
	}
	if(unBill != ""){
		//alert(unBill);
		showUnBillDetailsData(JSON.parse(unBill));
		//showUnBIllPrintData(unBill);
	}
	
});

function showBillDetailsData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove(); 
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	var i=0;
	if(response != undefined && response.length > 0){
		var resBillInfo = response[0].listBillingDeteails;
		//purchaseArr = response[0].listPurchase;
		if(resBillInfo != null){
			$.each(resBillInfo,function(i, catObj) {
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
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
    	 $('#totalMrpDisp').text(response[0].totalMrp);
    	 $('#totalQuantityDisp').text(response[0].totalQuantity);
    	 $('#totalRateDisp').text(response[0].totalRate);
    	 $('#totalAmountDisp').text(response[0].totalAmount);
	}
	//paginationTable(3);
}

function showPrintData(response){
	serviceUnitArray = {};
	response = jQuery.parseJSON(response);
	if(response != undefined && response.length >0){
	$.each(response,function(i, catObj) {
		//alert('catObj.billId=='+catObj.billId);
		$('#billNo').text(catObj.billNo);
		$('#billDate').text(catObj.billDate);
		 $('#lrNo').text(catObj.lrNo);
		 $('#lrDate').text(catObj.lrDate);
		 $('#orderNo').text(catObj.orderNo);
		 $('#orderDate').text(catObj.orderDate);
		 $('#dispatchedBy').text(catObj.dispatchedBy);
		 $('#noOfPacks').text(catObj.noOfPacks);
		 $('#orderBy').text(catObj.orderBy);
		 $('#packSlipNo').text(catObj.packSlipNo);
		 $('#termsOfPayment').text(catObj.termOfPayment);
		 $('#terms').text(catObj.terms);
		 $('#name').text(catObj.name);
		 $('#discount').text(catObj.discount);
		 $('#phone').text(catObj.phone);
		 $('#address').text(catObj.address);
		 $('#netAmount').text(catObj.netAmount);
	});
	}
}
function showUnBillDetailsData(response){
	$("#userData ul").remove();
	$("#userData ul li").remove(); 
	serviceUnitArray = {};
	var i=0;
	if(response != undefined){
		var resBillInfo = response.listBillingInfoCart;
		//purchaseArr = response[0].listPurchase;
		if(resBillInfo != null){
			$.each(resBillInfo,function(i, catObj) {
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
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
		}
    	 $('#totalMrpDisp').text(response.totalMrp);
    	 $('#totalQuantityDisp').text(response.totalQuantity);
    	 $('#totalRateDisp').text(response.totalRate);
    	 $('#totalAmountDisp').text(response.totalAmount);
    	 $('#billNo').text(response.billNo);
    	 $('#billDate').text(response.billDate);
		 $('#lrNo').text(response.lrNo);
		 $('#lrDate').text(response.lrDate);
		 $('#orderNo').text(response.orderNo);
		 $('#orderDate').text(response.orderDate);
		 $('#dispatchedBy').text(response.dispatchedBy);
		 $('#noOfPacks').text(response.noOfPacks);
		 $('#orderBy').text(response.orderBy);
		 $('#packSlipNo').text(response.packSlipNo);
		 $('#termsOfPayment').text(response.termOfPayment);
		 $('#terms').text(response.terms);
		 $('#name').text(response.name);
		 $('#discount').text(response.discount);
		 $('#phone').text(response.phone);
		 $('#address').text(response.address);
		 $('#netAmount').text(response.netAmount);
	}
	//paginationTable(3);
}


function printBill(){
	//alert('printBill');
	$('#newbill').hide();
	$('#page-title').hide();
	$('#header').hide();
	$('#footer').hide();
	//window.print();
	/* alert('printBill11111');
	 var printContents = document.getElementById("printSec").innerHTML;
	 var originalContents = document.body.innerHTML;
	 document.getElementById('header').style.display = 'none';
	 document.getElementById('footer').style.display = 'none';
	 document.body.innerHTML = printContents; */
	
	 window.print();


}
function dataCancel() {
	if(billInfo != ""){
		window.location.href="/eBilling/searchBill";
	}else{
		window.location.href="/eBilling/unBillCart";
	}
}
var panNo = '${sessionScope.showPan}';
if(panNo == "1"){
	$('#ourTin').text(1234567890);
}

</script>
		<section id="printSec" class="container">
			<div class="block" style="background: #314252;">
				<h2 id="newbill"><span class="icon1">&nbsp;</span>Bill Products</h2>
				<form:form name="cf_form" method="post" id="contact-form" commandName="" class="form-horizontal" action="http://localhost:8080/personal/reg#" onsubmit="return validationequiry()">
				<div>
				<table width="100%">
				<tr>
					<div class="header-top header-top-1">
						<div class="block-1">
					    	<h1 id="logo"><a href="index.html"><img src="images/sai-baba.png" width="97" height="88" alt="" style="padding-left: 1px;"></a></h1>    	
					    </div>
					    <div class="block-2">
					    	<div class="cname">
					    		<div id="companyNameBrand">Gowthami Handlooms</div>
					    		<p class="text-manfact">Manufacturers of: Handloom Dress Materials & Sarees</p>
					    	</div>    	
					    </div>
					    <div class="block-4">    		
					    		<p class="text-prop">Prop: <span>D. Kumaraswamy</span></p>
					    		<p class="text-address">MIG-183, 1<small>st</small>floor,Bharat Nagar Colony,</p>  
					    		<p class="text-address">Moosapet,Hyderabad - 500 018</p>
					    		<h4 class="text-tin">Tin no: <div id="ourTin"><span ></span></div></h4> 	
					    </div>
					    <div class="block-3">
							<div class="mobile-no">
								<h5>Mobile: 9246885990 <p>9246595990</p> <p>9246959550</p></h5>
								<p class="text-email"><span class="label-text">Email:</span> <span id="clientEmailBrand">gowthamihandlooms@gmail.com</span></p>
							</div>
						</div>
					</div> 
				</tr>
				<tr>
					<td style="" colspan="2">
						<table border="0" rowspan="0" colspan="0" width="100%" border="0">
							<tr>
								<td style="width: 30%;padding-left: 2%;vertical-align: sub;padding-top: 2%;border:1px solid #cccccc;border-left:0;border-bottom:0;">
									<div id="name"><h5></h5></div>
									<div id="address"></div>
									<div id="phone"></div>
								</td>
								<td style="width: 70%;">
									<table class="billinfo-table" border="0" rowspan="0" colspan="0" width="100%">
										<tr>
											<td class="bill-info-td" style="border-left:0;">INVOICE NO:</td>
											<td class="bill-info-td"><div id="billNo"></div></td>
											<td class="bill-info-td">DATE:</td>
											<td class="bill-info-td" style="border-right:0;"><div id="billDate"></div></td>
										</tr>
										<tr>
											<td class="bill-info-td" style="border-left:0;">LR NO:</td>
											<td class="bill-info-td"><div id="lrNo"></div></td>
											<td class="bill-info-td">DATE:</td>
											<td class="bill-info-td" style="border-right:0;"><div id="lrDate"></div></td>
										</tr>
										<tr>
											<td class="bill-info-td" style="border-left:0;">ORDER NO:</td>
											<td class="bill-info-td"><div id="orderNo"></div></td>
											<td class="bill-info-td">ORDER DATE:</td>
											<td class="bill-info-td" style="border-right:0;"><div id="orderDate"></div></td>
										</tr>
										<tr>
											<td class="bill-info-td" style="border-left:0;">DISPATCHED BY:</td>
											<td class="bill-info-td"><div id="dispatchedBy"></div></td>
											<td class="bill-info-td">NO OF PACKS:</td>
											<td class="bill-info-td" style="border-right:0;"><div id="noOfPacks"></div></td>
										</tr>
										<tr>
											<td class="bill-info-td" style="border-left:0;">ORDERED BY:</td>
											<td class="bill-info-td"><div id="orderBy"></div></td>
											<td class="bill-info-td">PACK SLIP NO:</td>
											<td class="bill-info-td" style="border-right:0;"><div id="packSlipNo"></div></td>
										</tr>
										<tr>
											<td class="bill-info-td" style="border-bottom:0;border-left:0;">Terms of Payment:</td>
											<td class="bill-info-td" style="border-bottom:0;"><div id="termsOfPayment"></div></td>
											<td class="bill-info-td" style="border-bottom:0;">TERMS</td>
											<td class="bill-info-td" style="border-right:0 ;border-bottom:0;"><div id="terms"></div></td>
										</tr>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>				
				<!-- <tr>
					<td style="margin: 5px;" colspan="2">
						<ul class="table-list">
							<li class="five-box">S.No</li>
							<li id="bil-prod-box"><b><div id="name"></div></b></li>
							<li class="five-box"><b><div id="totalMrp"></div></b></li>
                            <li class="five-box"><b><div id="totalQuantity"></div></b></li>
                            <li class="five-box"><b><div id="totalRate"></div></b></li>
                            <li class="five-box"><b><div id="totalAmount"></div></b></li>
							
						</ul>
					</td>
				</tr> -->

			</table>
				
				</div>
					
				</form:form>
			</div>
			<div class="block table-toop-space">
				<div class="head-box">
					<h2><span class="icon2">&nbsp;</span>Bill Products<aside class="block-footer-right sucessfully" id="unc1" style="display:none;" >Delete Sucessfully</aside></h2>
				</div>
				<div class="block-box-mid block-box-last-mid">
                                    <ul class="table-list">
                                        <li class="five-box" style="width:35%;border-bottom:1px solid #cccccc;">S.No
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                
                                        <li id="bil-prod-box" style="width:35%;border-bottom:1px solid #cccccc;">Description
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box" style="width:35%;border-bottom:1px solid #cccccc;">MRP
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                                         
                                        <li class="five-box" style="width:35%;border-bottom:1px solid #cccccc;">Quantity
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>
                                        <li class="five-box" style="width:35%;border-bottom:1px solid #cccccc;">Rate
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                                               
                                        <li class="five-box" style="width:35%;border-bottom:1px solid #cccccc;">Amount
                                            <ul>
                                                <li><a class="top" href="#">&nbsp;</a></li>
                                                <li><a class="bottom" href="#">&nbsp;</a></li>
                                            </ul>
                                        </li>                
                                        <!-- <li class="ten-box">Delete</li>
                                        <li class="eleven-box last">Edit</li> -->
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
                </ul></div>
                	<div>
                		<ul class="table-list" >                        
                            <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                            <li class="five-box" style="text-align:right;"><h4>Discount</h4></li>
                            <li class="five-box" id="discount"><span></span></li>  
                		</ul>
                	</div>
                	<div>
                		<ul class="table-list" >                        
                            <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                           <li class="five-box">&nbsp;</li>
                            <li class="five-box" style="text-align:right;"><h4>Grand Total</h4></li>
                            <li class="five-box" id="netAmount"><span></span></li>  
                		</ul>
                	</div>
						
				</div>
				<div class="block-footer" >
					<aside class="block-footer-left"><exptotal></exptotal></aside>
					<aside class="block-footer-right">				
					<input class="btn-cancel" name="" value="Clear" type="button" onclick="dataCancel();">
						<input class="btn-save" name="" value="Print" type="button" id="print" onclick="printBill();">
					</aside>
				</div>
			</div>
		</section>
		
		</body></html>
