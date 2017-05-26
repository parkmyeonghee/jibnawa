<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">   
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>

<style>
	.img{
	margin:0 auto;
	max width:100%;
	}
    .row{
    margin:0 auto;
    }
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 70%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 780px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
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
  max-height:400px;
  padding-bottom:15px;
  margin-bottom:5px;
  }
  </style>
<script type="text/javascript">
	var mainLocal = " ";
	var subLocal = " ";
function f_submit(){
	
	
	alert(mainLocal);
	alert(subLocal);
	
	var memNum = $("#memNum").val();
	var bidCost = $("#bidCost").val();

	var startDate = $("#startDate").val();
	var endDate = $("#endDate").val();
/* 	var memNum = $("#memNum").textbox('getText');
	var bidCost = $("#bidCost").textbox('getText');

	var startDate = $("#startDate").datebox('getValue');
	var endDate = $("#endDate").datebox('getValue'); */
	
	alert("비드코스트"+bidCost);
	$.messager.confirm('Confirm','경매등록 하시겠습니까?',function(r){


	if (r) {
						if (mainLocal != " " && subLocal != " "
								&& memNum != "" && bidCost != ""
								&& startDate != "" && endDate != "") {
							alert("경매성공");
							alert(memNum);
							alert(subLocal);
							/* $("#f_fsearch").attr("method", "get");
							$("#f_fsearch").attr("action",
									"../../jibnawa/jibnawaSearchInsert.kosmo"); 
							$("#f_fsearch").submit(); */

						location.href="./jibnawaSearchInsert.kosmo?&auc_bigo="+$("#auc_bigo").val()+"&bid_cost="+$("#bidCost").val()+"&region_code="+subLocal+"&auc_comm_bigo="+$("#memNum").val()+"&check_in_date="+$("#startDate").val()+"&check_out_date="+$("#endDate").val();
						}//end if
						else {
							alert("빠짐없이 입력하세요");
							return;
						}//end else
					}//end confirm if
				})
	}

	$(document).ready(function(){
						$("#mainLocal").datalist(
										{
											onSelect : function(rec) {
												var row = $("#mainLocal").datalist('getSelected');
												alert(row.MAIN_AREA_NAME);
												mainLocal = row.MAIN_AREA_NAME;
												var url = "./jibnawaSearch.kosmo?main_area_name="+row.MAIN_AREA_NAME;
												$('#subLocal').datalist('reload', url);
											}
										});
						$("#subLocal").datalist(
										{	
											onSelect : function(rec) {
												var row = $("#subLocal").datalist('getSelected');
												subLocal = row.REGION_CODE;
												alert(subLocal);
											}
										});
					})
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
      <div class="item active" style="height:400px">
        <img src="../img/sin.jpg">
        <div class="carousel-caption">
        </div>      
      </div>
      <div class="item" style="height:400px">
        <img src="../img/lotte.JPG" >
        <div class="carousel-caption">
        </div>      
      </div>
      <div class="item">
        <img src="../img/a.png">
        <div class="carousel-caption">
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
<br>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-2 sidenav">
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Home</a></li>
        <li><a href="#section2">숙소경매</a></li>
        <li><a href="#section3">렌트경매</a></li>
        <li><a href="#section3"></a></li>
      </ul><br>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="빠른검색">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
    </div>
    
   <!--   <div class="row"> -->
    <div class="col-sm-10" style="right-margin:auto">
<!--     <div style="margin:20px 0;"></div> -->
    <div class="easyui-layout" style="width:100%;height:350px;">
    <form id="f_fsearch">
		<div id="mainLocal" class="easyui-datalist" 
		data-options="region:'west',valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME',url:'./jibnawaSearch.kosmo'" 
		title="지역" style="width: 30%;">
		</div>
		<div data-options="region:'east'" title="경매신청하기"
			style="width: 50%; padding: 10px">
			<div>
				<table style="width:450px; height: 100px;">
					<tr>
						<td><input id="startDate" label="시작날짜" name="check_in_date"
							class="easyui-datebox" labelPosition="top" required></td>
						<td><input id="endDate" label="종료날짜" name="check_out_date"
							class="easyui-datebox" labelPosition="top" required
							data-options="validType:'md[\'10/11/2015\']'"></td>
					</tr>
				</table>
			</div>
			<div>
				<table style="width:450px; height: 100px;">
					<tr>
						<td><select label="숙박/렌트" id="auc_bigo" name="auc_bigo"
							class="easyui-combobox" style="width:150px; line-height: 5px;">
								<option value="1">숙박</option>
								<option value="2">렌트</option>
								<option value="3">숙박/렌트</option>
						</select></td>
						<td><input id="memNum" name="auc_comm_bigo" class="easyui-textbox"
							label="인원">명</td>
					</tr>
				</table>
			</div>
			<div>
				<table style="width:450px; height: 100px; padding: 10px">
					<tr>
						<td><select label="경매 진행일" id="aucDate" name="auc_date" style="width:150px"
							class="easyui-combobox" >
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
						</select></td>
						<td><input id="bidCost" label="희망액" name="bid_cost"
							class="easyui-textbox" style="width:150px" >원</td>
						<td><a href="#" onClick="f_submit()"
							class="easyui-linkbutton c8" style="width: 150px">경매등록</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div   data-options="region:'center'" title="세부지역" style="width:20%;">
        <input id="subLocal" name="region_code"  class="easyui-datalist" data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'">
        </div>
    </form>
 <!--    </div> -->
    </div>
    </div>
    </div>
    </div>
</body>
</html>