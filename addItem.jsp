<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <title>ItemCRUD Operation</title>
  
 </head>
 <body>
  <h2>Add Item Data</h2>
  <form:form name="f" method="POST" action="/ItemCRUD/save.html" >
      <table>
       <tr>
           <td><form:label path="id">Item ID:</form:label></td>
           <td><form:input path="id" value="${item.id}" readonly="true" placeholder="Id Generate Automatically"/></td>
       </tr>
       <tr>
           <td><form:label path="iMaster">Item Master:</form:label></td>
           <td><form:input path="iMaster" value="${item.iMaster}"  required="required" placeholder="Enter Item Master"/></td>
       </tr>
       <tr>
           <td><form:label path="iCode">Item Code:</form:label></td>
           <td><form:input path="iCode" value="${item.iCode}" required="required" placeholder="Enter Item Code" /></td>
       </tr>
       <tr>
           <td><form:label path="iName">Item Name:</form:label></td>
           <td><form:input path="iName" value="${item.iName}"  required="required" placeholder="Enter Item Name"/></td>
       </tr>
       
       <tr>
           <td><form:label path="iQty">Item Qty:</form:label></td>
                    <td><form:input path="iQty" value="${item.iQty}"  required="required" placeholder="Enter Item Quatity" onkeypress="if ( isNaN( String.fromCharCode(event.keyCode) )) return false;"/></td>
       </tr>
          <tr>
         <td colspan="2"><input type="submit" value="Submit"/></td>
        </tr>
   </table> 
  </form:form>
   
  <c:if test="${!empty items}">
  <h2>List Items</h2>
 <table align="left" border="1">
  <tr>
   <th>Item ID</th>
   <th>Item Master</th>
   <th>Item Code</th>
   <th>Item Name</th>
   <th>Item Qty</th>
           <th>Actions on Row</th>
  </tr>

  <c:forEach items="${items}" var="item">
   <tr>
    <td><c:out value="${item.id}"/></td>
    <td><c:out value="${item.iMaster}"/></td>
    <td><c:out value="${item.iCode}"/></td>
    <td><c:out value="${item.iName}"/></td>
    <td><c:out value="${item.iQty}"/></td>
    <td align="center"><a href="edit.html?id=${item.id}">Edit</a> | <a href="delete.html?id=${item.id}">Delete</a></td>
   </tr>
  </c:forEach>
 </table>
</c:if>
 </body>
</html>