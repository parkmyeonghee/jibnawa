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
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script type="text/javascript" src="../js/jquery.min.js"></script>
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
     .table-responsive{
      width: 100%; /* Set width to 100% */
      margin: auto;
      height:60%;
      min-height:100px;
      min-width:100px;
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
  </script>
</head>
<body>


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
		data-options="singleSelect:true,collapsible:true,url:'./getjbSubidList.kosmo',method:'get'">
		<thead>
		<tr>
		<th data-options="field:'MEM_NAME',width:80,align:'center'">구매자</th>
		<th data-options="field:'BID_COST',width:100,align:'center'">희망금액</th>
		<th data-options="field:'MAIN_AREA_NAME',width:80,align:'center'">지역</th>
		<th data-options="field:'SUB_AREA_NAME',width:80,align:'center'">상세지역</th>
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
							<th data-options="field:'ACC_NAME',width:100,align:'center'">낙찰자</th>
							<th data-options="field:'AUC_SUCCESS_DATE',width:100,align:'center'">낙찰날짜</th>
							<th data-options="field:'AUC_SUCCESS_COST',width:100,align:'center'">낙찰비용</th>
							<th data-options="field:'MAIN_AREA_NAME',width:80,align:'center'">지역</th>
							<th data-options="field:'SUB_AREA_NAME',width:100,align:'center'">상세지역</th>
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