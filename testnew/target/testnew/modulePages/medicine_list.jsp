<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Contacts</h2>
<table id="contact" border="1">
<tr>
	<th>product Id</th>
	<th>Product Name</th>
	<th>Product company</th>
	<th>Product Category</th>
	<th>Quantity</th>
	<th>Price Per Unit</th>
</tr>
<s:iterator value="medicineInfoList" var="medicineInfo">
	<tr>
		<td><s:property value="productId"/></td>
		<td><s:property value="productName"/></td>
		<td><s:property value="companyName"/></td>
		<td><s:property value="productCategory"/></td>
		<td><s:property value="quantity"/></td>
		<td><s:property value="pricePerUnit"/></td>
	</tr>	
</s:iterator>
</table>
</body>
</html>