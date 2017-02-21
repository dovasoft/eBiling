
<%@page import="com.eBilling.model.Register"%>
<script type="text/javascript" src="js/jquery.min.js"></script>
<style>
.highlight {background-color: #F00; color: #FFF;}
.highlight a {color: #FFF;}
#thenavigation li {display: inline; padding: 0 10px;}
#thenavigation li a {text-decoration: none;}
</style>
<script type="text/javascript">
$(document).ready(function() {
	var tabAct = '${tabActive}';
	$("#menuDiv a" ).removeClass('active');
	$("#menuDiv a#"+tabAct ).addClass('active');
	
$("#logout").click(function(){
	  $.ajax({ 
	    	type : "GET",
			url : "logOut",
			success : function(response){
				//alert('logout');
			}
	  });
	});
});
</script>
<nav>
<ul id="menuDiv">
			<%
			Register register = (Register) session.getAttribute("userInfo");                     
                if(register == null) {
            %>
            <li> Product </li>
            <li> Stock </li>
            <li> Purchaser </li>
			<li> New Bill </li>
			<li>BillSearch</li>
			<li> UnBill </li>
			<li> Damage </li>
			<li> Upload </li>
			<li> Users </li>
			<li> Send Sms </li>
            <li style="padding-left:50%;">Hi,<a href="/eBilling/loginHome">Login</a></li>

        <% } else {
         %>
         <li> <a href="productHome" id="product">Product</a> </li>
         <li> <a href="stockHome" id="stocks">Stock</a> </li>
         <li> <a href="purchaseInfoHome" id="purchaser">Purchaser</a> </li>
		<li> <a href="newBill" id="newBill">New Bill</a> </li>
		<li> <a href="searchBill" id="searchBill">BillSearch</a> </li>
		<li> <a href="unBillCart" id="unBill">Consignment Bill</a> </li>
		<li> <a href="damageHome" id="damage">Damage</a> </li>
		<% 
		 if(register.getRegType().equals("Admin")) {
			 
		 
		%>
		<li> <a href="uploadHome" id="upload">Upload</a> </li>
		<li> <a href="allUsers" id="allUser">Users</a> </li>
		<% 
		 }
		%>
		<li> <a href="sendSmsHome" id="sendSms">Send Sms</a> </li>
		
        <li style="padding-left:19%; color:#283da2;margin-left: 743px;position: absolute;"><b>Hi, <%=register.getRegName() %></b><a href="logOut" id="logout" style="margin-left: 90px;position: absolute;margin-top:-5px;"">Logout</a></li>
        <% }%>
		
</ul>
    <!-- <ul>
        <li> <a href="department.jsp">Department</a> </li>
        <li> <a href="client.jsp">Client </a> </li>
        <li> <a href="user.jsp">User </a> </li>
        <li> <a href="branch.jsp">Branch </a> </li>
        <li> <a href="permissions.jsp">Permissions </a> </li>
        <li> <a href="category.jsp">Category </a> </li>
        <li> <a href="subcategory.jsp">Sub Category</a> </li>
        <li> <a href="product.jsp">Product</a> </li>
        <li> <a href="#">Stock</a> 
            <ul>
                <li><a href="stockentry.jsp">Stock Entry</a></li>
                <li><a href="stockallocation.jsp">Stock Allocation</a></li>
                <li><a href="stockreturn.jsp">Stock Return</a></li>
            </ul>
        </li>
        <li> <a href="billing.jsp">Billing </a> </li>
        <li> <a href="expenses.jsp">Expenses</a> </li>
        <li> <a href="#">Reports</a> 
            <ul>
                <li><a href="todaysales.jsp">Today Sales</a></li>
                <li><a href="todayexpenses">Today Expenses</a></li>
                <li><a href="todaystock.jsp">Today Stock</a></li>
                <li><a href="todayall.jsp">Today All</a></li>
            </ul>		  
        </li>
        <li> <a href="#">Server</a> 
            <ul>
                <li><a href="#">Stock Upload</a></li>
                <li><a href="#">Stock Download</a></li>
                <li><a href="#">Sales Upload</a></li>
            </ul>		  
        </li>
    </ul> -->
</nav>