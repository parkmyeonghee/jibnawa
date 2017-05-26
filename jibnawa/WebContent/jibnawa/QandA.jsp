<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Table Data Addition</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    .row{
    margin:0 auto;
    }
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 1500px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height: auto;} 
    }
  </style>
 <script type="text/javascript">




 
function b_delete(){
	
}




  $(document).ready(function() {
	  
	  $("#a_table").on('click-row.bs.table', function (e, row, $element) {
		   
		  alert(row.AC_NO);
		  
		  location.href="./getBoardList.kosmo?ac_no="+row.AC_NO;
		  
		});

	  $(function () {
	      $('#a_table').bootstrapTable({
	          url: "./getBoardList.kosmo"
	      });
	  });
   
} );  
function b_write(){
	 location.href="./write.jsp";
}

function title(){
	 location.href="./write.jsp";
}
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
      <a class="navbar-brand" href="./index.jsp" >Jibnawa</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="./index.jsp">Home</a></li>
        <li><a href="#">경매시작</a></li>
        <li class="">
        </li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Join</a></li>
      </ul>
    </div>
  </div>
</nav>
<br>
<br>
<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav">
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

 <div class="row">
    <div class="col-sm-9">
    	<table class="table table-striped table-bordered" id="a_table">
     <thead>
            <tr class='clickable-row' >
                <th data-field="AC_TITLE">제목</th>
                <th data-field="AC_NAME">작성자</th>
                <th data-field="AC_DATE">작성일</th>
            </tr>
        </thead>
    	</table>
    	<div class ="text center">
    	<ul class="pagination" id="ac_page">
    	<li><a href="#">1</a></li>
    	<li><a href="#">2</a></li>
    	<li><a href="#">3</a></li>
    	<li><a href="#">4</a></li>
    	</ul>
    	</div> 
        <form role="form">
        <button type="button" class="btn btn-info pull-right" onClick="b_edit()">글수정</button>
        <button type="button" class="btn btn-info pull-right" onClick="b_delete()">글삭제</button>
        <button type="button" class="btn btn-info pull-right" onClick="b_write()">글쓰기</button>
      </form>
        </div>
    </div>
</div>
 </div>
</body>
</html>