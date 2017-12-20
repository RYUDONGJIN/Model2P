<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String realfolder="";
	String savefolder="/upload";
	String encType = "UTF-8";
	int size = 1024 * 1024 * 10;
	
	ServletContext context = request.getServletContext();
	realfolder = context.getRealPath(savefolder);
	
	try {
		MultipartRequest multi = new MultipartRequest(request, realfolder, size, encType, new DefaultFileRenamePolicy());
		out.println(realfolder);
	}catch(Exception e){
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
</body>
</html>