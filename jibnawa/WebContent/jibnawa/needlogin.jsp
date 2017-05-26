<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
    <%@ page
	import="java.net.URLDecoder, com.vo.JibnawaMemberVO,java.util.*"%>
	<%@ include file="index.jsp" %>
	<%
	  session.invalidate();
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script language="javascript">
alert("로그인이 필요한 서비스입니다. 메인페이지로 이동합니다.");
location.href="./index.jsp";
</script>	
<title>Insert title here</title>
</head>
<body>



</body>
</html>