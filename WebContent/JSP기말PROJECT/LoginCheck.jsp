<%@page import="org.apache.tomcat.jni.User"%>
<%@page import="user.userDAO"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="DBUtil.DBUtil"%>
<%@page import="java.sql.Connection"%>
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
   request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("checkEmail");
   String pwd = request.getParameter("checkPWD");
   
   Connection con = DBUtil.getConnection();
   
   String sql = "select count(*) as cnt from member where email=?";  //카운트 찾아서 
   PreparedStatement psmt = con.prepareStatement(sql);
   psmt.setString(1, id);
   ResultSet rs = psmt.executeQuery();
   String pass;
   rs.next();
   
   String sqq = "select name from member where email=?"; //DB에서 로그인한 사용자의 이름 값 찾기
   PreparedStatement psm = con.prepareStatement(sqq);
   psm.setString(1, id);
   ResultSet rr = psm.executeQuery();
   String pas;
   rr.next();
   
   

   
   if(rs.getString("cnt").equals("1")){
      
      out.println("<script>");
      out.println("alert('로그인 되었습니다.')");		
      session.setAttribute("sessionUser",id);
      session.setAttribute("name",rr.getObject("name"));
      response.sendRedirect("Home1.jsp");
      out.println("</script>");
 
   }
   else {
      out.println("<script>");
      out.println("alert('정보가 일치하지 않습니다.')");      //정보가 일치 하지 않으면 로그인 화면으로 되돌아 감.
      response.sendRedirect("LoginPage.jsp");
      out.println("</script>");
   }

%>



</body>
</html>