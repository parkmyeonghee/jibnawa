<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="shortcut icon" href="../img/favicon.png">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css"
	href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<link rel="stylesheet" type="text/css" href="../axisjui/arongi/page.css">
<link rel="stylesheet" type="text/css"
	href="../axisj/ui/arongi/AXJ.min.css">

<script type="text/javascript" src="../../jquery/jquery.min.js"></script>
<!--script type="text/javascript" src="../../dist/AXJ.min.js"></script-->

<script type="text/javascript" src="../axisj/lib/AXJ.js"></script>
<script type="text/javascript" src="../axisj/lib/AXTopDownMenu.js"></script>
<script type="text/javascript" src="../axisj/lib/AXMobileMenu.js"></script>
<script type="text/javascript" src="../axisj/lib/AXModal.js"></script>
<script type="text/javascript" src="../axisj/lib/AXTab.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<title>����3</title>
<!--���ν�Ÿ��  -->
<style type="text/css">
<style>
{
margin:0;
padding:0;
}
div {
	width: auto;
}

{
float:left;
list-style:none;
margin-right:110px;
}
ul li a {
	color: #898989;
}

ul li :hover {
	color: #f8b62b;
}

table a {
	color: #898989;
}

table :hover {
	color: #f8b62b;
}

.line1 {
	border-bottom: 1px solid #d2d2d2;
}

.line2 {
	border-right: 1px solid green;
}

.line3 {
	border-top: 1px solid #d2d2d2;
}

.line4 {
	border-left: 1px solid green;
}

a {
	text-decoration: none
}
/*���ν�Ÿ�� �� */
/*�̹��� �����̵� ����  */
body {
	margin: 0;
}

#location {
	position: relative;
	width: 1000px;
	height: 200px;
	overflow: hidden;
	white-space: nowrap;
	border: 1px solid #000;
}

#location ul#slider {
	list-style: none;
	margin: 0;
	padding: 0;
}

#location ul li {
	position: absolute;
	width: 500px;
	height: 300px;
}

#location ul li img {
	width: 1000px;
	height: 200px;
}
/*�̹��� �����̵� �� */
/*������  */
.container {
	padding-right: 15px;
	padding-left: 15px;
	margin-right: auto;
	margin-left: auto;
}

@media ( min-width : 768px) {
	.container {
		width: 750px;
	}
}

@media ( min-width : 992px) {
	.container {
		width: 970px;
	}
}

@media ( min-width : 1200px) {
	.container {
		width: 1170px;
	}
}
</style>


<script type="text/javascript">
 function doSearch(){
	 
 }

 //function j_login(){
	 
// }
 //function j_join(){
	 
// }
 
 
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
             url: "login/login.jsp",
             //url:"/samples/AXgrid/index.html",
             pars: "a=1&b=2&c=3".queryToObject(),
             top: 100,
             closeByEscKey: true
         });
     },
     sigin: function () {
         myModal.open({
             url: "login/sigin.jsp",
             //url:"/samples/AXgrid/index.html",
             pars: "a=1&b=2&c=3".queryToObject(),
             top: 100,
             closeByEscKey: true
         });
     },
     //������ ���̴� ��
     TEST: function () {
         myModal.open({
        	 //������ ��ġ
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
</head>
<body>
	<!--
	<div id="container">
		<!-- �α��� �� �˻�â 
		<div  style="width: 100%;" align=center>
				<div id="search" style="width: 40%; float: left;">
					<input class="easyui-searchbox"
						data-options="prompt:'�˻����� �Է�',searcher:doSearch"
						style="width: 350px">
				</div>
				<div style="width: 50%; float: left;">
					<button type="button" class="btn btn-info" id="login"
						onclick="fnObj.login();">�α���</button>
					<button type="button" class="btn btn-info" id="join"
						onclick="fnObj.sigin();">ȸ������</button>
					<br>
				</div>
				</div>
			<br>
			<hr width="100%">
			<!-- �α��� �˻� â �� -->
	<!-- <br> -->
	<!--�̹��� �����̴� ���� -->
	<!-- preloader -->
	<div id="preloader">
		<div class="loder-box">
			<div class="battery"></div>
		</div>
	</div>
	<!-- end preloader -->
	<!--
        Fixed Navigation-->
	<div id="container">
	<div style="width: 100%;" align=center>
	<div class="bs-example" data-example-id="navbar-form">
	<nav class="navbar ">
	<div class="container-fluid">
	<div class="navbar-header">
	<button type="button" style="background-color: black"
				class="navbar-toggle" data-toggle="collapse"
			data-target="#bs-example-navbar-collapse-2" aria-expanded="true">
	<span class="sr-only">Toggle navigation</span> <span
			class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
	<a class="navbar-brand" href="#">Jibnawa</a>
						</div>
						<div class="navbar-collapse collapse in"
							id="bs-example-navbar-collapse-2" aria-expanded="true">
							<form class="navbar-form " style="text-align: center;"ole="search">
								     <div class="form-group form-group--float form-group--active">
                                        <input type="text" class="form-control">
                                    </div>
								<button type="button" class="btn btn-info" id="login"
									style="margin-left: 10%;" onclick="fnObj.login();">�α���</button>
								<button type="button" class="btn btn-info" id="join"
									onclick="fnObj.sigin();">ȸ������</button>
								<button type="button" class="btn btn-info" id="TEST"
									onclick="fnObj.TEST();">TEST</button>	
							</form>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<br>
	<!-- main ���� -->
	<div id="container" align=center>
		<table>
			<tr>
				<td width=500><p align="middle">
					<div id="location" style="margin: auto">
						<ul id="slider">
							<div id="container">
								<li><img src="../img/go.jpg" /></li>
								<li><img src="../img/s.jpg" /></li>
								<li><img src="../img/pi.jpg" /></li>
								<li><img src="../img/pa.jpg" /></li>
							</div> 
						</ul>
					</div> 
					<script type="text/javascript">
						var x = 300;
						var slider = document.getElementById("slider");
						var slideArray = slider.getElementsByTagName("li");
						var slideMax = slideArray.length - 1;
						var curSlideNo = 0;
						
						for (i = 0; i <= slideMax; i++) {
							if (i == curSlideNo) slideArray[i].style.left = 0;
							else slideArray[i].style.left = -x + "px";
						}
						
						slider.addEventListener('click', function () {
							changeSlide();
						}, false);
						
						var aniStart = false;
						var next = 1;
						var changeSlide = function(){
							if (aniStart === true) return;
							next = curSlideNo + 1;
							if (next > slideMax) next = 0;
							aniStart = true;
							sliding();
						}
						
						function sliding() {
							var curX = parseInt(slideArray[curSlideNo].style.left, 10);
							var nextX = parseInt(slideArray[next].style.left, 10);
							var newCurX = curX + 10;
							var newNextX = nextX + 10;
							if (newCurX >= x) {
								slideArray[curSlideNo].style.left = -x + "px";
								slideArray[next].style.left = 0;
								curSlideNo = curSlideNo + 1;
								if (curSlideNo > slideMax) curSlideNo = 0;
								aniStart = false;
								return;
							}
							slideArray[curSlideNo].style.left = newCurX + "px";
							slideArray[next].style.left = newNextX + "px";
							setTimeout(function () {
								sliding();
							}, 20);
						}
						setInterval(changeSlide,2000);
					</script></td>
			</tr>
		</table>
		<br> <br>
	</div>
	<!--�̹��� �����̴� ��-->
	<!--���� ǥ ����-->
	<div id="container">
		<div id="chart"style="width: 100%;height:30%" align=center>
			<div id="container"class="col-md-4">
				<table id="container" class="easyui-datagrid" title="������ �����"
					style="height: 250px; width: 100%;" fitColumns="true"
					data-options="singleSelect:true,collapsible:true,url:'./getjbSubidList.kosmo',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'SUB_AREA_CODE',width:80,align:'center'">��������</th>
							<th data-options="field:'LODG_COM_NAME',width:100,align:'center'">�Ǹ���</th>
							<th data-options="field:'REGION_CODE',width:80,align:'center'">����</th>
							<th data-options="field:'ACC_END_DATE',width:80,align:'center'">������¥</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="chart" class="col-md-4 wow animated fadeInRight animated">
				<table id="container" class="easyui-datagrid" title="������ �����"
					style="height: 250px; width: 100%;float:right" fitColumns="true"
					data-options="singleSelect:true,collapsible:true,url:'./getjbTenderList.kosmo',method:'get'">
					<thead>
						<tr>
							<th data-options="field:'AUC_SUCCESS_DATE',width:80,align:'center'">��������</th>
							<th data-options="field:'AUC_COMM_ID',width:100,align:'center'">������</th>
							<th data-options="field:'AUC_SUCCESS_COST',width:80,align:'center'">����</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</div>
	<br>
	<br>
	<!--���� ǥ ��  -->
	<div style="float: left;margin-right:100px;" id="city" align="center">
		<h3>�̴��� ��õ��ü</h3>
		&nbsp;
		<img src="../img/seoul.jpg" class="img-rounded" onClick="seoul()">
		<img src="../img/busan.jpg" class="img-rounded" onClick="busan()">
		<img src="../img/gyeonggi.jpg" class="img-rounded" onClick="gyeonggi()">
		<img src="../img/incheon.jpg" class="img-rounded"onClick="incheon()">
		<br>
		&nbsp;
		<img src="../img/daegu.jpg" class="img-rounded"onClick="daegu()">
	<img src="../img/gangwon.jpg" class="img-rounded"onClick="gangwon()">
		<img src="../img/jeju.jpg" class="img-rounded"onClick="jeju()">
		<img src="../img/gyeongnam.jpg" class="img-rounded"onClick="gyeongnam()">
		<br>
		&nbsp;
		<img src="../img/gwangju.jpg" class="img-rounded"onClick="gwangju()">
		<img src="../img/daejeon.jpg" class="img-rounded"onClick="daejeon()">
	</div>
	<!-- main �� -->
</body>
</html>