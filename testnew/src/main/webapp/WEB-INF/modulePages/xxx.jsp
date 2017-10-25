<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="panel panel-success">
 <div class="panel-heading">
  <p align="center">Please Enter The Details</p>
 </div>
</div>

 <div class="panel panel-success gap-top10">
      <div class="panel-heading">Payroll</div>
      <div class="panel-body ">
            <div class="form-horizontal">
                  
               
				
				
				
						<div class="row">
						 <div class="col-sm-12 col-md-6 col-lg-12">
		                      <div class="form-group">
		                        <label class="col-sm-6 col-md-6 col-lg-6 control-label control-label">Consolidated Period</label>
		                        <div class="col-sm-6 col-md-6 col-lg-6">
		                          <div class="input-group">
		                            <input type="number" class="form-control">
		                           
		                          </div>
		                        </div>
		                      </div>
		                    </div>
						</div>
				
				
				
	        </div>
       </div>
</div>

      
          <form class="form-horizontal" action="curdAction" id="insert_main_form">
          <s:token />
  
    <div class="form-group">
      <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">Product Name</label>
      <div class="col-sm-5 col-md-5 col-lg-5">
        <input  class="form-control" maxlength="25" id="productid" name="medicineInfo.productName" placeholder="Product Name" type="text">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">MFG.</label>
      <div class="col-sm-5 col-md-5 col-lg-5">
        <input class="form-control" maxlength="25" id="mfgid" name="medicineInfo.companyName" placeholder="MFG." type="text">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">Batch Number</label>
      <div class="col-sm-5 col-md-5 col-lg-5">
        <input class="form-control" maxlength="25" id="batchid" name="medicineInfo.productCategory" placeholder="Batch Number" type="text">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">Quantity</label>
      <div class="col-sm-5 col-md-5 col-lg-5">
        <input class="form-control" maxlength="5" id="quantityid" name="medicineInfo.quantity" onblur="return onlyNumberExist(event)" onkeypress="return isNumberKey(event)" placeholder="Quantity" type="text">
      </div>
    </div>
    <div class="form-group">
      <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">Price Per Unit</label>
      <div class="col-sm-5 col-md-5 col-lg-5">
        <input class="form-control" maxlength="5" id="ppid" name="medicineInfo.pricePerUnit" onblur="return onlyNumberExist(event)" onkeypress="return isNumberKey(event)" placeholder="Price Per Unit" type="text">
      </div>
    </div>
    <div class="form-group"> 
       <label for="inputEmail" class="col-sm-5 col-md-5 col-lg-5 control-label">Expiry Date</label>
        <div class="col-sm-5 col-md-5 col-lg-5">
        <input name="medicineInfo.expiryDate"  style="width:100px;" id="expiryId" class="form-control" type="text">
       </div>
    </div>
  
  <div class="row" align="center">
      <button type="button" class="btn btn-primary" onclick="pdt_insertsubmit()">Submit</button>
  </div>
  <s:hidden name= "formAccess" value="insert"/>
  <s:hidden name= "methodAction" value="save"/>	
</form>
      
     
  


<script>
	$(function() {
	    $( "#expiryId" ).datepicker({ 
	    	 format: "mm/yyyy",
	    	    viewMode: "months", 
	    	    minViewMode: "months"
	    });
	 });
function pdt_insertsubmit(element){debugger;
	var val = document.getElementById('expiryId').value.trim();
	
	if($("#productid").val().trim() == "" || $("#mfgid").val().trim() == "" || $("#batchid").val().trim() == "" || $("#quantityid").val().trim() == "" || $("#ppid").val().trim() == "" || val == ""){
		$("#myModal").modal('show');
		document.getElementById("modalbody").innerHTML = "All fields should be filled.";
		return;
	}
	else{
	    document.getElementById('insert_main_form').submit();
	}
} 
</script>
</body>
</html>












