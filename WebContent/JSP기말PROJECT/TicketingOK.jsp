<%@page import="DBUtil.DBUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="javax.naming.*,javax.sql.DataSource"
	import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<!-- content를 사용하여서 페이지에 들어왔을떄 0초뒤 지정해둔 url로 가게 설정 -->
<meta charset="UTF-8" http-equiv=refresh content="0;url=Home1.jsp#!">
<title>Insert title here</title>
</head>
<body>
	<%
		String personnel;
		String seat;
	%>
	<%
		request.setCharacterEncoding("UTF-8");
		//1. 드라이버 로드
		Connection con = null;

		//2. DBCP를 사용하여 커넥션 객체 얻기
		Context initCtx = new InitialContext();
		Context envCtx = (Context) initCtx.lookup("java:comp/env");

		con = DBUtil.getConnection();
  
		//4. insertForm에서 값 전송 받기
		personnel = request.getParameter("output");
		seat = request.getParameter("input");

		//4. 받은 값으로 sql문 사용(삽입 문)
		String sql = "insert into ticket2(personnel, seat) values('" + personnel + "','" + seat + "')";
		Statement stmt = con.createStatement();

		//5. 질의문 실행
		PreparedStatement ps = con.prepareStatement(sql);
		ps.execute();
	%>
	
	<!--
	<form action="Home1.jsp#!/page_MoreC" name="mmyForm" method="post">	
		<input type="text" name="name" value="<%//=seat%>"/>
		<input type="submit" value="이 페이지 없애고 바로가고싶어요 ㅠ"  />
	</form>
	-->

</body>
</html>