<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="styles.css">
<title>Customer List</title>
</head>
<body>

<div class="row">
      <div class="col-sm-12">
        <p align="right"> <input type="button" id="printid" value="print" onClick="Print()"/></p> 
      </div>
</div>
<div class="panel panel-default">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-4">
        <p align="left"><s:property value="sds.address"/></p>
        <p align="left"><s:property value="sds.name"/></p>
      </div>
       <div  class="col-sm-4">
         <p>CHEMIST AND DRUGS</p>
         <p><s:property value="sds.address1"/></p>
      </div>
      <div class="col-sm-4">
		<p align="right">Phone: <s:property value="sds.mobileNumber"/></p>
        <p align="right">DL.NO: <s:property value="sds.dlNumber"/></p>
        <p align="right">Tin.NO: <s:property value="sds.tinNumber"/></p>
      </div>
  </div> 
  </div>
</div> 

<s:if test="isformShow('printall')">

<div class="panel panel-success">
<div class="panel-heading">
 <div class="row">
  <div align="left" class="col-sm-2">
  </div>
  <div class="col-sm-2"> <s:if test="customerDetails.size > 0">Total Cost</s:if></div>
  <div align="left" class="col-sm-2"><s:if test="customerDetails.size > 0"><s:textfield size="7"  readonly="true"  name="totalcost"  /></s:if></div>
  <div class="col-sm-3"><s:if test="customerDetails.size > 0">Number of Customer:</s:if> </div>
  <div align="left" class="col-sm-3"><s:if test="customerDetails.size > 0"><s:textfield size="7"  readonly="true"  name="count"  /></s:if></div>
 </div> 
 </div>
 </div>
<s:iterator value="customerDetails" status="stat" >
<table class="table">
<colgroup>
</colgroup>
<thead style="background-color: #FAEBD7">
<tr> 
    <th>S. No.</th>
	<th>Customer Name</th>
	<th>Mobile Number</th>
	<th>Billing Date</th>
	<th>Cost</th>
</tr>
</thead>


	<tr> 
		<td align="left"><s:property value="#stat.count" /></td>
		<td align="left"><s:property value="customerName"/></td>
		<td align="left"><s:property value="mobileNumber"/></td>
		<td align="left"><s:date name="billingDate" format="dd/MM/yyyy"/></td>
		<td align="left"><s:property value="totalPrice"/></td>	
	</tr>	
        <colgroup>
        </colgroup>
        <thead style="background-color: #F0FFFF">
      <tr>
	      <th >PRODUCT</th>
	      <th >MFG</th>
	      <th >BATCH</th>
	      <th >EXP</th>
	      <th >QTY.</th>
	      <th >P.P.Unit</th>
	      <th >Amount</th>
	   </tr>
	  </thead>
     <s:iterator value="medicineDetails" >
     <tr> 
		<td align="left"><s:property value="productName"/></td>
		<td align="left"><s:property value="mfg"/></td>
		<td align="left"><s:property value="productCategory"/></td>
		<td align="left"><s:property value="expiryDate"/></td>	
		<td align="left"><s:property value="quantity"/></td>
		<td align="left"><s:property value="pricePerUnit"/></td>
		<td align="left"><s:property value="price"/></td>	
	</tr>	
</s:iterator>
		
</table>
</s:iterator>

</s:if>
<s:else>
 <div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-4">
        <p align="left">Customer Name: <s:property value="customer.customerName"/></p>
        <p align="left">Pres. by Dr.:  <s:property value="customer.doctName"/></p>
      </div>
       <div  class="col-sm-4">
          <p align="left">Mobile Number: <s:property value="customer.mobileNumber"/></p>
          <p align="left">Address:       <s:property value="customer.address"/></p>
      </div>
      <div class="col-sm-4">
		<p align="left">Generation Date:  <s:date name="customer.billingDate" format="dd/MM/yyyy"/></p>
        <p align="left">Total Amount:      <s:property value="customer.totalPrice"/></p>
      </div>
  </div> 
 </div>
 
<br/>
<br/>
<table class="table table-striped table-hover table-condensed" >
		<colgroup>
       </colgroup>
        <thead>
      <tr>
	      <th >PRODUCT</th>
	      <th >MFG</th>
	      <th >BATCH</th>
	      <th >EXP</th>
	      <th >QTY.</th>
	      <th >P.P.Unit</th>
	      <th >Amount</th>
	   </tr>
	  </thead>
  
	<s:iterator value="medicineDetails" >
	    <tr> 
		<td align="left"><s:property value="productName"/></td>
		<td align="left"><s:property value="mfg"/></td>
		<td align="left"><s:property value="productCategory"/></td>
		<td align="left"><s:property value="expiryDate"/></td>	
		<td align="left"><s:property value="quantity"/></td>
		<td align="left"><s:property value="pricePerUnit"/></td>
		<td align="left"><s:property value="price"/></td>	
	</tr>	
</s:iterator>
</table>
</div>
</s:else>
<div class="row" style="bottom: 0;">
<p>PLEASE VERIFY THE MEDICENE FRO DOCTOR BEFORE USE</p>
<hr>
  <div class="col-sm-4">
   <p>No: </p>
   <p>Price Difference Under Drug </p>
   <p>Control Act 1970 will be</p>
   <p>Refunded if any.(E&OE)</p>
  </div>
  <div class="col-sm-4">
  <p>Total</p>
  <p>Amount</p>
  </div>
  <div class="col-sm-4">
  <p>
    <s:if test="customerDetails.size > 0" >
       <s:textfield size="7"  readonly="true"  name="totalallcost"  /> 
    </s:if>
    <s:else>
      <s:property value="customer.totalPrice"/>
    </s:else>
  </p>
  <p><s:property value="sds.name"/></p>
  <p>Sign.Q.P. </p>
  </div>
  
</div>

<script type="text/javascript">
function Print(){
	var printButton = document.getElementById("printid");
	printButton.style.visibility = 'hidden';
	window.print();
	printButton.style.visibility = 'visible';
}
<s:if test="customerDetails.size > 0" >
	var priceTotal = 0;
	var count = 0;
	<s:iterator value="customerDetails" var="medicineInfo"> 
	    var price = '<s:property value="totalPrice"/>';
	    price = price == "" ? 0 : parseInt(price);
	    priceTotal = priceTotal + price;
	    count = count + 1;
	</s:iterator>
	document.getElementsByName("totalcost")[0].value = priceTotal;
	document.getElementsByName("totalallcost")[0].value = priceTotal;
	document.getElementsByName("count")[0].value = count;
</s:if>
</script>
</body>
</html>