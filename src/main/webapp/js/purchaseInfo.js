



var serviceUnitArray ={};
var data = {};


function showPurchaseData(response){
	$("#userData ul li").remove();
	serviceUnitArray = {};
	if(response != undefined && response.length > 0){
		
	$.each(response,function(i, catObj) {
		
			serviceUnitArray[catObj.purchaseId] = catObj;
				 var tblRow ="<ul class=''>"
						 /* + "<li class='five-box'  title='"+catObj.mobileNo+"'>"
						+ catObj.mobileNo  */
						+ "<li class='nine-box'  title='"+catObj.name+"' style='width:300%'>"
						+ catObj.name
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.mobileNo+"' style='width:110%'>"
						+ catObj.mobileNo
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.eMail+"' style='width:220%'>"
						+ catObj.eMail
						+ "</li>"
						+ "<li class='five-box'  title='"+catObj.address+"' style='width:200%' >"
						+ catObj.address
						+ "</li>"
						
						+ "<li class='ten-box' style='width:75%'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.purchaseId
						+ "' onclick='editPurchageInfo(this.id)' id='editId class='ico del' href='#'>Edit</a>"
						+ '</li>'
						
						+ "<li class='ten-box' style='width:75%'>"
						+ "<a href='javascript:void(0)' id='"
						+ catObj.purchaseId
						+ "' onclick='deletePurchaseInfo(this.id)' id='delId' class='delRec' href='#'>Delete</a>"
						+ '</li>'
						+ "</li>"
						+"</ul>";
				$(tblRow).appendTo("#userData"); 
			});
	//paginationTable(3);
	}
}
function dataClear(){
	
 $('#name').val("");
 $('#mobileNo').val("");
 $('#address').val("");
 $('#eMail').val("");
 $('#tinNo').val("");
}

function editPurchageInfo(id)
{	$('#purchaseId').val( serviceUnitArray[id].purchaseId);
	$('#name').val( serviceUnitArray[id].name);
	$('#mobileNo').val( serviceUnitArray[id].mobileNo);
	$('#eMail').val( serviceUnitArray[id].eMail);
	$('#address').val( serviceUnitArray[id].address);
	$('#tinNo').val( serviceUnitArray[id].tinNo);
}
function deletePurchaseInfo(id) {
	var count = 0;
		$.ajax({
					type : "POST",
					url : "deletePurchaseInfo.json",
					data : "id=" + id,
					success: function (response) {
		                 if(response != null ){
		                	 $("#unc1").text("Delete Sucessfully");
		            		   $("#unc1").show();
		                       $("#unc1").fadeOut(15000);
		                       showPurchaseData(response);
		                	}
		                 },
		             error: function (e) { 
							console.log(e);
		             }
				});
}

function productRegister() {
	 data = {};
	data["mobileNo"] = $("#mobileNo").val();
	data["name"] = $("#name").val();
	data["address"] = $("#address").val();
	data["eMail"] = $("#eMail").val();
	data["purchaseId"] = $("#purchaseId").val();
	data["tinNo"] = $("#tinNo").val();
	
		 if($('#name').val().length == 0 ) {
			    $('#name').css('color','red');
			    $("#name").css("border-color","red");
			    $("#name").attr("placeholder","Please enter Name");
			    $('#name').addClass('your-class');
			    return false;
			    }
		 else if(!$('#mobileNo').val().match(/^1?(\d{3})(\d{3})(\d{4})$/) ) {
			    $('#mobileNo').css('color','red');
			    $("#mobileNo").css("border-color","red");
			    $("#mobileNo").attr("placeholder","Please Enter Mobile No");
			    $('#mobileNo').addClass('your-class');
			     $('#unc').text("Please specify a valid phone number.");
			     $('#unc').show();
			     $("#unc").fadeOut(15000);
			    setTimeout(function(){$('#mobileNo').focus();},0);
			    return false;
			 }
		 else if(!$('#eMail').val().match(/^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i) ) {
		    	
			    $('#eMail').css('color','red');
			    $("#eMail").css("border-color","red");
			    $("#eMail").attr("placeholder","Please enter email");
			    $('#eMail').addClass('your-class');
			    $('#unc').text("Please enter valid emailid.");
			     $('#unc').show();
			     $("#unc").fadeOut(15000);
			    setTimeout(function(){$('#eMail').focus();},0);
			    return false;
			    }
		    else if($('#address').val().length == 0 ) {
			    $('#address').css('color','red');
			    $("#address").css("border-color","red");
			    $("#address").attr("placeholder","Please enter address");
			    $('#address').addClass('your-class');
			    return false;
			    }
		    
		    else if($("#purchaseId").val() != ""){
					updatePurchaseInfo();
			}else{
				
				savePurchageInfo();
	    }	
	
}

function savePurchageInfo(){
	$.ajax({
             type: "POST",
             url: "savePurchaseInfo.htm",
             data: data,
             success: function (response) {
            	 resJSON = JSON.parse(response);
                 if(resJSON != null ){
                	 
                     if(resJSON.status == "ERROR"){
                   	  $("#unc").text('Email and mobileNo already exist.');
                   	  $("#productName").val("");
                   	  $("#unc").show();
                         $("#unc").fadeOut(25000);
                     }else if(resJSON.status == "ERRORS"){
                      	  $("#unc").text('Name already exists. Please choose other Name');
                       	  $("#productName").val("");
                       	  $("#unc").show();
                             $("#unc").fadeOut(25000);
                         }
                     else{
                    	 showPurchaseData(resJSON);
                   	 $("#unc").text('Save Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(25000);
                        $('#name').val("");
                        $('#mobileNo').val("");
                        $('#address').val("");
                        $('#eMail').val("");
                        $('#tinNo').val("");
                     }
                   	
                    }
                	
                 },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function updatePurchaseInfo(){
	$.ajax({
             type: "POST",
             url: "updatePurchaseInfo.htm",
             data: "jsondata= "+JSON.stringify(data),
             time:1000,
             success: function (response) {
            	 $("#purchaseId").val("");
            	 data = {};
            	 resJSON = JSON.parse(response);
            	 if(resJSON != 0){
            		 if(resJSON.status == "ERROR"){
                   	  	 $("#unc").text('Name already exists. Please choose other Name');
                   	 	 $("#unc").show();
                         $("#unc").fadeOut(25000);
                     }else{
                    	 showPurchaseData(resJSON);
                   	 $("#unc").text('Updated Sucessfully');
                  	  	 $("#unc").show();
                        $("#unc").fadeOut(5000);
                        $('#name').val("");
                        $('#mobileNo').val("");
                        $('#address').val("");
                        $('#eMail').val("");
                        $('#tinNo').val("");
                     }
            	 }
                 
             },
             error: function (e) { 
                 $("#btn-save").prop("disabled", false);
             }

	}); 
}
function removeError(ele){
	$("#"+ele).css('color', "#333333");
	$("#"+ele).css('border-color', "");
	$("#"+ele).removeClass('your-class');
}
