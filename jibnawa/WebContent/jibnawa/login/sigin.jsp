<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLDecoder"%>
<%
	boolean sigin = false;
	String cname = null;//�������� ���� PC�� �����ص� ��Ű �������� �о�� ����� �̸��� ���� ����
	boolean mailChk = false;//�������� ���� PC�� �����ص� ��Ű �������� �о�� ����� �̸��� ���� ����
	Cookie[] cookies = request.getCookies();
	if(cookies !=null && cookies.length > 0){
		for(int i=0;i<cookies.length;i++){
			if("cname".equals(cookies[i].getName())){
				cname = URLDecoder.decode(cookies[i].getValue(),"utf-8");
			}
			if("mailChk".equals(cookies[i].getName())){
				String mail = URLDecoder.decode(cookies[i].getValue(),"utf-8");
				mailChk= Boolean.valueOf(mail).booleanValue();
				
			}
			if("sigin".equals(cookies[i].getName())){
				String siginChk = URLDecoder.decode(cookies[i].getValue(),"utf-8");
				sigin= Boolean.valueOf(siginChk).booleanValue();
				if(sigin==true){ 
					for(int j=0;j<cookies.length;j++){
				cookies[j].setMaxAge(0);                 //��Ű �����Ⱓ�� 0������
				cookies[j].setPath("/");                    //��Ű ���� ��� ����
				response.addCookie(cookies[j]);
				}
					cname=null;
					mailChk = false;
				%>
				
					<script type="text/javascript">
						parent.myModal.close();
					</script>
				<%}
			}
		}
	}
	%>
<html>
<head>
    <script type="text/javascript" src="http://cdno.axisj.com/axisj/jquery/jquery.min.js"></script>
	<link rel="stylesheet" href="../../css/style.css">
<title>SIGIN</title>
<script type="text/javascript">
//function sigin(){ 
//	$("#sigin_form").attr("method","post");
//	$("#sigin_form").attr("action","./sigin.do");
//	$("#sigin_form").submit();
	//	alert("==========================");
	/*
		var str = $("#sigin_form").serialize();
		alert(str);

		$.ajax({
			type:"POST",
			url:"./sigin.do",
			contentType: "application/x-www-form-urlencoded; charset=utf-8",
			data: str,
			datatype:"json",
			success: function(data) {
				alert(data.result);			
			},
			error: function(e) {
				alert("�����߻�");
			}			
		});
		*/

//}
</script>
</head>
<body>
	<script type="text/javascript">
	
	//$(document).ready(function (){
	//		$("#mail_chk_btn").click(function (){
	//			alert("============");
	//		$("#mail_chk").attr("method","get");
	//		$("#mail_chk").attr("action","./sigin.do");
	//		$("#mail_chk").submit();//���� index.jsp -> MemberFrontController(doService:logout.mfc�ĺ�)			
	//	});
	//});
		function b_search(){
		$("#mail_chk").attr("method","POST");
		$("#mail_chk").attr("action","./sigin.do");
		$("#mail_chk").submit();		
	}
		function sigin(){
			$("#sigin").attr("method","POST");
			$("#sigin").attr("action","./sigin.do");
			$("#sigin").submit();		
		}
</script>
	<%
//�α����� �ϱ� �� ȭ��
//��Ű���� �о�� �̸��� ����?
	//if(cname ==null)
	//{
		if(mailChk==false||cname==null ){
%> 					<div class="login">
                            <h1>����Ȯ��</h1>
                            <form id="mail_chk" name="login-form" onsubmit="">
                                 <p><input type="text" name="mem_email" value="" placeholder="Email"></p>
                                 <p><input type="submit"onclick="b_search()" name="mail_chk_btn" value="����Ȯ��"></p>
                            </form>
                        </div>

                 
	<%
	
		}else if(mailChk==true||cname!=null){ %>
						<div class="login">
                            <h1>ȸ������</h1>
                            <form id="sigin" name="login-form" onsubmit="">
                            	<p><input type="text" name="mem_email" value="" placeholder="Email"></p>
   								<p><input type="password" name="mem_pw" value="" placeholder="password"></p>
								<p><input type="text" name="mem_name" value="" placeholder="Name"></p>
								<p><input type="text" name="mem_nickname" value="" placeholder="Nickname"></p>

                                    <p><input type="tel"name="mem_phone_f" size="4" placeholder="Hp">-
                                    <input type="tel"  name="mem_phone_m"  size="4" value="" >-
                                    <input type="tel"  name="mem_phone_e"  size="4" value="" ></p>

                               <select name="mem_div">
										<option value="m">ȸ��</option>
										<option value="c">��ü</option>
										<option value="a">������</option>
								</select>
								<p class="submit"><input type="submit"onclick="sigin()" name="sigin_btn" value="ȸ������"></p>
                            </form>

	<%}%>

</body>
</html>