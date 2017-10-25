<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>update and delete</title>
</head>
<body >
<div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-12">
        <p align="center">Please Update or Delete The Medicine</p>
      </div>
  </div> 
 </div>
</div> 
 <table class=" table sortable items" border="1">
 <s:if test="isformShow('readonly')">
 <s:form action="curdAction" id="delete_form" theme="simple">
<s:token />
    <colgroup>
	</colgroup>
<thead>
<tr>
	<th>Product Name</th>
	<th>MFG</th>
	<th>Batch Number</th>
	<th>Quantity</th>
	<th>Price Per Unit</th>
	<th>ExpiryDate</th>
</tr>
</thead>

	
    <tr>
       <s:url id="updateURL"  action="genAction">
								<s:param name="medicineInfo.productId" value="%{medicineInfo.productId}" />
								<s:param name="medicineInfo.productName" value="%{medicineInfo.productName}" />
								<s:param name="productName" value="%{medicineInfo.productName}" />
								<s:param name="medicineInfo.companyName" value="%{medicineInfo.companyName}" />
								<s:param name="medicineInfo.productCategory" value="%{medicineInfo.productCategory}" />
								<s:param name="medicineInfo.quantity" value="%{medicineInfo.quantity}" />
								<s:param name="medicineInfo.pricePerUnit" value="%{medicineInfo.pricePerUnit}" />
								<s:param name="medicineInfo.expiryDate" value="%{medicineInfo.expiryDate}" />
								<s:param name="button" value="%{'mainButton'}" />
								<s:param name="methodAction" value="%{'list'}" />
								<s:param name="formAccess" value="%{'update'}" />
		</s:url>
		<td align="left"><s:property value="medicineInfo.productName"/></td>
		<td align="left"><s:property value="medicineInfo.companyName"/></td>
		<td align="left"><s:property value="medicineInfo.productCategory"/></td>
		<td align="left"><s:property value="medicineInfo.quantity"/></td>
		<td align="left"><s:property value="medicineInfo.pricePerUnit"/></td>
		<td align="left"><s:property value="medicineInfo.expiryDate"  /></td>
		<s:hidden  name= "medicineInfo.productId" />
	    <s:hidden id="medicineInfo.productName" name= "medicineInfo.productName" />
	    <s:hidden name= "medicineInfo.companyName" />
	    <s:hidden name= "medicineInfo.productCategory" />
	    <s:hidden name= "medicineInfo.quantity" />
	    <s:hidden name= "medicineInfo.pricePerUnit" />
	    <s:hidden name= "medicineInfo.expiryDate" />
	    <s:hidden name= "button" value="medicines" />
    <s:hidden name= "formAccess" value="delete"/>
    <s:hidden name= "methodAction" value="delete"/>	
	
	</tr>
	</s:form>
</s:if>

<s:if test="isformShow('update')">
<s:form action="curdAction" id = "save_form" theme="simple">
<s:token />
	<colgroup>
	</colgroup>
<thead>
<tr>
	
	<th>Product Name</th>
	<th>MFG</th>
	<th>Batch Number</th>
	<th>Quantity</th>
	<th>Price Per Unit</th>
	<th>ExpiryDate</th>
</tr>
</thead>

    <s:url id="readonlyURL"  action="genAction">
								<s:param name="medicineInfo.productId" value="%{medicineInfo.productId}" />
								<s:param name="medicineInfo.productName" value="%{medicineInfo.productName}" />
								<s:param name="productName" value="%{medicineInfo.productName}" />
								<s:param name="medicineInfo.companyName" value="%{medicineInfo.companyName}" />
								<s:param name="medicineInfo.productCategory" value="%{medicineInfo.productCategory}" />
								<s:param name="medicineInfo.quantity" value="%{medicineInfo.quantity}" />
								<s:param name="medicineInfo.pricePerUnit" value="%{medicineInfo.pricePerUnit}" />
								<s:param name="medicineInfo.expiryDate" value="%{medicineInfo.expiryDate}" />
								<s:param name="button" value="%{'mainButton'}" />
								<s:param name="methodAction" value="%{'list'}" />
								<s:param name="formAccess" value="%{'readonly'}" />
		</s:url>
	<tr>
	<s:hidden name= "medicineInfo.productId" />
    <s:hidden name= "formAccess" value="readonly"/>
    <s:hidden name= "methodAction" value="updateSave"/>	
		<td align="left"><s:textfield id="uProductId" maxlength="25"   name="medicineInfo.productName"  /></td>
		<td align="left"><s:textfield id="uCompanyId"  maxlength="25" name="medicineInfo.companyName"  /></td>
		<td align="left"><s:textfield id="uCategoryId" maxlength="25" name="medicineInfo.productCategory"  /></td>
		 <td align="left"><s:textfield id="uQuantityId" maxlength="5" onblur="return onlyNumberExist(event)" onkeypress="return isNumberKey(event)"  name="medicineInfo.quantity"  /></td>
	     <td align="left"><s:textfield id="uPId" maxlength="5" onblur="return onlyNumberExist(event)" onkeypress="return isNumberKey(event)"  name="medicineInfo.pricePerUnit"  /></td>
	     <td align="left"><s:textfield  theme="simple" maxlength="10" id="datepicker-10" name="medicineInfo.expiryDate"  /></td>
	
	</tr>
   </s:form>
</s:if>		
</table>
 <div align="right">
 <s:if test="isformShow('readonly')">
    <s:a href="%{updateURL}" src='<s:url value="/images/buttons/logout.gif"/>'  cssClass="link"><button>Update</button></s:a>
    <a href="#" onclick="deleteBean()"><button>Delete</button></a>
</s:if>
<s:if test="isformShow('update')">
    <a href="#" onclick="saveUpdate()"><button>Save</button></a>
    <s:a href="%{readonlyURL}"  src='<s:url value="/images/buttons/button_cancel.gif"/>' cssClass="link"><button>Cancel</button></s:a>
</s:if>
</div>
<script>
function saveUpdate(){
var prod = $("#uProductId").val().trim();
var comp = $("#uCompanyId").val().trim();
var cat = $("#uCategoryId").val().trim();
var qnt = $("#uQuantityId").val().trim();
var ppu = $("#uPId").val().trim();
if(prod == "" || comp == "" || cat == "" || qnt == "" || ppu == ""){
	  $("#myModal").modal('show');
		document.getElementById("modalbody").innerHTML = "All fields should be filled."; 
}
else{
	 document.getElementById('save_form').submit(); 
}

}
function deleteBean(){
var r = confirm("Do You Want Delete It?");
if (r == true) {
	 document.getElementById('delete_form').submit();
} else {
    return true;
}
    
	
}

</script>
</body>

</html>