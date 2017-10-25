<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html >
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.1.5/angular.min.js"></script>


</head>
<body >

<table>
<s:if test="isButtonShow('mainButton')">
<tr id= "medicinestr"><td><input name="medicines" onclick= "getAjaxCall('medicines')" type="image" src='<s:url value="/images/buttons/button_blank.gif"/>' /></td></tr>
<tr id= "comapniesty"><td><input name="companies" onclick= "getAjaxCall('companies')" type="image" src='<s:url value="/images/buttons/button_company.gif"/>' /></td></tr>
<tr id = "viewtr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/view_record.gif"/>' /> </td></tr>
<tr id = "recordtr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/new_sales.gif"/>' /></td></tr>
</s:if>

<s:if test="isButtonShow('medicines')">
<tr id = "insertMeTr"><td><input name="name"  onclick= "getAjaxCall('insertmedicines')" type="image" src='<s:url value="/images/buttons/inset_med.gif"/>' /> </td></tr>
<tr id = "updateMeTr"><td><input name="name"  onclick= "getAjaxCall('updatemedicines')" type="image" src='<s:url value="/images/buttons/update_med.gif"/>' /></td></tr>
<tr id = "deleteMeTr"><td><input name="name"  onclick= "getAjaxCall('deletemedicines')" type="image" src='<s:url value="/images/buttons/delete_med.gif"/>'  /></td></tr>
</s:if>
<s:if test="isButtonShow('companies')">
<tr id = "insertCoTr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/insert_com.gif"/>' /> </td></tr>
<tr id = "updateCoTr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/update_com.gif"/>' /></td></tr>
<tr id = "deleteCoTr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/delete_com.gif"/>'  /></td></tr>
</s:if>

</table>

</body>
<script>


function getAjaxCall(urlaction){debugger;
	 if(urlaction == "medicines"){
		 urlaction = "list?button=medicines"
	 }
	 if(urlaction == "companies"){
		 urlaction = "list?button=companies"
	 }
	 if(urlaction == "insertmedicines"){
		 urlaction = "insert?button=medicines"
	 }
	 if(urlaction == "updatemedicines"){
		 urlaction = "update?button=medicines&formAccess=update"
	 }
	 if(urlaction == "deletemedicines"){
		 urlaction = "update?button=medicines&formAccess=delete"
	 }
	  window.location = "${pageContext.request.contextPath}/" + urlaction;

	}
	function getAjaxCal(urlaction){debugger;
		 var productname = urlaction.value;
		 var urlaction = "update?button=medicines&formAccess=update&productName=" + productname;
		 window.location = "${pageContext.request.contextPath}/" + urlaction;
				 
	}
	function getAjaxCalDel(urlaction){debugger;
	 var productname = urlaction.value;
	 var urlaction = "update?button=medicines&formAccess=delete&productName=" + productname;
	 window.location = "${pageContext.request.contextPath}/" + urlaction;
			 
}
</script>
</html>