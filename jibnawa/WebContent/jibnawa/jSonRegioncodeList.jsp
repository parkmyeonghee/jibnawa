<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.HashMap,com.google.gson.Gson" %>
<%
	List<HashMap<String,Object>> RegioncodeList = 
	(List<HashMap<String,Object>>)request.getAttribute("RegioncodeList");
	Gson g = new Gson();
	String jsonJibnawa = g.toJson(RegioncodeList);
	out.print(jsonJibnawa);
%>
