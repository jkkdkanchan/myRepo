<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.modal-dialog {
  width: 1100px;
}
.modal-content {
  width: 1100px;
}

</style>
</head>
 
<body>

<s:form action="partyAction" id="insert_form_id" name="insert_form" theme="simple">
<s:token />
<div class="panel panel-success">
 <div class="panel-heading">
  <div class="row">
      <div class="col-sm-4">
        <p align="left">BillNumber: <input id="customerId" maxlength="25"  style="margin-right: 1px" name="pbList.billNumber"  /></p>
        <p align="left">Party Name: &nbsp;<s:select id="doctId" style="margin-left: 25px" list="partyList" name="pbList.partyName" headerKey=""  headerValue="--Select Party--" /> <a href="partycallAction.action?action=partyRecord">Add Party</a></p>
       
      </div>
       <div  class="col-sm-4">
          <p align="left">Net Amount:&nbsp;<input maxlength="25" id="addId" name="pbList.netAmount"  /></p>
          <p align="left">Tax on:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="radio" name="radio" onclick="setOnchangeTotal()"  value="MRP"> <code>MRP</code>  <input type="radio" name="radio" onclick="setOnchangeTotal()"  value="Net"> <code>Amount</code> </p>
      </div>
      <div class="col-sm-4">
		<p align="left">Billing Date : <input size="8" data-date-format="dd/mm/yyyy"  STYLE="background-color: #FAEBD7;" readonly="readonly" name="pbList.billDate" type="text" id="datepicker-11" /><a><img src="<s:url value='/images/calendar.gif'/>" /></a></p>
        <p align="left">Mrp Amount     : <input onkeypress="return isNumberKey(event)" style="margin-left: 23px" type="text" size="8" name="pbList.mrpAmount" /></p>
      </div>
     
  </div> 
 </div>
</div> 
<div ng-app="myApp" ng-controller="myCtrl">
 <table id ="appendId" class="table table-striped table-hover table-condensed table-bordered" >
<thead>
  <tr>
	<th >PRODUCT</th>
	<th >MFG</th>
	<th >BATCH</th>
	<th >EXP</th>
	<th >Amount </th>
	<th >Tax</th>
	<th >QTY.</th>
	<th >Net Amount</th>
	<th >Mrp Amount</th>
	
  </tr>
</thead>
  <tr>
   <td align="left"><input size="12" onmousedown="show(this);" type="text" name= "pbDetails[0]_product" /></td>
   <td align="left"><input size="8" type="text" name="pbDetails[0]_mfg" /></td>
   <td align="left"><input size="8" type="text" name="pbDetails[0]_batch" /></td>
   <td align="left"> <input size="8"  id="dateset"  type="text" name = "pbDetails[0]_expDate" /></td>
   <td align="left"><input size="4"  type="text" id = "amount_0" onkeyup="setAmount(this)" /></td>
   <td align="left"><input size="4" type="text" id = "tax_0" onkeyup="setAmount(this)" /></td>
   <td align="left"><input size="4"  type="text" name = "pbDetails[0]_quantity" /></td>
   <td align="left"><input size="4" type="text" id="netAmount_0" onkeyup="setAmount(this)" name = "pbDetails[0]_netAmount" /></td>
   <td align="left"><input size="8" type="text" id="mrpAmount_0" onkeyup="setAmount(this)" name = "pbDetails[0]_mrpAmount" /><a href="javascript:void(0);" onclick="addpartyRow();">&nbsp;<img src="images/buttons/plus.gif" width="24px"></a>  </td>
   </tr>
 </table>
        <div id="myModalla" class="modal fade" style="width:100 px;">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Search in existing med</h4>
	                    <label>Search: <input id="searchId" ng-model="searchText"></label><a href="partycallAction.action?action=medRecord">Add Medicine</a>
	                </div>
	                <div class="modal-body" style="height: 300px; overflow:auto;">
	                  <table class="table table-striped table-hover table-condensed table-bordered" >
	                    <thead style="background-color: #7FFFD4">
			                <tr>
			                    <th>Name </th>
			                    <th>Company Name </th>
			                    <th>content</th>
			                    <th>Schedule H1 Status </th>
			                </tr>
                       </thead>
                       <tbody>
			                <tr ng-repeat="item in medItems"">
			                    <td><a ng-click="matchto()" href="#" >{{item.name}} </a> </td>
			                    <td>{{item.companyName}}</td>
			                    <td>{{item.content}}</td>
			                    <td>{{item.scheduleH1}}</td>
			                </tr>
                       </tbody>
	                  </table>
	                  <br>
	                  <br>
	                </div>
	                <div class="modal-footer" style="height: 200px; overflow:auto;">
	                <div ng-show="medDItems.length == 0">
	                    <p align="center" >No record found Please click on below link</p>
	                    <p align="center" ><a ng-click="setRecord()" href="#" > {{currentName.name}} </a></p>
	                   
	                </div>
	                <div ng-show="medDItems.length != 0">
	                     <table class="table table-striped table-hover table-condensed table-bordered" >
	                        <thead style="background-color: #7FFFD4">
				                <tr>
				                    <th>Name </th>
				                    <th>Mfg</th>
				                    <th>Batch</th>
				                    <th>Qnt</th>
				                    <th>Expiry </th>
				                </tr>
                            </thead>
                           <tbody>
				                <tr ng-repeat="item in medDItems">
				                    <td align="left"><a ng-click="setField()" href="#" >{{item.name}} </a> </td>
				                    <td align="left">{{item.mfg}}</td>
				                    <td align="left">{{item.batch}}</td>
				                    <td align="left">{{item.quantity}}</td>
				                    <td align="left">{{item.expDate | date:'MM/yyyy'}}</td>
				                    
				                </tr>
                            </tbody>
	                     </table>
	                 </div>
	                </div>
	            </div>
	        </div>
        </div>
 </div>
  <div class="form-group">
      <div class="col-sm-12">
        <p align="right"><button type="submit" class="btn btn-primary" >Save</button></p>
      </div>
    </div>
<input type="hidden" name = "pbDetails[0]_content" />
 
 </s:form>
 
   <script>
   
   var index;
   function show(event){debugger;
       index = event.name.substring(event.name.indexOf("[")+1,event.name.indexOf("]"))
	   $("#myModalla").modal('show');
   }
   
   var app = angular.module('myApp', []);
   app.controller('myCtrl', function($scope, $filter, filterFilter ,$http) {
	   
	   $http.get("angularAction").success(
               function(response) {
               	$scope.allItems = response.currentMedRecord;
            	$scope.allMedItems = response.medRecordList;
            	
               })
	   
	           $scope.$watch('searchText', function(val){
	        	   if(val == '' || val == null){
	        		   $scope.medItems = null;
	        	   }
	        	   else{
	        		   $scope.medItems = filterFilter($scope.allMedItems, {name: val});  
	        	   }
			    });
	   
	           $scope.matchto = function(){debugger;
	        	   var content = "pbDetails[" + index + "]_content";
	        	   document.getElementsByName(content)[0].value = this.item.content;
				   var val = this.item.name;
				   $scope.currentName = this.item;
				   $scope.medDItems = filterFilter($scope.allItems, {name: val}, true);
				  
               }
	       
	           $scope.setField = function(){
		    	   var name = "pbDetails[" + index + "]_product";
		    	   var mfg = "pbDetails[" + index + "]_mfg";
		    	   var batch = "pbDetails[" + index + "]_batch";
		    	   var exp = "pbDetails[" + index + "]_expDate";
		    	  
				   document.getElementsByName(name)[0].value = this.item.name;
				   document.getElementsByName(mfg)[0].value = this.item.mfg;
				   document.getElementsByName(batch)[0].value = this.item.batch;
				   document.getElementsByName(exp)[0].value = $filter('date')(this.item.expDate, "MM-yyyy");  	
				   $scope.medItems = null;
				   $scope.medDItems = null;
				   document.getElementById("searchId").value = "";
				   $("#myModalla").modal('hide');
	           }
	           $scope.setRecord = function(){
		    	   var name = "pbDetails[" + index + "]_product";
		    	   var mfg = "pbDetails[" + index + "]_mfg";
		    	   var batch = "pbDetails[" + index + "]_batch";
		    	   var exp = "pbDetails[" + index + "]_expDate";
				   document.getElementsByName(name)[0].value = this.currentName.name;
				   document.getElementsByName(mfg)[0].value = '';
				   document.getElementsByName(batch)[0].value = '';
				   document.getElementsByName(exp)[0].value = '';
				   $scope.medItems = null;
				   $scope.medDItems = null;
				   document.getElementById("searchId").value = "";
				   $("#myModalla").modal('hide');
	           }
	   
	     
   });
   
   $(function() {
	    $( "#datepicker-11" ).datepicker({
	       todayHighlight : true,
	       beforeShow: function(i) { if ($(i).attr('readonly')) { return false; } }
	    }).datepicker("setDate", new Date()); 
	 });
 
  var indexx = 0;
  function addpartyRow(){
  	indexx = indexx + 1;
  	var f1 = '<tr id = ' + indexx + '><td align="left"><input onmousedown="show(this);" type="text" size="12" name= ' + 'pbDetails[' + indexx + ']_product  /></td>';
  	var f2 = '<td align="left"><input type="text" size="8" name= ' + 'pbDetails[' + indexx + ']_mfg  /></td>';
  	var f3 = '<td align="left"><input type="text" size="8" name= ' + 'pbDetails[' + indexx + ']_batch  /></td>';
  	var f4 = '<td align="left"> <input type="text" size="8"  name = ' + 'pbDetails[' + indexx + ']_expDate  />';
  	
  	var f5 = '<td align="left"> <input type="text" onkeyup="setAmount(this)"  size="4" id = ' + 'amount_' + indexx + '  /></td>';
  	var f6 = '<td align="left"><input type="text" onkeyup="setAmount(this)"  size="4"   id = ' + 'tax_' + indexx + '  /></td>';
  	
  	var f7 = '<td align="left"><input type="text"  size="4"   name = ' + 'pbDetails[' + indexx + ']_quantity  /></td>';
  	var f8 = '<td align="left"> <input type="text" onkeyup="setAmount(this)"  size="4" id = netAmount_'+ indexx + ' name = ' + 'pbDetails[' + indexx + ']_netAmount  />';
  	var f9 = '<td align="left"> <input type="text" onkeyup="setAmount(this)"  size="8" id = mrpAmount_'+ indexx + ' name = ' + 'pbDetails[' + indexx + ']_mrpAmount  />';
  	var f10 = '<input type="hidden"  size="8" name = ' + 'pbDetails['+indexx+']_content  />';
  	var f11 = '<a href="#" onclick="addpartyRow()">&nbsp;<img src="images/buttons/plus.gif" width="24px"></a><a href="#" name = ';
  	var f12 = ' onclick="deleteRow(this)">&nbsp;<img src="images/buttons/minus.gif" width="24px"></a></tr>';
  
      $('#appendId tbody').append(f1 + f2 + f3 + f4 + f5 + f6 + f7 + f8+ f9 + f10 + f11 + indexx + f12); 
  } 
  function deleteRow(obj){debugger;
      var elements = $('#appendId tbody').children();
     for(var i = 0 ; i <= elements.length; i++){
      	 if(elements[i].id == obj.name){
      		elements[i].outerHTML = "";
      		 break; 
      	 }
       } 
     document.getElementsByName('pbDetails['+obj.name+']_content')[0].outerHTML = "";
  }
  
  function setAmount(event, val){debugger;
  var ind = "";
  if(val){
	  ind = event;
  }else{
	  var id = event.id;
	  var arrId = event.id.split("_");
	  ind = arrId[1];
  }
  
  var amountId = "amount_" + ind;
  var rateId = "tax_" + ind;
  var net_Amount = "pbDetails[" + ind +"]_netAmount";
  var mrp_Amount = "pbDetails[" + ind +"]_mrpAmount";
  
  var rate = document.getElementById(rateId).value;
      rate = rate == "" ? 0 : parseFloat(rate);
  
  var amount = document.getElementById(amountId).value;
      amount = amount == "" ? 0 : parseFloat(amount);
      
  var mrpAmount = document.getElementsByName(mrp_Amount)[0].value;
      mrpAmount = mrpAmount == "" ? 0 : parseFloat(mrpAmount);
  
  var cal_Amount = 0;
      
      var dd = document.getElementsByName("radio");
      if(dd[0].checked){
    	  cal_Amount = mrpAmount;
      }
      if(dd[1].checked){
    	  cal_Amount = amount;
      }
      document.getElementsByName(net_Amount)[0].value = rate * cal_Amount * .01;
  
      setTotalAmount();
}
function setTotalAmount(){
  var elements = $('#appendId tbody').children();
  var totalNet = 0;
  var totalMrp = 0;
  for(var i = 0 ; i < elements.length; i++){
   	 var str = elements[i].outerHTML;
   	 var indexBeg = str.indexOf("pbDetails[");
   	 var indexEnd = str.indexOf("]_product");
   	 var ind = str.substring(indexBeg+10, indexEnd);
   	 
   	var net_Amount = "pbDetails[" + ind +"]_netAmount";
    var mrp_Amount = "pbDetails[" + ind +"]_mrpAmount";
   	 
    var priceName = "pbDetails[" + ind +"]_price";
   	var mrpAmount = document.getElementsByName(mrp_Amount)[0].value;
        mrpAmount = mrpAmount == "" ? 0 : parseFloat(mrpAmount);
        totalMrp = totalMrp + mrpAmount;
    var netAmount = document.getElementsByName(net_Amount)[0].value;
        netAmount = netAmount == "" ? 0 : parseFloat(netAmount);
        totalNet = totalNet + netAmount
   
    } 
  document.getElementsByName("pbList.netAmount")[0].value = totalNet;
  document.getElementsByName("pbList.mrpAmount")[0].value = totalMrp;
}
function setOnchangeTotal(){
	
	
	 var elements = $('#appendId tbody').children();
	  
	  for(var i = 0 ; i < elements.length; i++){
	   	 var str = elements[i].outerHTML;
	   	 var indexBeg = str.indexOf("pbDetails[");
	   	 var indexEnd = str.indexOf("]_product");
	   	 var ind = str.substring(indexBeg+10, indexEnd);
	   	 
	   	setAmount(ind, true);
	
	  }
	
	
	
}
   </script>
</body>
</html>