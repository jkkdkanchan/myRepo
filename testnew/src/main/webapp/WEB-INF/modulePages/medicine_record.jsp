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
		      <s:if test="action == 'medRecord' || action == 'medRecordDelete'">
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Product Name</label>
				      <div class="col-lg-5">
				        <input  class="form-control" maxlength="25"  name="medRecord.name"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Company Name</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="25" name="medRecord.companyName"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Content</label>
				      <div class="col-lg-5">
				        <input class="form-control" maxlength="25"  name="medRecord.content"  type="text">
				      </div>
				    </div>	    
		      </s:if>
		      <s:else>
		           <div class="form-group">
				      <label  class="col-lg-5 control-label">Product Name</label>
				      <div class="col-lg-5">
				        <input readonly="readonly"  class="form-control" maxlength="25"  name="medRecord.name" value="<s:property value="medRecord.name"/>"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Company Name</label>
				      <div class="col-lg-5">
				        <input readonly="readonly" class="form-control" maxlength="25"  name="medRecord.companyName" value="<s:property value="medRecord.companyName"/>"  type="text">
				      </div>
				    </div>
				    <div class="form-group">
				      <label  class="col-lg-5 control-label">Content</label>
				      <div class="col-lg-5">
				        <input readonly="readonly" class="form-control" maxlength="25"  name="medRecord.content" value="<s:property value="medRecord.content"/>"  type="text">
				      </div>
				    </div>		   
		          <s:hidden name= "medRecord.id" />
		      </s:else>
		        
		      
		
		  <s:hidden name= "action" value="medRecord"/>
		  <div class="form-group">
		      <div class="col-sm-12">
		        <p align="right">
		        <s:if test="action == 'medRecord'  || action == 'medRecordDelete'">
		          <button type="submit" class="btn btn-primary" >save</button>
		        </s:if>
		        <s:else>
		           <button type="submit" href="partycallAction.action?action=medRecord" class="btn btn-primary" >cancel</button>
		           <input id="deleteId" type="button" onclick="takeoperation('delete')"  class="btn btn-primary" value="delete" >
		           <input id="editId" type="button" onclick="takeoperation('edit')" class="btn btn-primary" value="edit" >
		        </s:else>
		        </p>
		      </div>
		  </div>
     </s:form>
    </div>
    <div  class="col-sm-8"> 
 
	 <display:table class="table" uid="studentTable" name="medRecordList"  requestURI="">
		<display:column title="S. No."  value="<%= studentTable_rowNum %>" ></display:column>
		<display:column   property="name" title="Product Name"  href="partycallAction.action?action=medRecordUpdate" paramId="medRecord.id" paramProperty="id" />
		<display:column   property="companyName" title="Company Name" />
		<display:column   property="content" title="Content" />
		<display:column   property="scheduleH1" title="Schedule H1 Status" />
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
			   if(action[i].name.indexOf("medRecord") == 0){
				   action[i].readOnly = false;
			   }
		   }
		   $('#deleteId').hide();
		   ele.value = "save";
		  return;
	   }
	   if(val == 'delete'){
		   for(var i=0; i < action.length; i++){
			   if(action[i].value == 'medRecord'){
				   action[i].value = 'medRecordDelete';
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