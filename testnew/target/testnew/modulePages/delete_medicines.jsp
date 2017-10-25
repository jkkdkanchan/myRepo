<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body >
<table>
<form action="delete">
<tr><td>
 <s:select name="medicineInfo.productName" list="productList" onchange="getAjaxCal(this)" headerKey = "" headerValue="" label="Product Name"/>
</td></tr>
<tr><td></td><td><s:textfield name="medicineInfo.quantity" label="Quantity"/></td></tr>
 <tr><td></td><td> <s:textfield name="medicineInfo.pricePerUnit" label="Price Per Unit" /></td></tr>
 <tr><td></td><td><input name="pdt_submitButton" type="image" src='<s:url value="/images/buttons/update_qua.bmp"/>' /></td>
 </tr>
 <s:hidden name= "medicineInfo.productId" />
 <s:hidden name= "medicineInfo.productCategory" />
 <s:hidden name= "medicineInfo.companyName" />
 </form>
 </table>
 <table>
<tr>
 <th>product Id</th>
 <th>Product Name</th>
 <th>Product company</th>
 <th>Product Category</th>
 <th>Quantity</th>
 <th>Price Per Unit</th>
</tr>

 <tr>
  <td><s:property value="medicineInfo.productId"/></td>
  <td><s:property value="medicineInfo.productName"/></td>
  <td><s:property value="medicineInfo.companyName"/></td>
  <td><s:property value="medicineInfo.productCategory"/></td>
  <td><s:property value="medicineInfo.quantity"/></td>
  <td><s:property value="medicineInfo.pricePerUnit"/></td>
 </tr> 

</table>

</body>
<script>



</script>
</html>