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
     <div class="col-sm-2">
        
    </div>
    <div  class="col-sm-4"> 
	  <s:form action="partyAction" id="insert_form_id" name="insert_form" theme="simple">
	      <s:token />
		 <div class="form-group">
		      <label class="col-lg-5 control-label">Schedule H1 Name</label>
		      <div class="col-lg-5">
		      <s:if test="action == 'scheduleH1' || action == 'scheduleDelete'">
		        <input class="form-control" maxlength="25" name="scheduleOne.name" type="text">
		      </s:if>
		      <s:else>
		        <input id="scheduleId" readonly="readonly" class="form-control" maxlength="25" name="scheduleOne.name" value="<s:property value="scheduleOne.name"/>" type="text">
		        <s:hidden name= "scheduleOne.scheduleId" />
		      </s:else>
		        
		      </div>
		 </div>
		  <s:hidden name= "action" value="scheduleH1"/>
		  <div class="form-group">
		      <div class="col-sm-12">
		        <p align="right">
		        <s:if test="action == 'scheduleH1'  || action == 'scheduleDelete'">
		          <button type="submit" class="btn btn-primary" >save</button>
		        </s:if>
		        <s:else>
		           <button type="submit" href="partycallAction.action?action=scheduleH1" class="btn btn-primary" >cancel</button>
		          <input id="deleteId" type="button" onclick="takeoperation('delete')"  class="btn btn-primary" value="delete" >
		          <input id="editId" type="button" onclick="takeoperation('edit')" class="btn btn-primary" value="edit" >
		        </s:else>
		        </p>
		      </div>
		  </div>
     </s:form>
    </div>
    <div  class="col-sm-4"> 
 
	 <display:table class="table" uid="studentTable" name="scheduleList"  requestURI="">
		<display:column title="S. No."  value="<%= studentTable_rowNum %>" ></display:column>
		<display:column   property="name" title="Schedule H1 Name"  href="partycallAction.action?action=scheduleUpdate" paramId="scheduleOne.scheduleId" paramProperty="scheduleId" />
		
	</display:table>
	</div>
	<div class="col-sm-2">
        
    </div>
  </div>
   <script>
   function takeoperation(val){debugger;
   
   var ele = document.getElementById("editId");
	   if(val == 'edit' && ele.value == 'save'){
		   document.getElementById("insert_form_id").submit();
		  return;
		   
	   }
	   if(val == 'edit'){
		   
		   var se = document.getElementById("scheduleId");
		   se.readOnly = false;
		   $('#deleteId').hide();
		   ele.value = "save";
		  return;
	   }
	   if(val == 'delete'){
		   
		   var action = document.getElementById("insert_form_id");
		   for(var i=0; i < action.length; i++){
			   if(action[i].value == 'scheduleH1'){
				   action[i].value = 'scheduleDelete';
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