<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer List</title>
</head>
<body>
<s:if test="isformShow('reportList') || isformShow('report')">
<div class="panel panel-success">
<div class="panel-heading">
 <form action="reportAction" id="repoId">
	 <div class="row">
		  <div align="left" class="col-sm-5">
		    
			    <label style="color:black" for="from">Report Between</label>
			    <input   maxlength="10" size="8" data-date-format="dd/mm/yyyy" id="datepickerFromm" name="fromDate" value="<s:property value="fromDate"/>"> <span class="glyphicon glyphicon-calendar"></span>
			    <label style="color:black" for="to">To</label>
			    <input    maxlength="10" size="8"  data-date-format="dd/mm/yyyy" id="datepickerToo" name="toDate" value="<s:property value="toDate"/>" /> <span class="glyphicon glyphicon-calendar"></span>
			    <s:hidden name= "formAccess" value="reportList"/>
			    <s:hidden name= "button" value="mainButton"/>
		        <p><label style="color:black">Select Type : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label><s:select name="customer.specialType" list="categoryList" headerKey=""  headerValue="ALL" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input class="btn btn-primary" type="button" onclick="pd_submit()" value="View"></p>
		       
		        
		    
		  </div>
		  <div class="col-sm-3"> <s:if test="customerDetails.size > 0">Total Cost : <s:textfield size="6"  readonly="true"  name="totalcost"  /></s:if></div>
		  
		  
		  
		  <div class="col-sm-3"><s:if test="customerDetails.size > 0">Number of Customer:  <s:textfield size="4"  readonly="true"  name="count"  /></s:if> </div>
		  
		  <div  class="col-sm-1">
				 <s:if test="customerDetails.size > 0">
				    <input type="button" value="Go For Print" class="btn btn-primary" onClick="callPrintAll()"/> 
				 </s:if>
		  </div>
	 </div> 
 </form>
 </div>
</div> 
</s:if>
<div>
<s:if test="isformShow('reportList')">
<s:iterator value="customerDetails" status="status" >
<table class="table">
<colgroup>
</colgroup>
<thead style="background-color: #FAEBD7">
<tr> 
    <th>Expend</th>
    <th>S. No.</th>
	<th>Customer Name</th>
	<th>Mobile Number</th>
	<th>Billing Date</th>
	<th>Cost</th>
</tr>
</thead>


	<tr> 
	    <s:url id="readonlyURL" action="reportAction">
								<s:param name="customer.customerId" value="%{customerId}" />
								<s:param name="formAccess" value="%{'customerDetails'}"></s:param>
								
		</s:url>
		<td align="left"><s:a href="#" onclick="expandAndCompress('ttextMain', '%{#status.index}')" id='xtextMain%{#status.index}'><img id='<s:property value='%{#status.index}'/>' src="images/buttons/plus.gif" border=0/></s:a></td>
		<td align="left"><s:property value="#status.count" /></td>
		<td align="left"><s:a href="%{readonlyURL}" cssClass="link"><s:property value="customerName"/></s:a></td>
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
	  <% int index=1; %>
     <s:iterator value="medicineDetails" >
      <tr  style="display: none;" id="ttextMain<s:property value="#status.count" />_<%= index %>" >
		<td align="left"><s:property value="productName"/></td>
		<td align="left"><s:property value="mfg"/></td>
		<td align="left"><s:property value="productCategory"/></td>
		<td align="left"><s:property value="expiryDate"/></td>	
		<td align="left"><s:property value="quantity"/></td>
		<td align="left"><s:property value="pricePerUnit"/></td>
		<td align="left"><s:property value="price"/></td>	
	</tr>	
	<% index++; %>
   </s:iterator>
		
</table>
</s:iterator>
<s:if test="customerDetails.size == 0">
     <h4 align="center">No record Found</h4>
</s:if>
</s:if>
<s:if test="isformShow('customerDetails')">
<div id="printReport">

 <div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-4">
        <p align="left">Customer Name:<code><s:property value="customer.customerName"/></code></p>
        <p align="left">Pres. by Dr.:<code><s:property value="customer.doctName"/></code></p>
      </div>
       <div  class="col-sm-4">
          <p align="left">Mobile Number:<code><s:property value="customer.mobileNumber"/></code></p>
          <p align="left">Address:<code><s:property value="customer.address"/></code></p>
      </div>
      <div class="col-sm-4">
		<p align="left">Generation Date:<code><s:date name="customer.billingDate" format="dd/MM/yyyy"/></code></p>
        <p align="left">Total Amount:<code><s:property value="customer.totalPrice"/></code></p>
      </div>
  </div> 
 </div>
</div> 
<br/>
<br/>
<table  class="table table-striped table-hover table-condensed" >
		
     <thead>
      <tr>
	      <th >PRODUCTT</th>
	      <th >MFG</th>
	      <th >BATCH</th>
	      <th >EXP</th>
	      <th >QTY.</th>
	      <th >P.P.Unit</th>
	      <th >Amount</th>
	   </tr>
	 </thead>
      <tbody>
       <s:iterator value="medicineDetails" status="sat" >
       <tr>
	        <td><input name = "medicineDetails[{#sat.index}]_productName"  value="<s:property value="productName"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_mfg"  value="<s:property value="mfg"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_productCategory"  value="<s:property value="productCategory"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_quantity"  value="<s:property value="quantity"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_productName"  value="<s:property value="productName"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_pricePerUnit"  value="<s:property value="pricePerUnit"/>" ></td>
			<td><input name = "medicineDetails[#index.count]_price"  value="<s:property value="price"/>" ></td>
		</tr>
		</s:iterator>
      </tbody>
	
</table>
</div>
<div>
 <input type="button" value="Go For Print" onClick="callPrint()"/> 
 </div>	
</s:if>

</div>
<script type="text/javascript">
function callPrint(){ 
	 var urlaction = "printReport?formAccess=print";
	
	 window.open("printReport.action?formAccess=print", "myWindowName", "width=800, height=600");
	 
}
function callPrintAll(){ 
	 window.open("printReport.action?formAccess=printall", "myWindowName", "scrollbars=1,width=800, height=600");
}
function pd_submit(){
var to = $("#datepickerToo").val();
var from = $("#datepickerFromm").val();
if (isvalidateDate(to) && isvalidateDate(from)) {
	if(isToDateGreater($("#datepickerToo") , $("#datepickerFromm"))){
		document.getElementById('repoId').submit();
	}
	else{
		 $("#myModal").modal('show');
		 document.getElementById("modalbody").innerHTML = "To date should be greater or equals to from date";
	}
	
	
}else{
	  $("#myModal").modal('show');
	  document.getElementById("modalbody").innerHTML = "Date should be in proper format.";
}

}
$(function() {
    $( "#datepickerToo" ).datepicker({
    	todayHighlight : true,
    	autoclose: true
    });
 });
$(function() {
    $( "#datepickerFromm" ).datepicker({
    	todayHighlight : true,
    	autoclose: true
    });
 });
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
	document.getElementsByName("count")[0].value = count;
</s:if>


/* function expandAndCompress(event, id){
	var nid = parseInt(id)+1;
	var jtrId = "#"+event+nid;
	var trId = event+nid;
	var imgObj = document.getElementById(id);
	var isShow = true;
	if(imgObj.src.indexOf("plus") > 0){
		imgObj.src = "images/buttons/minus.gif";
		isShow = true;
		
	} else {
		imgObj.src = "images/buttons/plus.gif";
		isShow = false
	}
	var condition = true;
	var index = 1;
	while (condition) {
		var jtr = jtrId +"_"+index;
		var tr = trId +"_"+index;
		if(document.getElementById(tr) != null){
			if(isShow){
				$(jtr).show();
			} else {
				$(jtr).hide();
			}
			
		} else {
			condition = false;
		}
		index = index + 1;  
	}
	
}
 */
</script>
</body>
</html>