<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
 <html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login- Form</title>
      <link href="js/jquery-ui.css" rel="stylesheet">
      <script src="js/jquery-1.10.2.js"></script>
      <script src="js/jquery-ui.js"></script>    
      <link rel="stylesheet" href="<s:url value='/resources/css/bootstrap.min.css'/>" >
		<link rel="stylesheet" href="<s:url value='/resources/css/jquery.dataTables.min.css'/>">
		<link rel="stylesheet" href="<s:url value='/resources/css/bootstrap-datepicker.min.css'/>" >
		<link rel="stylesheet" href="<s:url value='/resources/css/bootstrap-datepicker.standalone.min.css'/>">
		
		<script src='<s:url value="/resources/js/bootstrap.min.js"/>' ></script>
		<script src='<s:url value="/resources/js/jquery.validate.min.js"/>' ></script>
		<script src='<s:url value="/resources/js/jquery.dataTables.min.js"/>'></script>
		<script src='<s:url value="/resources/js/bootstrap-datepicker.min.js"/>'></script>

</head>
<body>
 <div id="myModal" class="modal fade">
	        <div class="modal-dialog">
	            <div class="modal-content">
	                <div class="modal-header">
	                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                    <h4 class="modal-title">Required Information</h4>
	                </div>
	                <div class="modal-body">
	                    <p id="modalbody" class="text-warning"></p>
	                </div>
	                <div class="modal-footer">
	                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	                </div>
	            </div>
	        </div>
        </div>
        
        
        
            <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2"> 
        <s:form action="genAction" id="login_user">                   
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
                       
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input autofocus="autofocus" onkeydown="if (event.keyCode == 13) document.getElementById('btn-login').click()" id="loginUser" type="text" class="form-control" name="credential.userName"  placeholder="username or email">                                        
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input onkeydown="if (event.keyCode == 13) document.getElementById('btn-login').click()" id="loginPass" type="password" class="form-control" name="credential.password" placeholder="password">
                            </div>  
                            <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember"  type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                             </div>


                             <div style="margin-top:10px" class="form-group">
                                    <div class="col-sm-12 controls">
                                      <a id="btn-login" href="#" onclick="getSearchCall('login')" class="btn btn-success">Login  </a>
                                    </div>
                             </div>


                             <div class="form-group">
                                    <div class="col-md-12 control">
                                        <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
                                            Don't have an account! 
                                        <a href="#" onClick="$('#loginbox').hide(); $('#signupbox').show()">
                                            Sign Up Here
                                        </a>
                                        </div>
                                    </div>
                              </div> 
                              <s:hidden name= "methodAction" value="credencial"/>   
                               



                        </div>                     
                    </div> 
           </s:form> 
        </div>
        <div id="signupbox" style="display:none; margin-top:50px" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <div class="panel-title">Sign Up</div>
                            <div style="float:right; font-size: 85%; position: relative; top:-10px"><a id="signinlink" href="#" onclick="$('#signupbox').hide(); $('#loginbox').show()">Sign In</a></div>
                        </div>  
                        <div class="panel-body" >
                            <s:form action="genAction" id="registration" class="form-horizontal" >
                                
                                <div id="signupalert" style="display:none" class="alert alert-danger">
                                    <p>Error:</p>
                                    <span></span>
                                </div>
                                 
                                <div class="form-group">
                                    <label for="email" class="col-md-3 control-label">Email</label>
                                    <div class="col-md-9">
                                        <input id="email" type="text" class="form-control" name="credential.email" placeholder="Email Address">
                                    </div>
                                </div>
                                    
                                <div class="form-group">
                                    <label for="firstname" class="col-md-3 control-label">User Name</label>
                                    <div class="col-md-9">
                                        <input id="user" type="text" class="form-control" name="credential.userName" placeholder="First Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="lastname" class="col-md-3 control-label">Password</label>
                                    <div class="col-md-9">
                                        <input id="pass" type="password" class="form-control" name="credential.password" placeholder="Last Name">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="password" class="col-md-3 control-label">Confirm Password</label>
                                    <div class="col-md-9">
                                        <input id="cpass" type="password" class="form-control" name="credentia" placeholder="Password">
                                    </div>
                                </div>                                

                                <div class="form-group">
                                    <div class="col-md-offset-3 col-md-9">
                                        <button onclick="getSearchCall('registration')" id="btn-signup" type="button" class="btn btn-info"><i class="icon-hand-right"></i> &nbsp Sign Up</button>
                                    </div>
                                </div>
                             <s:hidden name= "methodAction" value="registration"/>
                            </s:form>
                         </div>
                    </div>
 
         </div> 
    </div>
</body>
<script type="text/javascript" > 
debugger;
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";
window.onhashchange=function(){window.location.hash="no-back-button";}

<s:if test="(showNotification)">
    var msg = "<s:property value="notificationBarMessage" />";
    if(msg == "Already Registration Done" || msg == "Registration Successfully"){
    	$('#loginbox').hide(); 
    	$('#signupbox').show();
    }
	$("#myModal").modal('show');
	document.getElementById("modalbody").innerHTML = msg;
</s:if>

function getSearchCall(urlaction){
	if(urlaction == "login"){
		if($("#loginUser").val().trim() != "" && $("#loginPass").val().trim() != ""){
			document.getElementById('login_user').submit();
		}else{
			 $("#myModal").modal('show');
				document.getElementById("modalbody").innerHTML = "All fields should be filled.";
		}
	 }
	if(urlaction == "registration"){debugger;
		
		if($("#email").val().trim() != "" && $("#user").val().trim() != "" && $("#pass").val().trim() != "" && $("#cpass").val().trim() != ""){
			
			if($("#pass").val().trim() != $("#cpass").val().trim()){
				 $("#myModal").modal('show');
				 document.getElementById("modalbody").innerHTML = "Confirm password didn't match";
				 
			}else{
				document.getElementById('registration').submit();
			}
			 
		}else{
			 $("#myModal").modal('show');
				document.getElementById("modalbody").innerHTML = "All fields should be filled.";
		}
		  
	
	 }
}

</script>
</html>
