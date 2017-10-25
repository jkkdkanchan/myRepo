<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Expiry List</title>
</head>
<body>

<div class="panel panel-success">
<div class="panel-heading">
 <div class="row">
  <div align="left" class="col-sm-7">
    <form action="genAction" id="expiryId">
   <label style="color:black" for="from">Expiry date From</label>
   <input   maxlength="10" id="datepickerFrom" style="width:120px;"   name="fromDate" value="<s:property value="fromDate"/>"  /><span class="glyphicon glyphicon-calendar"></span>
   <label style="color:black" for="to">To</label>
   <input    maxlength="10" id="datepickerTo" style="width:120px;"  name="toDate" value="<s:property value="toDate"/>" /><span class="glyphicon glyphicon-calendar"></span>
   <s:hidden name= "methodAction" value="expList"/>
  

<input type="button" onclick="pdt_submit()" value="View">
</form>
  </div>
  <div class="col-sm-2"> <s:if test="medicineExpList.size > 0">Number of Medicines:</s:if> </div>
  <div align="left" class="col-sm-1"><s:if test="medicineExpList.size > 0"><s:textfield size="5"  readonly="true"  name="count"  /></s:if></div>
  <div class="col-sm-2"></div>
  <div align="left" class="col-sm-2"></div>
 </div> 
 </div>
</div> 

<s:if test="formAccess == 'expRepo'"><h4 align="center">List of Expired Medicine(s).</h4></s:if>

<s:if test="medicineExpList.size > 0">

<display:table class="table" uid="studentTable" name="medicineExpList"  requestURI="">
	<display:column title="S. No."  value="<%= studentTable_rowNum %>" ></display:column>
	<display:column   property="productName" title="Product Name" href="genAction?methodAction=list&formAccess=readonly" paramId="medicineInfo.productId" paramProperty="productId" />
	<display:column property="companyName" title="Mfg" />
	<display:column  property="productCategory" title="Batch No." />
	<display:column  property="quantity" title="Qunatiry" />
	<display:column  property="pricePerUnit" title="P.P.Unit"/>
	<display:column  property="expiryDate" title="Exp Date" />
</display:table>
</s:if>
<s:if test="methodAction == 'expList'">
	<s:if test="medicineExpList.size == 0">
	     <h4 align="center">No record Found</h4>
	</s:if>
</s:if>
<s:if test="formAccess == 'expRepo'">
	<s:if test="medicineExpList.size == 0">
	     <h4 align="center">No expired medicine found</h4>
	</s:if>
</s:if>

<script type="text/javascript">
$(function() {
    $( "#datepickerTo" ).datepicker({
    	format: "mm/yyyy",
	    viewMode: "months", 
	    minViewMode: "months"
    });
 });
$(function() {
    $( "#datepickerFrom" ).datepicker({
    	format: "mm/yyyy",
	    viewMode: "months", 
	    minViewMode: "months",
	    startView: 1
    });
 });
var count = 0;
<s:if test="medicineExpList.size() > 0">
	<s:iterator value="medicineExpList"> 
	    count = count + 1;
	</s:iterator>
	document.getElementsByName("count")[0].value = count;
 </s:if>
</script>
</body>
</html>