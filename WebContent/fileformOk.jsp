<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getRealPath("fileFolder");
	int size = 1024 * 1024 * 5;
	String file = "";
	String oriFile = "";
	
	try {
		MultipartRequest mul = new MultipartRequest(request, path, size, "UTF-8", new DefaultFileRenamePolicy());
		Enumeration files = mul.getFileNames();
		String str = (String)files.nextElement();
		
		file = mul.getFilesystemName(str);
		oriFile = mul.getOriginalFileName(str);
		
	} catch(Exception e){
		e.printStackTrace();
	}
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%= file %> <br>
	<%= oriFile %>
</body>
</html>