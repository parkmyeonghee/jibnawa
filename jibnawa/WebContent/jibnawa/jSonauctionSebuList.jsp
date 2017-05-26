<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.List,java.util.HashMap"%>
<%@page import="com.google.gson.Gson"%>
<%
List<HashMap<String,Object>> auctionSebuList =(List<HashMap<String,Object>>)request.getAttribute("auctionSebuList");
Gson g = new Gson();
String jSonauctionSebuList= g.toJson(auctionSebuList);
out.print(jSonauctionSebuList);
%>