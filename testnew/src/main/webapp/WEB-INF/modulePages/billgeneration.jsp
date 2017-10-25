<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
</head>
 
<body>
<s:if test="isformShow('reportGen')">
<s:form action="reportActionE" id="insert_form_id" name="insert_form" theme="simple">
<s:token />
<div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-4">
        <p align="left">Customer Name: <input id="customerId" maxlength="25" onmousedown="setCustomerDetails()" onblur="setDetails(this)"  style="margin-right: 1px" name="customer.customerName"  /></p>
        <p align="left">Pres. by Dr.: &nbsp;<input maxlength="25" id="doctId" style="margin-left: 25px" name="customer.doctName"  /></p>
        <p align="left">Special Type:<s:checkbox id="stypeId" type="checkbox" style="margin-left: 25px" name="customer.specialType"  /></p>
      </div>
       <div  class="col-sm-4">
          <p align="left">Mobile Number:<input id="mobId" onkeypress="return isNumberKey(event)" maxlength="10"  name="customer.mobileNumber"  /></p>
          <p align="left">Address: &nbsp;<input maxlength="25" id="addId" style="margin-left: 42px" name="customer.address"  /></p>
      </div>
      <div class="col-sm-4">
		<p align="left">Generation Date : <input size="8" data-date-format="dd/mm/yyyy"  STYLE="background-color: #FAEBD7;" readonly="readonly" name="billDate" type="text" id="datepicker-11" /><a><img src="<s:url value='/images/calendar.gif'/>" /></a></p>
        <p align="left">Total Amount     : <input onkeypress="return isNumberKey(event)" style="margin-left: 23px" type="text" size="8" name="customer.totalPrice" /></p>
      </div>
     
  </div> 
 </div>
</div> 
 <table id ="appendId" class="table table-striped table-hover table-condensed table-bordered" >
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
  <tr>
   <td align="left"><input size="12" id="medProduct_0" onblur="setExpiryDate(this)" onmousedown="populateList(this)" type="text" name= "medicineDetails[0]_productName" /></td>
   <td align="left"><input size="8" type="text" name="medicineDetails[0]_mfg" /></td>
   <td align="left"><input size="8" type="text" name="medicineDetails[0]_productCategory" /></td>
   <td align="left"> <input size="8"  id="dateset"  type="text" name = "medicineDetails[0]_expiryDate" />
   <td align="left"><input size="4" onkeypress="return isNumberKey(event)" id="quantity_0" onkeyup="setprice(this)" type="text" name = "medicineDetails[0]_quantity" /></td>
   <td align="left"><input size="4" onkeypress="return isNumberKey(event)" id="pricePerUnit_0" onkeyup="setprice(this)" type="text" name = "medicineDetails[0]_pricePerUnit" /></td>
   <td align="left"><input size="8" type="text" onkeypress="return isNumberKey(event)" name = "medicineDetails[0]_price" /><a href="javascript:void(0);" onclick="addRow();">&nbsp;<img src="images/buttons/plus.gif" width="24px"></a>  </td>
   </tr>
 </table>
  <div class="form-group">
      <div class="col-sm-12">
        <p align="right"><button type="button" class="btn btn-primary" onclick="call_billSubmit()">Save</button></p>
      </div>
    </div>
 <s:hidden name= "formAccess" value="reportPrint"/>
 <s:hidden name= "customer.billingDate" value="02/02/2011" />
 
 </s:form>
 
  </s:if>
  <s:if test="isformShow('reportPrint')">
  <div id="printId" >
  <div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
     <div class="col-sm-4">
        <p align="left">Customer Name:<code> <s:property value="customer.customerName"/></code></p>
        <p align="left">Pres. by Dr.: <code> <s:property value="customer.doctName"/></code></p>
        <p align="left">Special Type.: <code> <s:property value="customer.specialType"/></code></p>
         
      </div>
       <div  class="col-sm-4">
          <p align="left">Mobile Number: <code><s:property value="customer.mobileNumber"/></code></p>
          <p align="left">Address:<code><s:property value="customer.address"/></code></p>
      </div>
      <div class="col-sm-4">
		<p align="left">Generation Date:<code><s:date name="customer.billingDate" format="dd/MM/yyyy"/></code></p>
        <p align="left">Total Amount:<code> <s:property value="customer.totalPrice"/></code></p>
      </div>
  </div> 
 </div>
</div> 
<br/>
<br/>
<table class="table table-striped table-hover table-condensed table-bordered" >
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
  <input type="button" value="Go For Print" onClick="CallPrint()"/> 	  
  </s:if> 
   <script>
   $(function() {
	    $( "#datepicker-11" ).datepicker({
	       todayHighlight : true,
	       beforeShow: function(i) { if ($(i).attr('readonly')) { return false; } }
	    }).datepicker("setDate", new Date()); 
	 });
   var productname = " ";
   var arry = new Array();
   var dateArray = new Array();
   var cArray = new Array(); 
   var calArray = new Array();
   var oneTime = true;
   <s:iterator value="medicineInfoList" var="medicineInfo"> 
        var namew = '<s:property value="productName"/>' + '_' + '<s:property value="productId"/>';
        var namedate = '<s:property value="productName"/>' + '_' + '<s:property value="productId"/>' + '_' + '<s:property value="productCategory"/>'  + '_' + '<s:property value="pricePerUnit"/>' + '_' + '<s:property value="expiryDate"/>'+ '_' + '<s:property value="companyName"/>';
        arry.push(namew);
        dateArray.push(namedate);
   </s:iterator>   
   function populateList(event){
	  
	   var id = '#' + event.id;
       var accentMap = {
	         "á": "a",
	         "ö": "o"
	       };
	       var normalize = function( term ) {
	         var ret = "";
	         for ( var i = 0; i < term.length; i++ ) {
	           ret += accentMap[ term.charAt(i) ] || term.charAt(i);
	         }
	         return ret;
	       };
	    
	       $( id ).autocomplete({
	         source: function( request, response ) {
	           var matcher = new RegExp( $.ui.autocomplete.escapeRegex( request.term ), "i" );
	           response( $.grep( arry, function( value ) {
	             value = value.label || value.value || value;
	             return matcher.test( value ) || matcher.test( normalize( value ) );
	           }) );
	         }
	       });
	   
   }
   function setExpiryDate(event){
	   var bool = true;
	   var id = event.id;
	   var arrId = event.id.split("_");
	   var index = arrId[1];
	   var pcategory = "medicineDetails[" + index +"]_productCategory";
	   var perunit = "medicineDetails[" + index +"]_pricePerUnit";
	   var expName = "medicineDetails[" + index +"]_expiryDate";
	   var mfgName = "medicineDetails[" + index +"]_mfg";
	   var value = productname;
	   var pvalue = value.split("_");
	   for(var i = 0; i < dateArray.length; i++){
		  var dateStr = dateArray[i].split('_');
		  if(event.value == pvalue[0] && dateArray[i].indexOf(value) == 0){
			  document.getElementsByName(pcategory)[0].value =  dateStr[2];
			  document.getElementsByName(perunit)[0].value =  dateStr[3];
			  document.getElementsByName(expName)[0].value =  dateStr[4];
			  document.getElementsByName(mfgName)[0].value =  dateStr[5];
			  bool = false;
			  break;
		  }
	   } 
	   if(bool){
		   document.getElementById(id).value = "";
		   document.getElementsByName(pcategory)[0].value = "";
		   document.getElementsByName(perunit)[0].value = "";
		   document.getElementsByName(expName)[0].value = "";
		   document.getElementsByName(mfgName)[0].value =  "";
	   }
   }
   function setprice(event){debugger;
	   var id = event.id;
	   var arrId = event.id.split("_");
	   var index = arrId[1];
	   var quntity = "medicineDetails[" + index +"]_quantity";
	   var punit = "medicineDetails[" + index +"]_pricePerUnit";
	   var price = "medicineDetails[" + index +"]_price";
	   var qvalue = document.getElementsByName(quntity)[0].value;
	        qvalue = qvalue == "" ? 0 : parseInt(qvalue);
	   var pvalue = document.getElementsByName(punit)[0].value;
	       pvalue = pvalue == "" ? 0 : parseInt(pvalue);
	   document.getElementsByName(price)[0].value = qvalue*pvalue;
	   setTotalPrice();
   }
   function setTotalPrice(){
	   var elements = $('#appendId tbody').children();
	   var totalValue = 0;
       for(var i = 0 ; i < elements.length; i++){
        	 var str = elements[i].outerHTML;
        	 var indexBeg = str.indexOf("medicineDetails[");
        	 var indexEnd = str.indexOf("]_productName");
        	 var index = str.substring(indexBeg+16, indexEnd);
        	 var priceName = "medicineDetails[" + index +"]_price";
        	 var pricevalue = document.getElementsByName(priceName)[0].value;
        	     pricevalue = pricevalue == "" ? 0 : parseInt(pricevalue);
        	     totalValue = totalValue + pricevalue;
         } 
       document.getElementsByName("customer.totalPrice")[0].value = totalValue;
   }
   function setCustomerDetails(){
        if(oneTime){
        	 <s:iterator value="customerInfoList" > 
			   var cname = '<s:property value="customerName"/>';
			   var cdetails = '<s:property value="customerName"/>' + '_' + '<s:property value="doctName"/>' + '_' + '<s:property value="address"/>'  + '_' + '<s:property value="mobileNumber"/>' ;
			   cArray.push(cname);
			   calArray.push(cdetails);
	         </s:iterator>
	         oneTime = false;
        }
        var accentMap = {
		         "á": "a",
		         "ö": "o"
		       };
		       var normalize = function( term ) {
		         var ret = "";
		         for ( var i = 0; i < term.length; i++ ) {
		           ret += accentMap[ term.charAt(i) ] || term.charAt(i);
		         }
		         return ret;
		       };
	   $( "#customerId" ).autocomplete({
	       source: function( request, response ) {
	         var matcher = new RegExp( $.ui.autocomplete.escapeRegex( request.term ), "i" );
	         response( $.grep( cArray, function( value ) {
	           value = value.label || value.value || value;
	           return matcher.test( value ) || matcher.test( normalize( value ) );
	         }) );
	       }
	     });
	      
} 
   function setDetails(event){
	   var value = event.value;
	   for(var i = 0; i < calArray.length; i++){
			  var calArrayStr = calArray[i].split('_');
			  if(value == calArrayStr[0]){
				  document.getElementsByName("customer.doctName")[0].value =  calArrayStr[1];
				  document.getElementsByName("customer.address")[0].value =  calArrayStr[2];
				  document.getElementsByName("customer.mobileNumber")[0].value =  calArrayStr[3];
				  break;
			  }
	   } 
	   
   }
   function call_billSubmit(){
       var type = $("#stypeId").val();
	   if($("#customerId").val().trim() == "" || $("#doctId").val().trim() == "" || $("#mobId").val().trim() == "" || $("#addId").val().trim() == ""){
		   $("#myModal").modal('show');
			document.getElementById("modalbody").innerHTML = "Customer Related information should be filled.";
		}
	   else{
		   pdt_billsubmit();
	   }
	 
   }
   function CallPrint(){ 
	   window.open("printReport.action?formAccess=print", "myWindowName", "width=800, height=600");
	   }
   <s:if test="isformShow('reportPrint')">
		   window.location.hash="no-back-button";
		   window.location.hash="Again-No-back-button";//again because google chrome don't insert first hash into history
		   window.onhashchange=function(){window.location.hash="no-back-button";}
   </s:if>
   </script>
</body>
</html>