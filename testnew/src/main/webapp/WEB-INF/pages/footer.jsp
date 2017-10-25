<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>


<br>
<marquee  bgcolor="yellow" behavior="scroll"  direction="left">
List of Medicines that will Expire in one month:-
<s:iterator value="oneMonthExpList"> 
     <s:property value="productName"/> ,
</s:iterator>
</marquee>

