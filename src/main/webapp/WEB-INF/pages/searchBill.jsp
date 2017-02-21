<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://displaytag.sf.net" prefix="display"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<!DOCTYPE style PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- <script type="text/javascript" src="/js/CustomPagenation.js"></script> -->
<script type="text/javascript" src="js/searchBill.js"></script>
<script type="text/javascript">


</script>
<script type="text/javascript">

$(document).ready(function() {
	var allSearchBill = '${sessionScope.allSearchBill}';
		showBillInfoData(allSearchBill);
		
		$('#name').keypress(function (e) {
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
		
		$('#phone').keypress(function (e) {
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
		$('#billNo').keypress(function (e) {
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

 
$(function() {
	$("#billFromDate").datepicker({
		changeDate : true,
		changeMonth : true,
		changeYear : true,
		showButtonPanel : false,
		dateFormat : 'dd-mm-yy'
	});
});
$(function() {
	$("#billEndDate").datepicker({
		changeDate : true,
		changeMonth : true,
		changeYear : true,
		showButtonPanel : false,
		dateFormat : 'dd-mm-yy'
	});
});
</script>


<!-- SET: MAIN CONTENT -->
<section class="container">
    <div class="block">
        <h2><span class="icon1">&nbsp;</span>Search Bill</h2>
        <form name="cf_form"  action="#" onsubmit="return validationequiry()" style=" background-color: #ffffff;">
            <div class="block-searchbill">
                <div class="block-searchbill-input">
                    <label>Bill No</label>
                    <input type="text" name="pname" id="billNo" onkeyup="searchBill();">
                </div>
                <div class="block-searchbill-input">
                    <label>Name</label>
                    <input type="text" name="pname" id="name"  onkeyup="searchBill();">
                </div> 
                <div class="block-searchbill-input">
                    <label>Mobile No</label>
                    <input type="text" name="phone" id="phone"  onkeyup="searchBill();">
                </div>
            </div>
            <!-- <div  class="block-searchbill">
             <div class="block-searchbill-input">
                    <label>Bill Date From</label>
                    <input type="text" name="pname" id="billFromDate">
                </div>
                <div class="block-searchbill-input">
                    <label>Bill Date End</label>
                    <input type="text" name="pname" id="billEndDate">
                </div>
            </div> -->
            <div class="block-footer">
               <!--  <aside class="block-footer-left sucessfully" id="unc" style="diplay:none">Sucessfully Message</aside> -->
                <aside class="block-footer-right">
                    <input class="btn-cancel" name="" value="Clear" type="button" onclick="dataClear();">
                    <!-- <input class="btn-save" name="" value="Search" id="search" type="button"> -->
                </aside>
            </div>
        </form>
    </div>
    <div class="block table-toop-space">
        <div class="head-box">
            <h2><span class="icon2">&nbsp;</span>Bill Details</h2>
        </div>
        <div class="block-box-mid block-box-last-mid">
            <ul class="table-list">
                <li class="five-box" style="width:18%;">Bill No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="nine-box" style="width:95%;">Name
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:34%;">Mobile No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:35%;">Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:24%;">Amount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="five-box" style="width:21%;">Discount
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li> 
                <li class="five-box" style="width:25%;">LR No
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:30%;">LR Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>
                <li class="five-box" style="width:25%;">Dispatch
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                
                <li class="five-box" style="width:25%;">Dispatch Date
                    <ul>
                        <li><a class="top" href="#">&nbsp;</a></li>
                        <li><a class="bottom" href="#">&nbsp;</a></li>
                    </ul>
                </li>                 
                <li class="ten-box" style="width:20%;">Details</li>
                <li class="eleven-box last" style="width:16%;">Duplicate</li>
            </ul>
            <div class="table-list-blk" id="billData">
                             
            </div>
        </div>
        <div class="block-footer">
            <aside class="block-footer-left"><exptotal></exptotal></aside>
            <aside class="block-footer-right">
               <!--  <input class="btn-cancel" name="" value="Clear" type="button">
                <input class="btn-save" name="" value="Save" type="submit"> -->
            </aside>
        </div>
    </div>
</section>
<!-- END: MAIN CONTENT --> 
</body></html>
