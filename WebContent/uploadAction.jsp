<%@page import="java.util.Enumeration"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="File.FileDAO"%>
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
		String directory = "C:/CodeLab/JSP/upload/";
		int maxSize = 1024 * 1024 * 100;
		String enctype = "UTF-8";
		
		MultipartRequest multi = new MultipartRequest(request, directory, maxSize, enctype, new DefaultFileRenamePolicy());
		
		Enumeration fileNames = multi.getFileNames();
		while(fileNames.hasMoreElements()){
			String parameter = (String)fileNames.nextElement();
			//실제 사용자가 업로드 하고자한 파일이름
			String fileName = multi.getOriginalFileName(parameter); 
			//실제로 서버에 업로드가된 파일 시스템 이름
			String fileRealName = multi.getFilesystemName(parameter);
			//파일네임이 널일때는 처리안하고 진행됨
			if(fileName == null) continue;
			
			if(!fileName.endsWith(".doc") && !fileName.endsWith(".hwp") &&
					!fileName.endsWith(".pdf") && !fileName.endsWith(".xls")){
				File file = new File(directory + fileRealName);
				file.delete();
				out.write("업로드할 수 없는 확장자 입니다.<br>");
			} else {
				FileDAO fdao = new FileDAO();
				fdao.upload(fileName, fileRealName);
				out.write("파일명: " + fileName + "<br>");
				out.write("실제 파일명: " + fileRealName + "<br>");	
			}
		}
	%>	
</body>
</html>







