<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>WelCome</title>
  </head>
  <body>
    <h2>WelCome</h2>
    <h2>1. <a href="items.html">List of Items</a></h2>
    <h2>2. <a href="add.html">Add Item</a></h2>
  </body>
  
  <script>  
var request=new XMLHttpRequest();  
function searchInfo(){  
var name=document.vinform.name.value;  
var url="find.jsp?val="+name;  
  
try{  
			request.onreadystatechange=function(){  
			
				if(request.readyState==4){  
				var val=request.responseText;  
				document.getElementById('iName').innerHTML=val;  
				}  
			}  

	request.open("GET",url,true);  
	request.send();  
	}
	catch(e){alert("Unable to connect to server");}  
	}  
</script>  


<h2>3. Search Item</h2>  
<form name="vinform">  
	<input type="text" name="name" placeholder="Enter Item Name" onkeyup="searchInfo()">  
</form>  
  
<span id="iName"></span>  
</html>