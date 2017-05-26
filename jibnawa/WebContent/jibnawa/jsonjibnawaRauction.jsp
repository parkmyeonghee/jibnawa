

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, java.util.Map, com.vo.JibnawaMemberVO" %> 
<%@ page
	import="java.net.URLDecoder, com.vo.JibnawaMemberVO,java.util.*"%>
	<%@page session="true" %>


<%@ page import="com.google.gson.Gson" %>    
<%
List<Map<String,Object>> jibnawaRauctionList =
	(List<Map<String,Object>>)request.getAttribute("jibnawaRauctionList");
	Gson g = new Gson();
	String jsonRauction = g.toJson(jibnawaRauctionList);
	
	JibnawaMemberVO jm= (JibnawaMemberVO)session.getAttribute("login");
	 
%>
<%@include file = "header.jsp"%>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1" />
	<title>입찰 가능</title>
	
	<script>

	
	
	
	function bidclick(num, cost, id,comm,memnum){

		//alert(index + " : " + item);
		
		
		dialog.push({
			type: "Caution",
			//body: Object.toJSON({index:this.index, item:this.item})+"에 입찰 하시겠습니까?",
					body: "숙박인원 : " + num +"명<br> 희망입찰가 : " + cost + " 원<br> 성함 : "+ id +"님 에게 입찰 하시겠습니까?<br> 희망낙찰가 : "
							+"<input type='tel' style='width:100px; height:30px;' name='inputMoney' data-axbind='money' id='AXInputMoney' value='"+cost+"' class='AXInput' />원",
			buttons:[
				{buttonValue:'확인', buttonClass:'Red W100', onClick:function(arg){
				
					
					
					
					//$('#b').val(this.value); 
					
					alert(comm);
					alert($("#AXInputMoney").val());
					
					<%=jm.getMem_num()%>
					
					 location.href = "bidaction.kosmo?AUC_COMM_ID="+comm+"&A_COUNT="+$("#AXInputMoney").val()+"&MEM_NUM="+memnum;
					
					
				
				}},
				{buttonValue:'취소', buttonClass:'Blue', onClick:function(arg){alert(arg);}, data:'취소하셨습니다.'}
			//	{buttonValue:'button3', buttonClass:'Green', onClick:function(arg){alert(arg);}, data:'data3'}
			]
		});
		
		
	};
	
	
	
</script> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	
	  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.10.1/bootstrap-table.min.js"></script>
	
    <link rel="shortcut icon" href="../axisj/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="../axisj/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../axisj/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="../axisj/ui/AXJ.png" />
    <meta property="og:image" content="../axisj/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <!-- css block -->
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../axisj/ui/arongi/page.css">
    <link rel="stylesheet" type="text/css" href="../axisj/ui/arongi/AXJ.min.css">
  <link rel="stylesheet" type="text/css" href="http://cdno.axisj.com/axicon/axicon.min.css"/>

   <script type="text/javascript" src="../axisj/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../axisj/dist/AXJ.min.js"></script>
<!--     <script type="text/javascript" src="../axisj/lib/AXCore.js"></script> -->
    <script type="text/javascript" src="../axisj/lib/AXGrid.js"></script>
    
         <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
   body {
  
    padding:20px;
   
}
    </style>
 <!--    <script type="text/javascript" src="../page.js"></script>
    <script type="text/javascript" src="pageTab.js"></script>
     -->
    <!-- js block -->
    
    
<!--     <script>
	(function(){
	
	$("AXInputMoney")
	
		$("#com-toast-open").click(function(){
			toast.push("토스트를 열었습니다. 잠시후 사라집니다.");
		});
		$("#com-dialog-open").click(function(){
			dialog.push("다이얼로그");
		});
	})();
</script>
     -->
    
	
	<script type="text/javascript">
	var pageID = "AXGrid";
	var myGrid = new AXGrid();
	var itemSum = 0;
	var fnObj = {
		pageStart: function(){

			myGrid.setConfig({
				targetID : "AXGridTarget",
				theme : "AXGrid",
				//viewMode: "grid", // ["grid","icon","mobile"]
				// 브라우저 사이즈에 따른 changeGridView 설정
                mediaQuery: {
                    mx:{min:0, max:600}, dx:{min:600}
                },
				colGroup : [
							
					
					
				   {key:"AUC_COMM_ID", label:"번호", width:"60", align:"center" },
				   {key:"MEM_NAME", label:"입찰자명", width:"100", align:"center"},
                            {key:"BID_COST", label:"희망 입찰가", width:"100", align:"center",formatter:"money"},
                            {key:"AUC_COMM_BIGO", label:"숙박인원", width:"80", align:"center"},
                            {key:"CHECK_IN_DATE", label:"체크 인  날짜", width:"130", align:"center",formatter:"date"},
                            {key:"CHECK_OUT_DATE", label:"체크 아웃 날짜", width:"130", align:"center",formatter:"date"},
				    {
                        key: "btns", label: "입찰", width: "100", align: "center", formatter: function () {
                      		//return '<button class="AXButton Red"  id="com-dialog-button-open" onclick="bidclick(' + this.index + "," + this.item.money + ');">입찰하기</button>';
                      		
                      		return '<button class="AXButton Red"  id="com-dialog-button-open" onclick="bidclick('+"'"+this.item.AUC_COMM_BIGO+"'"+","+this.item.BID_COST
                      				
                      				+",'"
                      				+this.item.MEM_NAME+"'"
                      				+",'"
                      				+this.item.AUC_COMM_ID+"'"
                      				+",'"
                      				+this.item.MEM_NUM+"'"
                      				
                      			      
                      				+');">입찰하기</button>';
                      		
                      		/* return '<button class="AXButton Red"  id="com-dialog-button-open" onclick="bidclick('+this.index+","+this.item.money+",'"+this.item.MEM_EMAIL+"'"
                      				+');">입찰하기</button>'; */
                        	//  return '<button type="button" name="submit" onclick="fnObj.grid.deleteItem(' + this.index + ');">입찰<i class="axi axi-check-circle-o"></i></button>';
                    }		 //bidclick(' + this.index + "," + this.item.money +  " ,' "+    this.MEM_NICKNAME   + "'"         ')
                    }                       // '+ 150 , 150, '닉네임'
				],
				   
				body : {			
					 onclick: function(){
						//toast.push(Object.toJSON({index:this.index, item:this.item}));
						//toast.push(this.item);
					//alert(Object.toJSON(this.item.money));
						//alert(this.item.person);
						//alert(this.page);
						
						
						 
						
						
					} 
				},
				page:{
					  paging:true,
                      pageNo:1,
                      pageSize:100,
                      status:{formatter: null}
				}
			});
			
			
		     myGrid.setList(<%=jsonRauction%>);
             myGrid.setDataSet({});
             trace(myGrid.getSortParam());
			
			
			
		}
	
	
	
	
	
	
	};

    jQuery(document.body).ready(function(){fnObj.pageStart()});
	</script>
	<!-- js block -->
	
</head>
<body>





<div id="AXPage">

<div id="myCarousel" class="carousel slide" data-ride="carousel" style="height:auto; max-height:600px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
  <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active" style="height:auto; max-height:600px ">
        <img src="../img/a.png">
        <div class="carousel-caption">
        </div>      
      </div>
      <div class="item" style="height:auto; max-height:600px">
        <img src="../img/b.png" >
        <div class="carousel-caption">
        </div>      
      </div>
      <div class="item" style="height:auto; max-height:600px">
        <img src="../img/c.png">
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

</div>


    <div id="AXPageBody" class="SampleAXSelect">

			<div align="center">
		 <br><p>
            
              <a href="./index.jsp"><button class="btn btn-warning">메인 페이지</button></a>
            <a href="./RauctionView.kosmo"><button class="btn btn-primary">판매자 페이지</button></a>
            <br><br>
            <a href="./JibnawaRauctionList.kosmo"><button class="btn btn-success">입찰 가능</button></a>
            <a href="./JibnawaIngList.kosmo"><button class="btn btn-info">입찰 진행중</button></a>
            <a href="./JibnawaSucessList.kosmo"><button class="btn btn-warning">입찰 완료</button></a>
            
         
          </p></div>


        <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
        <div class="AXdemoPageContent">

            <h1>입찰 가능</h1>
            
            <div id="AXGridTarget"></div>

        </div>
    </div>
</div>

</body>
</html>
