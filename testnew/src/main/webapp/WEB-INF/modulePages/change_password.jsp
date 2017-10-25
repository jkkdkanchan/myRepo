<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="panel panel-success">
 <div class="panel-heading">
  <p align="center">Please Change Password</p>
 </div>
</div>


<div class="row">
      <div class="col-sm-2">
        
      </div>
       <div  class="col-sm-8">
			         <form class="form-horizontal" action="curdAction" id="change_pass_form">
			<s:token />
			  <fieldset>
			    <div class="form-group">
			      <label class="col-lg-5 control-label">User Name</label>
			      <div class="col-lg-5">
			        <input  class="form-control" id="user" name="credential.preUserName" placeholder="User Name" type="text">
			      </div>
			    </div>
			    <div class="form-group">
			      <label  class="col-lg-5 control-label">New User Name</label>
			      <div class="col-lg-5">
			        <input class="form-control" id="newuser" name="credential.userName" placeholder="New User Name" type="text">
			      </div>
			    </div>
			    <div class="form-group">
			      <label  class="col-lg-5 control-label">Password</label>
			      <div class="col-lg-5">
			        <input class="form-control" id="password" name="credential.prePassword" placeholder="Password" type="password">
			      </div>
			    </div>
			    <div class="form-group">
			      <label  class="col-lg-5 control-label">New Password</label>
			      <div class="col-lg-5">
			        <input class="form-control" id="newpass" name="credential.password" placeholder="New Password" type="password">
			      </div>
			    </div>
			   <div class="row" align="center">
                  <button type="button" class="btn btn-primary" onclick="pdt_insertsubmit()">Submit</button>
             </div>
			    
			  </fieldset>
			  <s:hidden name= "methodAction" value="changepassword"/>
			</form>

      </div>
      <div class="col-sm-2">
		
      </div>
 </div> 


<script>
function pdt_insertsubmit(element){
	if($("#user").val().trim() == "" || $("#newuser").val().trim() == "" || $("#password").val().trim() == "" || $("#newpass").val().trim() == "" ){
		   $("#myModal").modal('show');
			document.getElementById("modalbody").innerHTML = "All fields should be filled.";
		return;
	}
	else{
	    document.getElementById('change_pass_form').submit();
	}
} 
</script>
</body>
</html>












