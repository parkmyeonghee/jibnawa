<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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

  <script type="text/javascript">
 
  
  $('#login').click(function(){
	    fnObj.login();
	    });
 
 var pageID = "AXModal";
 var myModal = new AXModal();
 var fnObj = {
     pageStart: function () {
         myModal.setConfig({
             windowID: "myModalCT", width: 340,
             mediaQuery: {
                 mx: {min: 0, max: 367}, dx: {min: 367}
             },
             displayLoading: true,
             scrollLock: true
         });
     },
     login: function () {
 
         myModal.open({
             url: "main/login/login.jsp",
             //url:"/samples/AXgrid/index.html",
             pars: "a=1&b=2&c=3".queryToObject(),
             top: 100,
             closeByEscKey: true
         });
     },
     sigin: function () {
         myModal.open({
             url: "main/login/sigin.jsp",
             //url:"/samples/AXgrid/index.html",
             pars: "a=1&b=2&c=3".queryToObject(),
             top: 100,
             closeByEscKey: true
         });
     },
     //페이지 붙이는 곳
     TEST: function () {
         myModal.open({
        	 //페이지 위치
             url: "../jibnawa/jibnawaMember.kosmo",
             //url:"/samples/AXgrid/index.html",
             pars: "a=1&b=2&c=3".queryToObject(),
             top: 100,
             width:800,
             closeByEscKey: true
         });
     }
 };
 
	
	
	
 jQuery(document.body).ready(function () {
     fnObj.pageStart()
 });
 </script>
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
  $(document).ready(function() {
    $('#example').DataTable();
	$('[data-toggle="tooltip"]').tooltip(); 
	});

  </script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
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
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">빠른검색</a></li>
        <li><a href="#">경매시작</a></li>
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
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
  <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <img src="../img/sin.jpg">
        <div class="carousel-caption">
          <h3>이달의 추천 업체</h3>
        </div>      
      </div>
      <div class="item">
        <img src="../img/lotte.JPG">
        <div class="carousel-caption">
          <h3>이달의 추천 업체</h3>
        </div>      
      </div>
      <div class="item">
        <img src="../img/car.png">
        <div class="carousel-caption">
          <h3>이달의 추천 업체</h3>
        </div>      
      </div>
    </div>     
    <!-- Left and right controls -->
   <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
</div> 
<!-- 낙찰표 -->
<br><br>
<div class="container">
<div class="row">
  <div class="col-md-6 wow animated fadeInRight animated">
	<table id="container" class="easyui-datagrid" title="입찰중 역경매"
		style="height: 250px; width: 100%;float:right" fitColumns="true" align="center"
		data-options="singleSelect:true,collapsible:true,url:'./getjbTenderList.kosmo',method:'get'">
		<thead>
		<tr>
		<th data-options="field:'ACC_CODE',width:80,align:'center'">낙찰유무</th>
		<th data-options="field:'AUC_COMM_ID',width:100,align:'center'">낙찰자</th>
		<th data-options="field:'MAIN_AREA_NAME',width:80,align:'center'">지역</th>
		<th data-options="field:'AUC_END_DATE',width:80,align:'center'">마감날짜</th>
		</tr>
		</thead>
		</table>
		</div>
		<div  class="col-md-6 wow animated fadeInRight animated">
				<table id="container" class="easyui-datagrid" title="낙찰된 역경매"
					style="height: 250px; width: 100%;float:right" fitColumns="true" align="center"
					data-options="singleSelect:true,collapsible:true,url:'./getjbTenderList.kosmo',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'AUC_COMM_ID',width:100,align:'center'">낙찰자</th>
							<th data-options="field:'MAIN_AREA_NAME',width:80,align:'center'">지역</th>
						</tr>
					</thead>
				</table>
				</div>
			</div>
<br><br>
	<!--지역별 숙소  -->
	
<div class="row">
<table class="table-responsive">
<tr>
<td><a href="./seoul.jsp" data-toggle="tooltip" title="서울"  data-placement="top">
	<img src="../img/seoul.jpg" class="img-rounded" onClick="seoul()">
	</a></td>
<td><img src="../img/busan.jpg" class="img-rounded" onClick="busan()"></td>
<td><img src="../img/gyeonggi.jpg" class="img-rounded" onClick="gyeonggi()"></td>
<td><img src="../img/incheon.jpg" class="img-rounded"onClick="incheon()"></td>
</tr>
<tr>
<td><img src="../img/daegu.jpg" class="img-rounded"onClick="daegu()"></td>
<td><img src="../img/gangwon.jpg" class="img-rounded"onClick="gangwon()"></td>
<td><img src="../img/jeju.jpg" class="img-rounded"onClick="jeju()"></td>
<td><img src="../img/gyeongnam.jpg" class="img-rounded"onClick="gyeongnam()"></td>
</tr>
<tr>
<td><img src="../img/gwangju.jpg" class="img-rounded"onClick="gwangju()"></td>
<td><img src="../img/daejeon.jpg" class="img-rounded"onClick="daejeon()"></td>
	</tr>
</table>
</div>
</div>
</body>
</html>