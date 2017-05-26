<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.net.URLDecoder, com.vo.JibnawaMemberVO"%>
<% JibnawaMemberVO login = (JibnawaMemberVO)session.getAttribute("login"); %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

   <!-- META -->
 	<link rel="stylesheet" href="../../css/style.css">
    <script type="text/javascript" src="http://cdno.axisj.com/axisj/jquery/jquery.min.js"></script>



<style type="text/css">
.modalProgramTitle {
	height: 49px;
	line-height: 49px;
	color: #282828;
	font-size: 14px;
	font-weight: bold;
	padding-left: 15px;
	border-bottom: 1px solid #ccc;
}

.modalButtonBox {
	padding: 10px;
	border-top: 1px solid #ccc;
}
</style>
<script>
    /**
     * Require Files for AXISJ UI Component...
     * Based		: jQuery
     * Javascript 	: AXJ.js, AXModal.js
     * CSS			: AXJ.css
     */
    var pageID = "AXModal";
    var myModal = new AXModal();
	function test(){
		$("#login").attr("method","POST");
		$("#login").attr("action","./login.do");
		$("#login").submit();	
	}
</script>

<%if(login==null){ %>

    <div class="login">
      <h1>로그인</h1>
     <form id="login" name="login-form" onsubmit="">
        <p><input type="text" name="mem_email"  value="" placeholder="Email"></p>
        <p><input type="password"name="mem_pw"value="" placeholder="Password"></p>

        <p class="submit"><input type="submit" onclick="test()" name="commit" value="Login"></p>
      </form>
    </div>

<% }else{%>
<script type="text/javascript">	
			parent.location.reload();
		</script>
<%  }%>



