<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
    <%@ page
	import="java.net.URLDecoder, com.vo.JibnawaMemberVO,java.util.*"%>
	<%@ include file="index.jsp" %>
	<%
	  session.invalidate();
		session.setMaxInactiveInterval(0);
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
alert("로그아웃 합니다. \n즐거운하루 되십시요.");
location.href="./index.jsp";
</script>	
<title>Insert title here</title>
</head>
<body>



</body>
</html>