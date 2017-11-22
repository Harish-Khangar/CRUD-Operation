<%@ page import="java.sql.*" %>  
<%  
String name=request.getParameter("val");  
if(name==null||name.trim().equals("")){  
		out.print("<p>Please enter name!</p>");  
	}

	else{  
			try{  
					Class.forName("oracle.jdbc.driver.OracleDriver");  
					Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","hash15429");  
					PreparedStatement ps=con.prepareStatement("select * from Item22 where itemname like '"+name+"%'");  
					ResultSet rs=ps.executeQuery();  
					  
					if(!rs.isBeforeFirst()) {      
					 		out.println("<p>No Record Found!</p>");   
					}
					else{  
							out.print("<table border='1' cellpadding='2' width='100%'>");  
							out.print("<tr> <th>Item ID</th><th>Item Master</th><th>Item Code</th><th>Item Name</th> <th>Item Qty</th></tr>");  
							while(rs.next()){  
								out.print("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td> <td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");  
							}  
							out.print("</table>");  
					}  
					
					con.close();  
			}catch(Exception e){out.print(e);}  
	} 
%>  