<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>All Items</title>
</head>
<body>
<h1>List Items</h1>
<h3><a href="add.html">Add More Item</a></h3>

<c:if test="${!empty items}">
 <table align="left" border="1">
  <tr>
   <th>Item ID</th>
   <th>Item Master</th>
   <th>Item Code</th>
   <th>Item Name</th>
   <th>Item Qty</th>
  </tr>

  <c:forEach items="${items}" var="item">
   <tr>
    <td><c:out value="${item.id}"/></td>
    <td><c:out value="${item.iMaster}"/></td>
    <td><c:out value="${item.iCode}"/></td>
    <td><c:out value="${item.iName}"/></td>
    <td><c:out value="${item.iQty}"/></td>
   </tr>
  </c:forEach>
 </table>
</c:if>
</body>
</html>