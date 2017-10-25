<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<!DOCTYPE html>
<html >
<head>



</head>
<body >

<table>
<s:if test="isButtonShow('medicines') || isButtonShow('companies')">
<tr id = "insertMeTr"><td><input name="name"  onclick= "getAjaxCall('login')"type="image" src='<s:url value="/images/buttons/button_back.bmp"/>' /> </td></tr>

</s:if>

<tr id = "changePasstr"><td><input name="name"  type="image" src='<s:url value="/images/buttons/change_pass.gif"/>'  /></td></tr>
<tr id = "createUser"><td><input name="name"  type="image" src='<s:url value="/images/buttons/create_user.gif"/>'  /></td></tr>
<tr id = "view"><td><input name="name"  type="image" src='<s:url value="/images/buttons/logout.gif"/>' /></td></tr>
</table>
</body>
<script>


/* function getAjaxCalldd(urlaction){
	  window.location = "${pageContext.request.contextPath}/" + urlaction;

	} */
</script>
</html>