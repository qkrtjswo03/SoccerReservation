<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="dao" class="board.DAO"/>
<jsp:useBean id="vo" class="board.VO"/>   
<jsp:setProperty name="vo" property="*" />
			
<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	boolean ch = dao.checkPassword(vo, idx);
	if(ch) {
			dao.delete(idx);
		%>
			<script language=javascript>
				self.window.alert("�ش� ���� �����Ͽ����ϴ�.");
				location.href="Home1.jsp?pg=<%=pg%>";
			</script>
		<%
	} else {
		%>
			<script language=javascript>
				self.window.alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				location.href="javascript:history.back()";
			</script>
		<%
	}
%>
