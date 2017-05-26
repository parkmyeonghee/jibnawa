<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page
	import="java.net.URLDecoder, com.vo.JibnawaMemberVO,java.util.*"%>
<%!	 
	 public String mem_email=null;	
	 public String mem_div =null; 
	 public String mem_nickname =null;
	 public JibnawaMemberVO jm=new JibnawaMemberVO();
	 public Map userInfo =null;
%>

	 <% 
		jm= (JibnawaMemberVO)session.getAttribute("login");%>
		
			
		<% 
		String mem=null;
		if(jm!=null){
			switch (jm.getMem_div().trim()){
			case "a" :
				mem_div="a";
			break;
			case "c" :
				mem_div="c";
			break;
			case "m" :
				mem_div="m";
			break;
				}
			mem_nickname=jm.getMem_nickname();
			%>
			 <script type="text/javascript">
			 myModal.close('modalDiv01');
			 </script><%
		}else{
				mem_email=null;	
			 	mem_div =null; 
			  	mem_nickname =null;
		 		jm=null;

			
		}
			%>
				 
<!DOCTYPE html>
<html lang="en">
<head>
  <title>jibnawa</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../axisjui/arongi/page.css">
<link rel="stylesheet" type="text/css"
	href="../axisj/ui/arongi/AXJ.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../js/jquery.min.js"></script>
 <script type="text/javascript" src="../axisj/lib/AXJ.js"></script>
<script type="text/javascript" src="../axisj/lib/AXTopDownMenu.js"></script>
<script type="text/javascript" src="../axisj/lib/AXMobileMenu.js"></script>
<script type="text/javascript" src="../axisj/lib/AXModal.js"></script>
<script type="text/javascript" src="../axisj/lib/AXTab.js"></script>

<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<link rel="shortcut icon" href="../img/favicon.png">


<link rel="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js">
<link rel="https://cdn.datatables.net/1.10.13/js/dataTables.bootstrap.min.js">
<link rel="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="https://cdn.datatables.net/1.10.13/css/dataTables.bootstrap.min.css">

<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/demo/demo.css">  
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .row{
    margin:0 auto;
    }
    .carousel-inner img {
      width: 100%; /* Set width to 100% */
      margin: auto;
      height:60%;
      min-height:200px;
      min-width:400px;
  }
  /* Hide the carousel text when the screen is less than 600 pixels wide */
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  #container div{
  width:300px;
  background:#fff;
  padding 15px;
  padding-bottom:15px;
  margin:15px;
  }
  #container div img{
  width:100%;
  padding-bottom:15px;
  margin-bottom:5px;
  }
/* 검색창*/
.search-form .form-group {
  float: right !important;
  transition: all 0.35s, border-radius 0s;
  width: 32px;
  height: 32px;
  background-color: #fff;
  box-shadow: 0 1px 1px rgba(0, 0, 0, 0.075) inset;
  border-radius: 25px;
  border: 1px solid #ccc;
}
.search-form .form-group input.form-control {
  padding-right: 20px;
  border: 0 none;
  background: transparent;
  box-shadow: none;
  display:block;
}
.search-form .form-group input.form-control::-webkit-input-placeholder {
  display: none;
}
.search-form .form-group input.form-control:-moz-placeholder {
  /* Firefox 18- */
  display: none;
}
.search-form .form-group input.form-control::-moz-placeholder {
  /* Firefox 19+ */
  display: none;
}
.search-form .form-group input.form-control:-ms-input-placeholder {
  display: none;
}
.search-form .form-group:hover,
.search-form .form-group.hover {
  width: 100%;
  border-radius: 4px 25px 25px 4px;
}
.search-form .form-group span.form-control-feedback {
  position: absolute;
  top: -1px;
  right: -2px;
  z-index: 2;
  display: block;
  width: 34px;
  height: 34px;
  line-height: 34px;
  text-align: center;
  color: #3596e0;
  left: initial;
  font-size: 14px;
}



  </style>
<script type="text/javascript">
 function doSearch(){
	 
 }
 var pageID = "AXModal";
 var myModal = new AXModal();
 var fnObj = {
	     pageStart: function () {
	         myModal.setConfig({
	            windowID: "myModalCT", width: 740,
	             mediaQuery: {
	                 mx: {min: 0, max: 767}, dx: {min: 767}
	             },
	             displayLoading: true,
	             scrollLock: true
	         });
	     },
	     login: function () {
	         myModal.open({
	            modalID:"modalDiv01",
	            targetID:"modalContent",
	             url: "login/login.jsp",
	             
	             //url:"/samples/AXgrid/index.html",
	             pars: "a=false".queryToObject(),
	             width: 350,
	             top: 100,
	             closeByEscKey: true,
	             options : function getReturnValue() {  

	             },
	             onclose: function(){
	   
	             }
	         });
	         
	     },
	     adminPage: function () {
	        //Map adminPage = new HashMap();
	       //userInfo.put("page", "adminMain");
	       //request.setAttribute("adminPage", adminPage);
	     },
	     sigin: function () {
	         myModal.open({
	             url: "login/sigin.jsp",
	             //url:"/samples/AXgrid/index.html",
	             pars: "a=false".queryToObject(),
	             width: 350,
	             top:100,
	             closeByEscKey: true,
	             close: function close(){
	                window.location.reload(true);
	             }
	         });
	     },
	     close: function () {
	        myModal.close('modalDiv01');
	     },
	    
	     acc_list: function () {
	         myModal.open({
	            //페이지 위치
	             url: "../jibnawa/jibnawaMember.jsp",
	             //url:"/samples/AXgrid/index.html",
	             pars: "a=1&b=2&c=3".queryToObject(),
	             top: 100,
	             width:800,
	             closeByEscKey: true
	         });
	     }};

     function adminMainPage(){
      $.ajax({
        type : "POST",
        url : "./admin/adminMain.jsp",
        dataType : "html",
        error : function() {
          alert('통신실패!!');
        },
        success : function(data) {
          $('#Context').html(data);
      
        }
 
      });
      $.ajax({
	        type : "POST",
	        url : "./admin/jibnawaMember.kosmo",
	        dataType : "text",
	        error : function() {
	          alert('통신실패!!');
	        },
	        success : function(data) {
	          $('#dropdowns').html(data);
	        } 
	      });
    }
     
     function rauction(){


    	 location.href = "./RauctionView.kosmo"
    	 
       }
     function mypage(){
    	 
    	 
    	 
    	 
    	 
         $.ajax({
           type : "POST",
           url : "./getauctionSebuList.jsp",
           dataType : "html",
           error : function() {
             alert('통신실패!!');
           },
           success : function(data) {

             $('#Context').html(data);
           }
         });
       }
     
     function accInfoIns(){
         $.ajax({
           type : "POST",
           url : "./accInfoIns2.kosmo",
           dataType : "html",
           error : function() {
             alert('통신실패!!');
           },
           success : function(data) {
             $('#Context').html(data);
           }
         });
       }
     
     function fastAuction(){
         $.ajax({
             type : "POST",
             url : "./test.jsp",
             dataType : "html",
             error : function() {
               alert('통신실패!!');
             },
             success : function(data) {
               $('#Context').html(data);
             }
           });   	 
     }
     
     function auction(){
         $.ajax({
             type : "POST",
             url : "./searchAdd.jsp",
             dataType : "html",
             error : function() {
               alert('통신실패!!');
             },
             success : function(data) {
               $('#Context').html(data);
             }
           });   	 
     }
   
    
     function logOut(){
    	 alert("로그아웃");
    	 location.href="./login/logOut.jsp"; 
    	 window.location.reload(true);    	
     }
</script>

<%	String login1=(String)request.getAttribute("loginChk");
if(login1=="true"){%>
	<script type="text/javascript">
	 var myModal = new AXModal();
	</script>
<%}%>
<% if(mem_div=="c"){%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid" >
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#" >Jibnawa</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a onclick="main()">Home</a></li>
        <li><a href="#" onclick="rauction()">입찰</a></li>
        <li><a href="#" onclick="accInfoIns()">내 업체 정보 입력</a></li>
         <li><a href="./QandA.jsp"onclick="">게시판</a></li>
        <li class="">
        <form action="" class="search-form">
                <div class="form-group has-feedback">
            		<label for="search" class="sr-only">Search</label>
            		<input type="text" class="form-control" name="search" id="search" placeholder="search">
              		<span class="glyphicon glyphicon-search form-control-feedback"></span>
            	</div>
            </form>
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a type="" class="" id="login" ><%= mem_nickname %>회원 님</a></li>
         <li><a href="./login/logOut.jsp" onclick=""><span id="join" class="glyphicon glyphicon-user"></span> LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>

	 <% }else if(mem_div=="m"){%>
		<nav class="navbar navbar-inverse">
  			<div class="container-fluid">
    			<div class="navbar-header">
      				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>
        				<span class="icon-bar"></span>                        
      				</button>
      				<a class="navbar-brand"  >Jibnawa</a>
    			</div>
    			<div class="collapse navbar-collapse" id="myNavbar">
      				<ul class="nav navbar-nav">
        				<li class="active"><a onclick="main()">Home</a></li>
        				<li><a href="#" onclick="auction()">경매시작</a></li>
        				<li><a href="#" onclick="mypage()">나의 경매</a></li>
        				 <li><a href="./QandA.jsp"onclick="">게시판</a></li>
        				<li class="">
        				<form action="" class="search-form">
                		<div class="form-group has-feedback">
            				<label for="search" class="sr-only">Search</label>
            				<input type="text" class="form-control" name="search" id="search" placeholder="search">
              				<span class="glyphicon glyphicon-search form-control-feedback"></span>
            			</div>
            			</form>
        				</li>
      				</ul>
      		<ul class="nav navbar-nav navbar-right">    
        <li><a type="" class="" id="login" ><%= mem_nickname %>회원 님</a></li>
        <li><a href="./login/logOut.jsp" onclick=""><span id="join" class="glyphicon glyphicon-user"></span> LogOut</a></li>
      </ul>
    </div>
  </div>
</nav>
 <% }else if(mem_div=="a"){%>
 	<nav class="navbar navbar-inverse">
 	 <div class="container-fluid">
   	 	<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>                        
      		</button>
      		<a class="navbar-brand" href="javascript:window.location.reload(true);">Jibnawa</a>
    	</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#" onclick="main()">Home</a></li>
        <li><a href="#"onclick="adminMainPage()" name = "adminPage">관리자 메뉴</a></li>
        <li><a href="./QandA.jsp"onclick="" name = "">게시판</a></li>
        	<li class="">
        		<form action="" class="search-form">
                	<div class="form-group has-feedback">
            			<label for="search" class="sr-only">Search</label>
            			<input type="text" class="form-control" name="search" id="search" placeholder="search">
              			<span class="glyphicon glyphicon-search form-control-feedback"></span>
            		</div>
            	</form>
        	</li>
      	</ul>
      		<ul class="nav navbar-nav navbar-right">
        		    <li><a type="" class="" id="login" ><%= mem_nickname %>관리자 님</a></li>
        			 <li><a href="./login/logOut.jsp" onclick=""><span id="join" class="glyphicon glyphicon-user"></span> LogOut</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
 <%}else{ %>
  	<nav class="navbar navbar-inverse">
 	 <div class="container-fluid">
   	 	<div class="navbar-header">
      		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>
        		<span class="icon-bar"></span>                        
      		</button>
      		<a class="navbar-brand" href="javascript:window.location.reload(true);">Jibnawa</a>
    	</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#" onclick="main()">Home</a></li>
        <li><a href="#"onclick="fastAuction()">빠른경매</a></li>
         <li><a href="./QandA.jsp"onclick="">게시판</a></li>
        	<li class="">
        		<form action="" class="search-form">
                	<div class="form-group has-feedback">
            			<label for="search" class="sr-only">Search</label>
            			<input type="text" class="form-control" name="search" id="search" placeholder="search">
              			<span class="glyphicon glyphicon-search form-control-feedback"></span>
            		</div>
            	</form>
        	</li>
      	</ul>
      		<ul class="nav navbar-nav navbar-right">
        		<li><a href="#" onclick="fnObj.login()"><span id="login"  class="glyphicon glyphicon-log-in"></span> Login</a></li>
        		<li><a href="#" onclick="fnObj.sigin()"><span id="join" class="glyphicon glyphicon-user"></span> Join</a></li>
      			</ul>
    		</div>
  		</div>
	</nav>
 <%}%>

