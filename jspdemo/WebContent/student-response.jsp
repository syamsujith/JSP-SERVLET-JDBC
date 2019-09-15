<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student confirmation Form</title>
</head>
<body>
 The student is confirmed: ${param.firstName} ${param.lastName} from ${param.country}  
 <br/>
 knows ${param.favlang}
 <ul>
 	<%
 		String[] langs = request.getParameterValues("favlangu");
 		if(langs != null){
 			for (String temp : langs){
 				out.println("<li>"+ temp +"</li>");
 			}
 		}
 	%>
 </ul>
 <!--  Items entered: <%= request.getParameter("theItem")  %> --> 
 <%
 List<String> items = (List<String>) session.getAttribute("myToDoLists");
 
 if(items == null){
	 items = new ArrayList<String>();
	 session.setAttribute("myToDoLists", items);
 }
 
 String theItem = request.getParameter("theItem");
 if(theItem != null){
	 items.add(theItem);
 }
 %>
 <hr>
 <b>Qualities:</b> <br/>
 
 <ol>
 <%
 for(String temp: items){
	 out.print("<li>" + temp + "</li>");
 }
 
 %>
 </ol>
</body>
</html>