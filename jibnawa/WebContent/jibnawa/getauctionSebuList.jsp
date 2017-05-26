<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>나의 경매 내역</title>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="../easyui/demo/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">
var auc_comm_id = null;
function savereg(){
	   alert();
	     if(confirm("이 경매를 낙찰하시겠습니까?")){
	      $("#f_auctionIns").attr("method","get");
	      $("#f_auctionIns").attr("action","./auctionconInsert.kosmo");
	      $("#f_auctionIns").submit();
	      //document.write("접수완료되었습니다. 지정된 계좌로 입금하세요.")
	     }
}
function cancel(){
		     if(confirm("경매가 전체취소됩니다. 취소하시겠습니까?")){
		      document.write("취소완료되었습니다.")
		     }
		     else{
		     }
		}	     
function aucUpdateAction(){

	alert($("#ucount").textbox('getValue'));
	alert($("#auc_comm_id").textbox('getValue'));
	
	var comm_id=$("#auc_comm_id").textbox('getValue').toString();
	var suc_cost=$("#ucount").textbox('getValue').toString();
	
	alert(comm_id);
	$("#f_aucl").attr("method","post");
    $("#f_aucl").attr("action","./aucUpdate.kosmo");
    $("#f_aucl").submit();
}	

function aucbidding(A_COUNT,ACC_NAME,p_auc_comm_id,ACC_CODE,BID_ADDR,A_STAY){

	//	alert("낙찰하시겠습니까?");
	alert(ACC_CODE);
//	$("#ucount").textbox('readonly',true);//true:읽기전용 false:수정가능
	$("#auc_comm_id").textbox('setValue',p_auc_comm_id);
	$("#acc_code").textbox('setValue',ACC_CODE);
	$("#ucount").textbox('setValue',A_COUNT);
	$("#uname").textbox('setValue',ACC_NAME);
	$("#uaddr").textbox('setValue',BID_ADDR);
	$("#ustay").textbox('setValue',A_STAY);
	
	$('#dlog_auction').dialog('open');		
} 

function openAuctionDialog(p_auc_comm_id){
	$("#dlg_auction").dialog('open').dialog('setTitle','입찰자목록');
	$("#f_auction").datagrid({
		url:'./getBidderList.kosmo?auc_comm_id='+p_auc_comm_id
		,columns:[[
						{field:'A_COUNT', title:'경매금액', width:100, align:'center', editor:'text'}
	                   ,{field:'A_STAY', title:'숙박/렌트여부', width:100, align:'center', editor:'text'}
	                   ,{field:'ACC_NAME', title:'업체명', width:100, align:'center', editor:'text'}
	                   ,{field:'BID_ADDR', title:'업체주소', width:150, align:'center', editor:'text'}
	                   ,{field:'s', title:'낙찰선택여부', width:100, align:'center', 
	                	   formatter:function(value,row,index){
	                		   var s = '<input value="낙찰하기" type="button" class="easyui-linkbutton c2" plain="true" onclick="aucbidding('+row.A_COUNT+",'"+row.ACC_NAME+"'"+",'"+p_auc_comm_id+"'"+",'"+row.ACC_CODE+"'"+",'"+row.BID_ADDR+"'"+",'"+row.A_STAY+"'"+');">';                                   
	                		   /* var a = '<a href="#" class="easyui-linkbutton c3" iconCls="icon-ok" plain="true" onClick="savereg()">선택</a>'; */
                                 return s;

	                	   }
	                   }
	         
				]]
});
	
}
</script>

</head>

<body>
<script type="text/javascript">
$(document).ready(function (){
	/* 데이터 그리드 초기화 시작 */		
			$("#f_auctionSebu").datagrid({
				url:"./getauctionSebuList.kosmo"//List<XXXVO>-소문자, List<Map>-대문자(myBatis)
			  , columns:[[
				 			   {field:'AUC_COMM_ID', title:'경매 등록번호', width:100, align:'center', editor:'text'}
							   ,{field:'AUC_START_DATE', title:'경매시작날짜', width:100, align:'center', editor:'text'}
			                   ,{field:'BID_COST', title:'희망가격', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_SUCCESS_COST', title:'낙찰가격', width:100, align:'center', editor:'text'}
			                   ,{field:'MAIN_AREA_NAME', title:'지역', width:100, align:'center', editor:'text'}
			                   ,{field:'SUB_AREA_NAME', title:'세부지역', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_BIGO', title:'숙박/렌트여부', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_STATE', title:'낙찰상태', width:100, align:'center', editor:'text'}
								
						]]
				, onSelect : function(rec){
					var row = $("#f_auctionSebu").datagrid('getSelected');
					alert(row.AUC_COMM_ID);
					var auc_comm_id = row.AUC_COMM_ID;
					openAuctionDialog(auc_comm_id);
				}
	});
});
</script>


<div>
<table id="f_auctionSebu" singleselect="true" title="나의 경매내역" class="easyui-datagrid" iconCls="icon-man" style="width:741px;height:450px" rownumbers="true" >
</table> 
</div>
		<!-- 팝업창에서 제공될 화면 입니다. 시작 -->
		<div id="dlg_auction" buttons="#dlg_buttons" class="easyui-dialog" closed="true" style="width: 600px">
			<div>
				<table id="f_auction"   title="회원님의 경매내역"	class="easyui-datagrid" iconCls="icon-man" style="width: 580px; height: 400px" rownumbers="true">
				</table>
			</div>

			<!--경매취소 버튼  -->
			<div style="float: center; width: 580px;">
			<a href="#"	class="easyui-linkbutton c3" iconCls="icon-no" plain="true"	onClick="cancel()">
				경매취소</a>
			</div>
		</div>

		<!-- 낙찰정보 다이얼로그 창 추가 시작 -->
		
		<div id="dlog_auction" buttons="#linkbtn_aucbid" class="easyui-dialog"
			title="낙찰을 확인하세요!" style="width: 300px; height: 300px;" closed="true"
			data-options="iconCls:'icon-tip',resizable:true,modal:true">
				<!-- 경매금액 시작 -->
				<form id="f_aucl">
				<div style="margin-bottom: 10px" >
					 <input type="hidden" id="auc_comm_id" name="AUC_COMM_ID"	class="easyui-textbox">
				</div>
				<div style="margin-bottom: 10px" >
					 <input type="hidden" id="acc_code" name="ACC_CODE"	class="easyui-textbox">
				</div>
				<div style="margin-bottom: 10px">
					<label>경매금액 :</label> <input id="ucount" name="AUC_SUCCESS_COST" class="easyui-textbox" >
				</div>
				<!-- 경매금액  끝 -->
				<!-- 업체명 시작 -->
				<div style="margin-bottom: 10px">
					<label>업체명 :</label> <input id="uname" 
						class="easyui-textbox" >
				</div>
				<!-- 업체명  끝 -->
				<!-- 업체주소 시작 -->
				<div style="margin-bottom: 10px">
					<label>업체주소 :</label> <input id="uaddr"
						class="easyui-textbox" >
				</div>
				<!-- 업체주소  끝 -->
				<!-- 숙박렌트여부 시작 -->
				<div style="margin-bottom: 10px">
					<label>숙박렌트여부:</label> <input id="ustay" 
						class="easyui-textbox" >
				</div>
				</form>
				<!-- 숙박렌트여부  끝 -->
			</div>


		<!-- 낙찰 다이얼로그 창에 버튼 추가 시작 -->
		<div id="linkbtn_aucbid">
			<a  class="easyui-linkbutton c1"
				iconCls="icon-ok" onclick="aucUpdateAction()">낙찰완료</a> <a
				 class="easyui-linkbutton c5"
				iconCls="icon-cancel" onclick="$('#dlog_auction').dialog('close')">취소</a>
		</div>

</body>
</html>
