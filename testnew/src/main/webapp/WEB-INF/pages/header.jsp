<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>





<script>
var arry = new Array();
var bool = true;
<s:if test="isInvalidate()">
  window.location = "${pageContext.request.contextPath}/" + "index.jsp";
</s:if>
function populateSearchList(){
	if(bool){
		<s:iterator value="medicineInfoList" var="medicineInfo"> 
	        var namew = '<s:property value="productName"/>' + '_' + '<s:property value="productId"/>';
	        arry.push(namew);
	    </s:iterator>
	    bool = false; 
	}
}
$(function() {
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
 
    $( "#developer" ).autocomplete({
      source: function( request, response ) {
        var matcher = new RegExp( $.ui.autocomplete.escapeRegex( request.term ), "i" );
        response( $.grep( arry, function( value ) {
          value = value.label || value.value || value;
          return matcher.test( value ) || matcher.test( normalize( value ) );
        }) );
      }
    });
  });
var index = 0;
function addRow(){
	index = index + 1;
	var f1 = '<tr id = ' + index + '><td align="left"><input type="text" size="12" onblur="setExpiryDate(this)" onmousedown="populateList(this)" id = medProduct_'+ index + ' name= ' + 'medicineDetails[' + index + ']_productName  /></td>';
	var f2 = '<td align="left"><input type="text" size="8" name= ' + 'medicineDetails[' + index + ']_mfg  /></td>';
	var f3 = '<td align="left"><input type="text" size="8" name= ' + 'medicineDetails[' + index + ']_productCategory  /></td>';
	var f4 = '<td align="left"> <input type="text" size="8"  name = ' + 'medicineDetails[' + index + ']_expiryDate  />';
	var f5 = '<td align="left"><input type="text" onkeypress="return isNumberKey(event)" size="4" onkeyup="setprice(this)" id = quantity_'+ index + ' name = ' + 'medicineDetails[' + index + ']_quantity  /></td>';
	var f6 = '<td align="left"> <input type="text" onkeypress="return isNumberKey(event)" size="4" onkeyup="setprice(this)" id = pricePerUnit_'+ index + ' name = ' + 'medicineDetails[' + index + ']_pricePerUnit  />';
	var f7 = '<td align="left"> <input type="text" onkeypress="return isNumberKey(event)" size="8" name = ' + 'medicineDetails[' + index + ']_price  />';
	var f8 = '<a href="#" onclick="addRow()">&nbsp;<img src="images/buttons/plus.gif" width="24px"></a><a href="#" name = ';
	var f9 = ' onclick="removeRow(this)">&nbsp;<img src="images/buttons/minus.gif" width="24px"></a></td></tr>';
	var eleS =  $('#phone');
    //$('#phone').lastChild.append( '<br/>'+ f1 + f2 + f3 + f4 + f5 + index +  f6); 
    $('#appendId tbody').append(f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8 + index + f9); 
} 
function removeRow(obj){debugger;
        var elements = $('#appendId tbody').children();
       for(var i = 0 ; i <= elements.length; i++){
        	 if(elements[i].id == obj.name){
        		elements[i].outerHTML = "";
        		 break; 
        	 }
         } 
       setTotalPrice();
}
function pdt_billsubmit() {
/* resetColor(); */
var boolean = false; 
var elements =  document.getElementsByTagName("input");
for ( var i = 0; i < elements.length ; i++ ){

	if(elements[i].name.indexOf("medicineDetails[") == 0){
		
		var eleValue = elements[i].value.trim();
		if(eleValue == ""){
			boolean = true;
			elements[i].style.backgroundColor = "#FFCCCC";
		}
		else{
			elements[i].style.backgroundColor = "#FFFFFF";
		}
	}

} 
if(boolean){
	
	 $("#myModal").modal('show');
	 document.getElementById("modalbody").innerHTML = "Highlighted fields should be filled.";
}
else{
    document.getElementById('insert_form_id').submit();
}

}


	
</script>	

 


 <nav class="navbar navbar-inverse">
				  <div class="container-fluid">
				    <ul class="nav navbar-nav">
				    <li><a href='#' onclick= "getAjaxCall('medicines')"><span class="glyphicon glyphicon-home"></span> Home</a></li>
				    <li><a href='genAction.action?methodAction=storeDetails' ><span class="glyphicon glyphicon-user"></span> Contact</a></li>
					<li><a href="reportAction.action?formAccess=expRepo"><span class="glyphicon  glyphicon-th-list"></span> Exp List </a></li>
					<li><a href='#' onclick= "getAjaxCall('insertmedicines')"><span class="glyphicon glyphicon-plus"></span> Add Medicine</a></li>	
					<li><a href="#" onclick= "getAjaxCall('reportGen')"><span class="glyphicon glyphicon-pencil"></span> Bill Generation</a></li>	
					<li><a href="reportAction.action?formAccess=report"><span class="glyphicon glyphicon-list-alt"></span> Report</a></li>
				    </ul>
				    <ul class="nav navbar-nav">
				      <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"> new <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="partycallAction.action">bill entry</a></li>
				            <li><a href="partycallAction.action?action=scheduleH1">Schedule H1 Management</a></li>
				            <li><a href="partycallAction.action?action=medRecord">Medicine Record Management</a></li>
				            <li><a href="partycallAction.action?action=partyRecord">Party Record Management</a></li>
				          </ul>
                      </li>
				    </ul>
				    <form class="navbar-form navbar-left" role="search">
				        <div class="form-group">
				          <input id="developer" name="medicineInf" onmousedown="populateSearchList(this)" type="text" class="form-control" placeholder="Search">
				        </div>
                      </form>
				    <ul class="nav navbar-nav navbar-right">
				      <li class="dropdown">
				          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><span class="glyphicon glyphicon-cog"></span> Settings <span class="caret"></span></a>
				          <ul class="dropdown-menu" role="menu">
				            <li><a href="genAction.action?methodAction=changepassword"><span class="glyphicon glyphicon-wrench"></span> Change Password</a></li>
				            <li><a href="#" onclick= "pdt_logout()"><span class="glyphicon glyphicon-log-out"></span> Logout</a></li>
				          </ul>
                      </li>
				    </ul>
				  </div>
  </nav>   
<script type="text/javascript">



function pdt_submit(){
	if ($("#datepickerTo").val().trim() != "" && $("#datepickerFrom").val().trim() != "") {
		
		
		if(isToDateGreater($("#datepickerTo") , $("#datepickerFrom"))){
			document.getElementById('expiryId').submit();
		}
		else{
			 $("#myModal").modal('show');
			 document.getElementById("modalbody").innerHTML = "From date should be less than To date";
		}
		
			
	
	}else{
		 $("#myModal").modal('show');
		  document.getElementById("modalbody").innerHTML = "Date should be in proper format.";
	}

}
function pdt_logout(){
      var urlaction = "logoutAction?methodAction=logout";
	  window.location = "${pageContext.request.contextPath}/" + urlaction;
}
$(function() {
    $( "#datepicker-10" ).datepicker({
    	 format: "mm/yyyy",
 	    viewMode: "months", 
 	    minViewMode: "months"
    });
 });


function isNumberKey(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48 || charCode > 57)) {
        return false;
    }
    return true;
}
function onlyNumberExist(evt) {
	if (evt.srcElement.value.match(/[a-z]/i)) {
		evt.srcElement.value = "";
	}
}
function isvalidateDate(val){
	
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

function getAjaxCall(urlaction){
	 if(urlaction == "medicines"){
		 urlaction = "genAction?methodAction=list&button=medicines"
	 }
	 
	 if(urlaction == "insertmedicines"){
		 urlaction = "genAction?button=medicines&methodAction=save"
	 }
	 
	 if(urlaction == "reportGen"){
		 urlaction = "genAction?formAccess=reportGen&report=true&methodAction=list"
	 }
	  window.location = "${pageContext.request.contextPath}/" + urlaction;

	}
	function getAjaxCal(urlaction){
		 var productname = urlaction.value;
		 var urlaction = "genAction?methodAction=list&formAccess=update&productName=" + productname;
		 window.location = "${pageContext.request.contextPath}/" + urlaction;
				 
	}
	function getAjaxSearch(urlaction){
		 var productname = urlaction.value;
		 var urlaction = "genAction?methodAction=list&formAccess=readonly&productName=" + productname;
		 window.location = "${pageContext.request.contextPath}/" + urlaction;
				 
     }
	function isToDateGreater(to , from){
	
	
	var todate = to.datepicker('getDate');
	var fromdate   = from.datepicker('getDate');
	var days = todate-fromdate;
		var todate = Date.parse(to); 
		var fromdate = Date.parse(from);
		 if(days >= 0){
			return true;
		}
		else{
			return false;
		} 
     }
		
	
	function testASCIIChar(str){
		//alert("str:::"+str.value);

		var toTest=str;
		var retStr = "";

		for(var i=0;i<toTest.length;i++){

			var ascCode=toTest.charCodeAt(i);
			//alert("ascCode:::"+ascCode);

			if(ascCode>127){
				if(retStr == "")
					{
					retStr += toTest.charAt(i)+ ",";
					}
					else if(retStr.indexOf(toTest.charAt(i))== -1)
					{
						retStr += toTest.charAt(i)+ ",";
					}
						//return toTest.charAt(i);
			}
			//alert()
		}
		
		return retStr;

	}
</script>


