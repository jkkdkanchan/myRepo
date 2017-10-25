<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="panel panel-success">
 <div class="panel-heading">
  <p align="center">Please Enter Medicine Store Details</p>
 </div>
</div>



<div class="row">
      <div class="col-sm-2">
        
      </div>
       <div align="center"  class="col-sm-8">
			 <form class="form-horizontal" action="curdAction" id="store_form">
				<s:token />
				  <fieldset>
				    <div class="form-group">
				      <label class="col-lg-5 control-label">Name</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="25" value="<s:property value="stdetails.name"/>" id="nameId" name="stdetails.name" placeholder="Name" type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Address</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="30" id="addId" value="<s:property value="stdetails.address"/>" name="stdetails.address" placeholder="Address" type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-lg-5 control-label"></label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="30" id="add1Id" value="<s:property value="stdetails.address1"/>" name="stdetails.address1" placeholder="Address" type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-lg-5 control-label">Tin Number</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="15" id="tinId" value="<s:property value="stdetails.tinNumber"/>" name="stdetails.tinNumber"  placeholder="Tin Number" type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label class="col-lg-5 control-label">DL Number</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="15" id="dlId" value="<s:property value="stdetails.dlNumber"/>" name="stdetails.dlNumber"  placeholder="DL Number" type="text">
				      </div>
				    </div>
				    <div class="form-group"> 
				       <label  class="col-lg-5 control-label">Mobile Number</label>
				        <div class="col-lg-5">
				        <input name="stdetails.mobileNumber" maxlength="10" value="<s:property value="stdetails.mobileNumber"/>"  id="mobId" class="form-control" type="text">
				       </div>
				    </div>
				  </fieldset>
				  <div class="row" align="center">
				         <button type="button" class="btn btn-primary" onclick="editFields()">Edit</button>
				        <button type="button" class="btn btn-primary" onclick="pdt_insertsubmit()">Submit</button>
				  </div>
				  <s:hidden name= "methodAction" value="storeDetails"/>	
				  <s:hidden name= "formAccess" value="saveStore"/>
				  <s:hidden name= "stdetails.id" />
		  </form>

      </div>
      <div class="col-sm-2">
		
      </div>
 </div> 


<script>
var ele =  document.getElementById('store_form').getElementsByTagName("input");
function pdt_insertsubmit(element){
    var dup = $("#nameId").val().trim() == "<s:property value="stdetails.name"/>";
    dup = dup && ($("#addId").val().trim() == "<s:property value="stdetails.address"/>");
    dup = dup && ($("#add1Id").val().trim() == "<s:property value="stdetails.address1"/>");
    dup = dup && ($("#mobId").val().trim() == "<s:property value="stdetails.mobileNumber"/>");
    dup = dup && ($("#tinId").val().trim() == "<s:property value="stdetails.tinNumber"/>");
    dup = dup && ($("#dlId").val().trim() == "<s:property value="stdetails.dlNumber"/>");
	if($("#nameId").val().trim() == "" || $("#addId").val().trim() == "" || $("#add1Id").val().trim() == "" || $("#mobId").val().trim() == "" || $("#tinId").val().trim() == "" || $("#dlId").val().trim() == ""){
		
		  $("#myModal").modal('show');
			document.getElementById("modalbody").innerHTML = "All fields should be filled";
		return;
	}
	else{
		if(!$("#nameId")[0].readOnly && !dup){
			document.getElementById('store_form').submit();
		}
		else{
			for(var i = 0; i < ele.length; i++){
				   if(ele[i].name.indexOf("stdetails") == 0){
					   ele[i].readOnly = true;
				   }
			}
		}
	    
	} 
}

for(var i = 0; i < ele.length; i++){
	   if(ele[i].name.indexOf("stdetails") == 0){
		   ele[i].readOnly = true;
	   }
}
function editFields(element){
   for(var i = 0; i < ele.length; i++){
	   if(ele[i].name.indexOf("stdetails") == 0){
		   ele[i].readOnly = false;
	   }
   }
} 
</script>
</body>
</html>












