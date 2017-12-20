<%@page import="File.FileDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="File.FileDAO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSP 파일 업로드</title>
</head>
<body>
	<%
		FileDAO fdao = new FileDAO();
		ArrayList<FileDTO> fileList = fdao.getList();
	
		for(FileDTO file : fileList) {
			out.write("<a href=\"" + request.getContextPath() + "/downloadAction?file="
				+ java.net.URLEncoder.encode(file.getFileRealName(), "UTF-8") + "\">" + 
					file.getFileName() + "(다운로드 횟수: " + file.getDownloadCount() + ")</a><br>"); 
		}
	%>
</body>
</html>