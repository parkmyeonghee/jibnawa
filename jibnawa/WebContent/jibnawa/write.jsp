<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�۾���</title>
 <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="shortcut icon" href="../img/favicon.png">
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
    
     @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
  </style>
  <script type="text/javascript">
 function a_write(){
	
 }
 function a_cancel(){
	 location.href="./QandA.jsp";
 }
 function a_insert(){
		alert('dddd');
		$("#b_write").attr("method","post");
		$("#b_write").attr("action","./boardInsert.kosmo");
		$("#b_write").submit();
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
      <a class="navbar-brand" href="#" >Jibnawa</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Home</a></li>
        <li><a href="#">��Ž���</a></li>
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
        <li><a href="#section2">���Ұ��</a></li>
        <li><a href="#section3">��Ʈ���</a></li>
        <li><a href="#section3"></a></li>
      </ul><br>
      <div class="input-group">
        <input type="text" class="form-control" placeholder="�����˻�">
        <span class="input-group-btn">
          <button class="btn btn-default" type="button">
            <span class="glyphicon glyphicon-search"></span>
          </button>
        </span>
      </div>
    </div>
      <div class="row">
      <div class="col-sm-6">
      <div class="container">
    	<form id="b_write">
	  <div class="form-group">
	    <label for="title">����</label>
	    <input type="text" class="form-control" id="ac_title" name="ac_title" placeholder="���� �Է�">
	  </div>
	    <div class="form-group">
	    <label for="title">�ۼ���</label>
	    <input type="text" class="form-control" id="ac_name" name="ac_name" placeholder="�̸� �Է�">
	  </div>
	  	<div class="form-group">
	   <label for="email">Email</label>
      <input type="text" class="form-control" id="ac_email" name="ac_email" placeholder="email �Է��� �ּ���">
	  </div>
	  <div class="form-group">
	    <label for="Password">Password</label>
	    <input type="password" class="form-control" id="ac_pw" name="ac_pw" placeholder="��й�ȣ �Է�">
	  </div>
	     <div class="form-group">
          <textarea class="form-control" rows="10" id="ac_content"name="ac_content"></textarea>
        </div>
        <div class="form-group">
       <button type="button" class="btn btn-danger pull-right" onClick="a_cancel()">���</button> 
        <button type="button" class="btn btn-info pull-right" onClick="a_insert()">���</button> 
        </div>
	   </form>
		</div>
        </div>
        </div>
        </div>
      <br><br> 
          </div>
</body>
</html>