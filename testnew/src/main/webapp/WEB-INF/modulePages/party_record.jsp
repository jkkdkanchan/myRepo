<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

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
	<div class="row">
     
    <div  class="col-sm-4"> 
	  <s:form action="partyAction" id="insert_form_id" name="insert_form" theme="simple">
	      <s:token />
		      <s:if test="action == 'partyRecord' || action == 'partyRecordDelete'">
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Party Name</label>
				      <div class="col-lg-5">
				        <input  class="form-control" maxlength="25"  name="partyRecord.partyName"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Address</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="25" name="partyRecord.partyAddress"  type="text">
				      </div>
				    </div>
				   	    
		      </s:if>
		      <s:else>
		           <div class="form-group">
				      <label  class="col-lg-5 control-label">Party Name</label>
				      <div class="col-lg-5">
				        <input readonly="readonly"  class="form-control" maxlength="25"  name="partyRecord.partyName" value="<s:property value="partyRecord.partyName"/>"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Address</label>
				      <div class="col-lg-5">
				        <input readonly="readonly" class="form-control" maxlength="25"  name="partyRecord.partyAddress" value="<s:property value="partyRecord.partyAddress"/>"  type="text">
				      </div>
				    </div>
				   		   
		          <s:hidden name= "partyRecord.partyId" />
		      </s:else>
		        
		      
		
		  <s:hidden name= "action" value="partyRecord"/>
		  <div class="form-group">
		      <div class="col-sm-12">
		        <p align="right">
		        <s:if test="action == 'partyRecord'  || action == 'partyRecordDelete'">
		          <button type="submit" class="btn btn-primary" >save</button>
		        </s:if>
		        <s:else>
		           <button type="submit" href="partycallAction.action?action=partyRecord" class="btn btn-primary" >cancel</button>
		           <input id="deleteId" type="button" onclick="takeoperation('delete')"  class="btn btn-primary" value="delete" >
		           <input id="editId" type="button" onclick="takeoperation('edit')" class="btn btn-primary" value="edit" >
		        </s:else>
		        </p>
		      </div>
		  </div>
     </s:form>
    </div>
    <div  class="col-sm-8"> 
 
	 <display:table class="table" uid="studentTable" name="partyRecordList"  requestURI="">
		<display:column title="S. No."  value="<%= studentTable_rowNum %>" ></display:column>
		<display:column   property="partyName" title="Party Name"  href="partycallAction.action?action=partyRecordUpdate" paramId="partyRecord.partyId" paramProperty="partyId" />
		<display:column   property="partyAddress" title="Party Address" />
		<display:column   property="totalNetAmount" title="Net Total" />
		<display:column   property="totalMrpAmount" title="MRP Total" />
	</display:table>
	</div>
	
  </div>
   <script>
   function takeoperation(val){
   var action = document.getElementById("insert_form_id");
   var ele = document.getElementById("editId");
	   if(val == 'edit' && ele.value == 'save'){
		   action.submit();
		  return;
		   
	   }
	   if(val == 'edit'){
		   for(var i=0; i < action.length; i++){
			   if(action[i].name.indexOf("partyRecord") == 0){
				   action[i].readOnly = false;
			   }
		   }
		   $('#deleteId').hide();
		   ele.value = "save";
		  return;
	   }
	   if(val == 'delete'){
		   for(var i=0; i < action.length; i++){
			   if(action[i].value == 'partyRecord'){
				   action[i].value = 'partyRecordDelete';
				   break;
			   }
		   }
		   action.submit();
		   return;
		   
	   }
	   
	   
	   
	   
   }
   </script>
</body>
</html>