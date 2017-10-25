<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
	<style>
		body, input{
			font-family: Calibri, Arial;
		}
		table#contact {
			border-collapse: collapse;
			width:550px;
		}
		th {
			height: 40px;
			background-color: #ffee55;
		}
	</style>
	<title>Contact Manager - Struts2 Hibernate Example</title>
</head>
<body>


<s:actionerror/>

<s:form action="add">
	<s:textfield name="medicineInfo.productName" label="Product Name"/>
	<s:textfield name="medicineInfo.companyName" label="Company Nme"/>
	<s:textfield name="medicineInfo.productCategory" label="Product Category"/>
	<s:textfield name="medicineInfo.quantity" label="Quantity"/>
	<s:textfield name="medicineInfo.pricePerUnit" label="Price Per Unit"/>
	
	<s:submit value="Insert" align="center"/>
</s:form>
</body>
</html>