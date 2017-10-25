<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html >
<head>
<meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   
   <script src="script.js"></script>


</head>
<h3 style="vertical-align:top">menu items</h3>
<div id='cssmenu'  align="left">
<ul>
<s:if test="isButtonShow('mainButton')">
   <li class='active'><a href='#' onclick= "getAjaxCall('medicines')"><span>Medicines</span></a></li>
   <li><a href='#'><span>Companies</span></a></li>
   <li><a href='#'><span>View Sale Record</span></a></li>
   <li class='last'><a href='#'><span>New Sale Record</span></a></li>
 </s:if> 
 <s:if test="isButtonShow('medicines')"> 
    <li class='active'><a href='#' onclick= "getAjaxCall('insertmedicines')"><span>Insert Medicines</span></a></li>
   <li><a href='#'><span>Update Medicines</span></a></li>
   <li class='last'><a href='#'><span>Delete Medicines</span></a></li>
  </s:if>
  <s:if test="isButtonShow('companies')">
    <li class='active'><a href='#' ><span>Insert Companies</span></a></li>
   <li><a href='#' ><span>Update Companies</span></a></li>
   <li class='last'><a href='#'><span>Delete Companies</span></a></li>
  </s:if>
   <li><a href="#" onclick= "getAjaxCall('reportGen')" ><span>Bill Generation</span></a></li>
    <li class='active'><a href='#' ><span>Create User</span></a></li>
    <li class='active'><a href='#' ><span>Change Password</span></a></li>
    <li class='active'><a href='#' ><span>Logout</span></a></li>
  <s:if test="isButtonShow('medicines') || isButtonShow('companies')">
    <li class='active'><a href='#' onclick= "getAjaxCall('medicines')" ><span>Back</span></a></li>
  </s:if>
</ul>
</div>

<script>
debugger;
/* $(function() {
    $( "#datepickerTo" ).datepicker({
       changeMonth:true,
       changeYear:true,
       dateFormat: 'dd/mm/yy',
       numberOfMonths:[1,1]
    });
 });
$(function() {
    $( "#datepickerFrom" ).datepicker({
       changeMonth:true,
       changeYear:true,
       dateFormat: 'dd/mm/yy',
       numberOfMonths:[1,1]
    });
 });
$(function() {
    $( "#datepicker-10" ).datepicker({
       changeMonth:true,
       changeYear:true,
       dateFormat: 'dd/mm/yy',
       numberOfMonths:[1,1]
    });
 });
$(function() {
    $( "#datepicker-11" ).datepicker({
       dateFormat: 'dd/mm/yy',
       beforeShow: function(i) { if ($(i).attr('readonly')) { return false; } }
    }).datepicker("setDate", new Date()); 
 });
function pdt_insertsubmit(element){debugger;
	var val = document.getElementById('datepicker-10').value;
	if(!isvalidateDate(val)){
		var errMsg = document.getElementById("errorMsg");
		errMsg.innerHTML = "Expiry date will be in proper formate";
		document.getElementById("errorBox").style.display="block";
	}
	else{
		document.getElementById('errorBox').style.display='none';
	    document.getElementById('insert_main_form').submit();
	}
} 
function isNumberKey(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function onlyNumberExist(evt) {debugger;
	if (evt.srcElement.value.match(/[a-z]/i)) {
		evt.srcElement.value = "";
	}
}
function isvalidateDate(val){debugger;
	
	 var currVal = val;
	    if(currVal == '')
	        return false;

	    var rxDatePattern = /^(\d{1,2})(\/|-)(\d{1,2})(\/|-)(\d{4})$/; //Declare Regex
	    var dtArray = currVal.match(rxDatePattern); // is format OK?

	    if (dtArray == null) 
	        return false;

	    //Checks for dd/mm/yyyy format.
	    dtDay = dtArray[1];
	    dtMonth= dtArray[3];
	    dtYear = dtArray[5];        

	    if (dtMonth < 1 || dtMonth > 12) 
	        return false;
	    else if (dtDay < 1 || dtDay> 31) 
	        return false;
	    else if ((dtMonth==4 || dtMonth==6 || dtMonth==9 || dtMonth==11) && dtDay ==31) 
	        return false;
	    else if (dtMonth == 2) 
	    {
	        var isleap = (dtYear % 4 == 0 && (dtYear % 100 != 0 || dtYear % 400 == 0));
	        if (dtDay> 29 || (dtDay ==29 && !isleap)) 
	                return false;
	    }
	    return true;
}
function getAjaxCall(urlaction){debugger;
	 if(urlaction == "medicines"){
		 urlaction = "genAction?methodAction=list&button=medicines"
	 }
	 if(urlaction == "companies"){
		 urlaction = "genAction?button=companies"
	 }
	 if(urlaction == "insertmedicines"){
		 urlaction = "genAction?button=medicines&methodAction=save"
	 }
	 if(urlaction == "updatemedicines"){
		 urlaction = "genAction?button=medicines&formAccess=update"
	 }
	 if(urlaction == "deletemedicines"){
		 urlaction = "genAction?button=medicines&formAccess=delete"
	 }
	 if(urlaction == "reportGen"){
		 urlaction = "genAction?button=medicines&report=true&methodAction=list"
	 }
	 if(urlaction == "billgen"){
		 urlaction = "genAction?button=mainButton"
	 }
	  window.location = "${pageContext.request.contextPath}/" + urlaction;

	}
	function getAjaxCal(urlaction){debugger;
		 var productname = urlaction.value;
		 if(urlaction == "update"){
			 productname = document.getElementById("medicineInfo.productName").value; 
		 }
		 var urlaction = "genAction?button=medicines&methodAction=list&formAccess=update&productName=" + productname;
		 window.location = "${pageContext.request.contextPath}/" + urlaction;
				 
	}
	
	function getAjaxSearch(urlaction){debugger;
	 var productname = urlaction.value;
	 if(urlaction == "cancel"){
		 productname = document.getElementById("medicineInfo.productName").value; 
	 }
	 var urlaction = "genAction?button=mainButton&methodAction=list&formAccess=readonly&productName=" + productname;
	 window.location = "${pageContext.request.contextPath}/" + urlaction;
			 
}
	function getAjaxCalDel(urlaction){debugger;
	 var productname = urlaction.value;
	 var urlaction = "genAction?button=medicines&formAccess=delete&productName=" + productname;
	 window.location = "${pageContext.request.contextPath}/" + urlaction;
			 
} */
</script>
</html>