
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.util.List" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
List<String> nameList =(List<String>) session.getAttribute("nameList2");
if(nameList!=null){
for(String name:nameList){
	out.print("�̸�:"+name+"<br>");
	}
}else{
	out.print("�� nameList[List<String>]�� ���� �� �� �����ϴ�.");
}
/* DeptVO dVO =(DeptVO) request.getAttribute("dVO");
out.print(dVO.getDeptno());
out.print(dVO.getDname());
out.print(dVO.getLoc());
 */
%>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
hello5.jsp �Դϴ�
</body>
</html>