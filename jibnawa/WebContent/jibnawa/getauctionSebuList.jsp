<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���� ��� ����</title>
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
	     if(confirm("�� ��Ÿ� �����Ͻðڽ��ϱ�?")){
	      $("#f_auctionIns").attr("method","get");
	      $("#f_auctionIns").attr("action","./auctionconInsert.kosmo");
	      $("#f_auctionIns").submit();
	      //document.write("�����Ϸ�Ǿ����ϴ�. ������ ���·� �Ա��ϼ���.")
	     }
}
function cancel(){
		     if(confirm("��Ű� ��ü��ҵ˴ϴ�. ����Ͻðڽ��ϱ�?")){
		      document.write("��ҿϷ�Ǿ����ϴ�.")
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

	//	alert("�����Ͻðڽ��ϱ�?");
	alert(ACC_CODE);
//	$("#ucount").textbox('readonly',true);//true:�б����� false:��������
	$("#auc_comm_id").textbox('setValue',p_auc_comm_id);
	$("#acc_code").textbox('setValue',ACC_CODE);
	$("#ucount").textbox('setValue',A_COUNT);
	$("#uname").textbox('setValue',ACC_NAME);
	$("#uaddr").textbox('setValue',BID_ADDR);
	$("#ustay").textbox('setValue',A_STAY);
	
	$('#dlog_auction').dialog('open');		
} 

function openAuctionDialog(p_auc_comm_id){
	$("#dlg_auction").dialog('open').dialog('setTitle','�����ڸ��');
	$("#f_auction").datagrid({
		url:'./getBidderList.kosmo?auc_comm_id='+p_auc_comm_id
		,columns:[[
						{field:'A_COUNT', title:'��űݾ�', width:100, align:'center', editor:'text'}
	                   ,{field:'A_STAY', title:'����/��Ʈ����', width:100, align:'center', editor:'text'}
	                   ,{field:'ACC_NAME', title:'��ü��', width:100, align:'center', editor:'text'}
	                   ,{field:'BID_ADDR', title:'��ü�ּ�', width:150, align:'center', editor:'text'}
	                   ,{field:'s', title:'�������ÿ���', width:100, align:'center', 
	                	   formatter:function(value,row,index){
	                		   var s = '<input value="�����ϱ�" type="button" class="easyui-linkbutton c2" plain="true" onclick="aucbidding('+row.A_COUNT+",'"+row.ACC_NAME+"'"+",'"+p_auc_comm_id+"'"+",'"+row.ACC_CODE+"'"+",'"+row.BID_ADDR+"'"+",'"+row.A_STAY+"'"+');">';                                   
	                		   /* var a = '<a href="#" class="easyui-linkbutton c3" iconCls="icon-ok" plain="true" onClick="savereg()">����</a>'; */
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
	/* ������ �׸��� �ʱ�ȭ ���� */		
			$("#f_auctionSebu").datagrid({
				url:"./getauctionSebuList.kosmo"//List<XXXVO>-�ҹ���, List<Map>-�빮��(myBatis)
			  , columns:[[
				 			   {field:'AUC_COMM_ID', title:'��� ��Ϲ�ȣ', width:100, align:'center', editor:'text'}
							   ,{field:'AUC_START_DATE', title:'��Ž��۳�¥', width:100, align:'center', editor:'text'}
			                   ,{field:'BID_COST', title:'�������', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_SUCCESS_COST', title:'��������', width:100, align:'center', editor:'text'}
			                   ,{field:'MAIN_AREA_NAME', title:'����', width:100, align:'center', editor:'text'}
			                   ,{field:'SUB_AREA_NAME', title:'��������', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_BIGO', title:'����/��Ʈ����', width:100, align:'center', editor:'text'}
			                   ,{field:'AUC_STATE', title:'��������', width:100, align:'center', editor:'text'}
								
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
<table id="f_auctionSebu" singleselect="true" title="���� ��ų���" class="easyui-datagrid" iconCls="icon-man" style="width:741px;height:450px" rownumbers="true" >
</table> 
</div>
		<!-- �˾�â���� ������ ȭ�� �Դϴ�. ���� -->
		<div id="dlg_auction" buttons="#dlg_buttons" class="easyui-dialog" closed="true" style="width: 600px">
			<div>
				<table id="f_auction"   title="ȸ������ ��ų���"	class="easyui-datagrid" iconCls="icon-man" style="width: 580px; height: 400px" rownumbers="true">
				</table>
			</div>

			<!--������ ��ư  -->
			<div style="float: center; width: 580px;">
			<a href="#"	class="easyui-linkbutton c3" iconCls="icon-no" plain="true"	onClick="cancel()">
				������</a>
			</div>
		</div>

		<!-- �������� ���̾�α� â �߰� ���� -->
		
		<div id="dlog_auction" buttons="#linkbtn_aucbid" class="easyui-dialog"
			title="������ Ȯ���ϼ���!" style="width: 300px; height: 300px;" closed="true"
			data-options="iconCls:'icon-tip',resizable:true,modal:true">
				<!-- ��űݾ� ���� -->
				<form id="f_aucl">
				<div style="margin-bottom: 10px" >
					 <input type="hidden" id="auc_comm_id" name="AUC_COMM_ID"	class="easyui-textbox">
				</div>
				<div style="margin-bottom: 10px" >
					 <input type="hidden" id="acc_code" name="ACC_CODE"	class="easyui-textbox">
				</div>
				<div style="margin-bottom: 10px">
					<label>��űݾ� :</label> <input id="ucount" name="AUC_SUCCESS_COST" class="easyui-textbox" >
				</div>
				<!-- ��űݾ�  �� -->
				<!-- ��ü�� ���� -->
				<div style="margin-bottom: 10px">
					<label>��ü�� :</label> <input id="uname" 
						class="easyui-textbox" >
				</div>
				<!-- ��ü��  �� -->
				<!-- ��ü�ּ� ���� -->
				<div style="margin-bottom: 10px">
					<label>��ü�ּ� :</label> <input id="uaddr"
						class="easyui-textbox" >
				</div>
				<!-- ��ü�ּ�  �� -->
				<!-- ���ڷ�Ʈ���� ���� -->
				<div style="margin-bottom: 10px">
					<label>���ڷ�Ʈ����:</label> <input id="ustay" 
						class="easyui-textbox" >
				</div>
				</form>
				<!-- ���ڷ�Ʈ����  �� -->
			</div>


		<!-- ���� ���̾�α� â�� ��ư �߰� ���� -->
		<div id="linkbtn_aucbid">
			<a  class="easyui-linkbutton c1"
				iconCls="icon-ok" onclick="aucUpdateAction()">�����Ϸ�</a> <a
				 class="easyui-linkbutton c5"
				iconCls="icon-cancel" onclick="$('#dlog_auction').dialog('close')">���</a>
		</div>

</body>
</html>
