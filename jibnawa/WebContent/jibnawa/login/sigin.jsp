<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.net.URLDecoder"%>
<%
	boolean sigin = false;
	String cname = null;//서버에서 로컬 PC에 저장해둔 쿠키 문서에서 읽어온 사용자 이름을 담을 변수
	boolean mailChk = false;//서버에서 로컬 PC에 저장해둔 쿠키 문서에서 읽어온 사용자 이름을 담을 변수
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
				cookies[j].setMaxAge(0);                 //쿠키 유지기간을 0으로함
				cookies[j].setPath("/");                    //쿠키 접근 경로 지정
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
				alert("에러발생");
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
	//		$("#mail_chk").submit();//전송 index.jsp -> MemberFrontController(doService:logout.mfc식별)			
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
//로그인을 하기 전 화면
//쿠키에서 읽어온 이름이 없니?
	//if(cname ==null)
	//{
		if(mailChk==false||cname==null ){
%> 					<div class="login">
                            <h1>메일확인</h1>
                            <form id="mail_chk" name="login-form" onsubmit="">
                                 <p><input type="text" name="mem_email" value="" placeholder="Email"></p>
                                 <p><input type="submit"onclick="b_search()" name="mail_chk_btn" value="메일확인"></p>
                            </form>
                        </div>

                 
	<%
	
		}else if(mailChk==true||cname!=null){ %>
						<div class="login">
                            <h1>회원가입</h1>
                            <form id="sigin" name="login-form" onsubmit="">
                            	<p><input type="text" name="mem_email" value="" placeholder="Email"></p>
   								<p><input type="password" name="mem_pw" value="" placeholder="password"></p>
								<p><input type="text" name="mem_name" value="" placeholder="Name"></p>
								<p><input type="text" name="mem_nickname" value="" placeholder="Nickname"></p>

                                    <p><input type="tel"name="mem_phone_f" size="4" placeholder="Hp">-
                                    <input type="tel"  name="mem_phone_m"  size="4" value="" >-
                                    <input type="tel"  name="mem_phone_e"  size="4" value="" ></p>

                               <select name="mem_div">
										<option value="m">회원</option>
										<option value="c">업체</option>
										<option value="a">관리자</option>
								</select>
								<p class="submit"><input type="submit"onclick="sigin()" name="sigin_btn" value="회원가입"></p>
                            </form>

	<%}%>

</body>
</html>