<!DOCTYPE >
<head>
<style>
.your-class::-webkit-input-placeholder {
	color: red;
}

.default-class::-webkit-input-placeholder {
	color: red;
}
</style>

</head><body>
<script type="text/javascript" src="js/uploadPage.js"></script>
<script type="text/javascript">



</script>


		<section class="container">
			<div class="block">
				<h2><span class="icon1">&nbsp;</span>Upload Page Info<aside class="block-footer-right sucessfully" id="unc2" style="display:none;" >Delete Sucessfully</aside></h2>
				<form name="cf_form" method="post" onsubmit="return false;" id="contact-form" style=" background-color: #ffffff;">
					
					
						<div class="block-searchbill">
					     <div class="block-searchbill-input last">
							<label>Select File</label>
							<input type="file" name="selectFile" id="import_csv" onchange="" >
						</div>
						<div class="block-searchbill-input last">
							<label>Table</label>
							<select id="selectId" name="table"    tabindex="2"  />
                        <option value="product">Product Table</option>
                        <option value="Purchase">Purchase Table</option>
                    </select>
						</div>
						
						</div>
						
					<div class="block-footer">
						<aside class="block-footer-left sucessfully" id="unc" style="display: none">Save Sucessfully</aside>
						<aside class="block-footer-right">
							<input class="btn-cancel" name="" value="Clear" type="button" onclick="clientDataClear();">
							<input class="btn-save" name="" value="Save" id="saveId" type="button" onclick=" CSV();">
						</aside>
					</div>
				</form>
			</div>
			
		</section>
</body>