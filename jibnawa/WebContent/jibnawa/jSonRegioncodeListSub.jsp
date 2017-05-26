<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.HashMap,com.google.gson.Gson" %>
<%
	List<HashMap<String,Object>> RegioncodeListSub = 
	(List<HashMap<String,Object>>)request.getAttribute("RegioncodeListSub");
	Gson g = new Gson();
	String jsonJibnawa = g.toJson(RegioncodeListSub);
	out.print(jsonJibnawa);
%>
