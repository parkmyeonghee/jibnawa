<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List,java.util.Map" %>
<%@ page import="com.google.gson.Gson" %>
<%
	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
	Gson g = new Gson();
	String jsonBoard = g.toJson(boardList);//리스트로 받은걸 꺼내서 String형태로 쭉 열거해주는 메소드
	out.print(jsonBoard);
%>