<%@ page import="file.FileDAO" %>
<%@ page import="java.io.File" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>  
	<%
	
		String directory = "C:/upload";   //application 전체 프로젝트에 대한 자원 관리 객체.
		int maxSize = 1024 * 1024 * 100;
		String encoding = "UTF-8";
		
		MultipartRequest multipartRequest 
		= new MultipartRequest(request, directory,maxSize, encoding,
				new DefaultFileRenamePolicy());
		
		String fileName = multipartRequest.getOriginalFileName("file");
		String fileRealName = multipartRequest.getFilesystemName("file");
		
		if(!fileName.endsWith(".PNG") && !fileName.endsWith(".hwp") && 
				!fileName.endsWith(".jpg") && !fileName.endsWith(".xls")) {
			File file = new File(directory + fileRealName);
			file.delete();
			
		} else {
		
		new FileDAO().upload(fileName, fileRealName);
		out.write("파일명: " + fileName + "<br>");
		out.write("실제 파일명: " + fileRealName + "<br>");
		}
		%>
</body>
</html>