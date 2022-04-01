<%@page import="DBUtil.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.naming.*,javax.sql.DataSource"
	import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- content를 사용하여서 페이지에 들어왔을떄 0초뒤 지정해둔 url로 가게 설정 -->
<meta charset="UTF-8" http-equiv=refresh content="0;url=Home1.jsp#!/page_MoreC">
<title>예약하기</title>
</head>
<body>
	<%
		String name;
		String stadium;
		String date;
		String CCk;
	%>  
	<%
		request.setCharacterEncoding("UTF-8");
		//1. 드라이버 로드
		Connection con = DBUtil.getConnection();

		//2. DBCP를 사용하여 커넥션 객체 얻기
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		con = DBUtil.getConnection();

		//4. insertForm에서 값 전송 받기
		name = request.getParameter("name");
		stadium = request.getParameter("stadium");
		date = request.getParameter("date");
		CCk = request.getParameter("CCk"); //선재형꺼 보고 생성할떄마다 +1 테이블 생성하기    -> 그다음 이너조인  

		//4. 받은 값으로 sql문 사용(삽입 문)
		String sql = "insert into ticket1(name, stadium, date) values('" + name + "','" + stadium + "','" + date + "')";
		Statement stmt = con.createStatement();

		//5. 질의문 실행
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
	%>
	
	
</body>
</html>