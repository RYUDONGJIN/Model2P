<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	int i=3;

	out.println("i = " + i);
	
	request.setAttribute("ia", "4");
%>
	<p>
	i = <%= i%> <br>
	<%= "3" + 4%>
	<p>
	i = ${ia +  4} 
	<!-- EL은 객체의 값을 읽음, 자동형변환 -->
</body>
</html>