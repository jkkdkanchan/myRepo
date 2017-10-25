<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator" %>
 <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <link href="js/jquery-ui.css" rel="stylesheet">
      <script src="js/jquery-1.10.2.js"></script>
      <script src="js/jquery-ui.js"></script> 
      
     <%--  <script src="angular/angular.min.js"></script> --%>
      <script src="angular/underscore.js"></script>
      <script src = "https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
         
<link rel="stylesheet" href="<s:url value='/resources/css/bootstrap.min.css'/>" >
<link rel="stylesheet" href="<s:url value='/resources/css/jquery.dataTables.min.css'/>">
<link rel="stylesheet" href="<s:url value='/resources/css/bootstrap-datepicker.min.css'/>" >
<link rel="stylesheet" href="<s:url value='/resources/css/bootstrap-datepicker.standalone.min.css'/>">

<%-- <script src="https://raw.githubusercontent.com/igorescobar/jQuery-Mask-Plugin/master/src/jquery.mask.js"></script> --%>
<script type="text/javascript" src="http://digitalbush.com/wp-content/uploads/2013/01/jquery.maskedinput-1.3.1.min_.js"></script>


<script src='<s:url value="/resources/js/bootstrap.min.js"/>' ></script>
<script src='<s:url value="/resources/js/jquery.validate.min.js"/>' ></script>
<script src='<s:url value="/resources/js/jquery.dataTables.min.js"/>'></script>
<script src='<s:url value="/resources/js/bootstrap-datepicker.min.js"/>'></script>
      
     <%--  <script src="bootstrap/css/bootstrap.js"></script>
      <script src="bootstrap/css/bootstrap.min.js"></script> --%>
       <style>
	    .navbar { margin-bottom:0px !important; }
        #bodyId { margin-top:0px !important }
      </style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <decorator:head/>
</head>
<body>

   <div class="container-fluid" id="content">
        <div id="headerId" class="row" >
            <%@ include file="/WEB-INF/pages/header.jsp"%>
        </div>
        <div class="modal fade in" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog modal-sm" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Please confirm</h4>
      </div>
      <div class="modal-body">
        <p id="modalbody"><i class="fa fa-question-circle-o"></i></p>
      </div>
      <div class="modal-footer">
        <button id="btnYes" type="button" class="btn btn-default" data-dismiss="modal">Yes</button>
        <button  id="btnNo" type="button" class="btn btn-primary">No</button>
      </div>
    </div>
  </div>
</div>
<!-- <div class="modal-backdrop fade in"></div> -->
        <div id="bodyId" class="row" style="height:550px;overflow:auto;">
             <decorator:body />
        </div>
            
        <div style ='background-color: #2ba6cb; height:20px;' class="row">
              <%@ include file="/WEB-INF/pages/footer.jsp"%>
        </div>
	</div>
	
	<script type="text/javascript">
	<s:if test="(showNotification)">
	   
	  $("#myModal").modal('show');
	  document.getElementById("modalbody").innerHTML = "<s:property value="notificationBarMessage" />";
	
	</s:if>

	</script>
</body>
</html>