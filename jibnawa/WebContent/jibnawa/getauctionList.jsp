<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ��ų���</title>
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.6.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/dev_spring4/js/commons.js"></script>
<script type="text/javascript">
function savereg(){
     if(confirm("ooo�� ooo�� 12�� 08��~12�� 12�ϱ��� 90,000���� �����Ͻðڽ��ϱ�?")){
      document.write("�����Ϸ�Ǿ����ϴ�. ������ ���·� �Ա��ϼ���.")
     }
     else{
     }
    }
    function cancel(){
     if(confirm("��Ű� ��ü��ҵ˴ϴ�. ����Ͻðڽ��ϱ�?")){
      document.write("��ҿϷ�Ǿ����ϴ�.")
     }
     else{
     }
    }
function searchALL(){
    $('#f_auction').datagrid({
        url: "./getauctionList.kosmo"
     })

	 
}
</script>
</head>
<body>
<script type="text/javascript">
$(document).ready(function (){
	/* ������ �׸��� �ʱ�ȭ ���� */		
			$("#f_auction").datagrid({
				url:"./getauctionList.kosmo"//List<XXXVO>-�ҹ���, List<Map>-�빮��(myBatis)
			  , columns:[[
								{field:'A_NO', title:'��ȣ', width:80, align:'center', editor:'text'}
			                   ,{field:'A_DATE', title:'��¥', width:100, align:'center', editor:'text'}
			                   ,{field:'A_REGION', title:'����', width:120, align:'center', editor:'text'}
			                   ,{field:'A_COUNT', title:'�ݾ�', width:100, align:'center', editor:'text'}
			                   ,{field:'A_STAY', title:'���ڿ���', width:100, align:'center', editor:'text'}
			                   ,{field:'A_RENT', title:'��Ʈ����', width:100, align:'center', editor:'text', hidden:'true'}
			                   ,{field:'A_BID', title:'��������', width:200, align:'center',
			                	   formatter:function(value,row,index){
			                			   var s = '<input value="�����ϱ�" type="button" class="easyui-linkbutton c4" iconCls="icon-ok" plain="true" onClick="savereg()">';
			                			   var a = '<a href="#" class="easyui-linkbutton c3" iconCls="icon-ok" plain="true" onClick="savereg()">����</a>';
			                			   return s+"  "+a;
			                	   }///////////end of formatter
			                   }//////////////end of action
			                ]]
			});

	/* ������ �׸��� �ʱ�ȭ  ��   */		
		});
</script>

<!-- ���̺� �׸���!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! -->
<table id="f_auction" toolbar="#tbar_auction" title="ȸ������ ��ų���" class="easyui-datagrid" style="width:900px;height:400px" rownumbers="true" >
<!--    <thead>
      <tr>
         <th  data-options="field:'A_NO', width:50, align:'center'">��ȣ</th>
         <th  data-options="field:'A_DATE', width:150, align:'center'">��¥</th>
         <th  data-options="field:'A_REGION', width:150, align:'center'">����</th>
         <th  data-options="field:'A_COUNT', width:150, align:'center'">�����ݾ�</th>
         <th  data-options="field:'A_STAY', width:150, align:'center'">���ڿ���</th>
         <th  data-options="field:'A_RENT', width:150, align:'center'">��Ʈ����</th>
         <th  data-options="field:'A_BID', width:150, align:'center'">��������</th>
      </tr>
   </thead> -->
</table>   

<!-- ���̾�α�â���� ������ ȭ�� �Դϴ�. ���� -->
<div id="dlg_auctionIns" buttons="#linkbtn_auctionIns" title="�����Ͻðڽ��ϱ�?" class="easyui-dialog" closed="true" style="width:600px" closed="true"
	data-options="iconCls:'icon-help',resizable:true, modal:true">

<%-- <!-- ������ ����ڰ� �Է��� ������ �����մϴ�.(form�������� ó���ϱ�) -->
   <form id="f_auctionIns" style="margin:0;padding:20px 50px">    
    <div style="margin-bottom:10px">
    <input id="cb_deptno" name="deptno" label="�μ���ȣ :" style="width:100%"  class="easyui-combobox" data-options="
        valueField: 'DEPTNO',
        textField: 'DNAME',
        url: 'getauctionList.kosmo',
        onSelect: function(rec){
         <!-- alert(rec.DEPTNO); -->
        }">
    </div> --%>
   
    
    <!--�˾�â  -->
    <div style="margin-bottom:10px">
    <input name="dname" class="easyui-textbox" label="��¥ : " style="width:100%">
    </div>
    <div style="margin-bottom:10px">
    <input name="loc" class="easyui-textbox" label="���� : " style="width:100%">
    </div>
    </form>   
 </div>

<!--  
 <div id="dlg_buttons">
   <a href="#" class="easyui-linkbutton c1" iconCls="icon-ok" plain="true" onClick="insertAction()" style="width:90px">����</a>
   <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onClick="javascript:$('#dlg_deptIns').dialog('close')" style="width:90px">���</a>
</div> -->
<!-- ��� ������ ������ ȭ�� �Դϴ�.  ����  -->
<div id="dlg_deptInsSuccess" buttons="#dlg_buttons2" class="easyui-dialog" closed="true" style="width:300px">
   <label>��ϼ����Ͽ����ϴ�.</label>
</div>
 <div id="dlg_buttons2">
   <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onClick="javascript:$('#dlg_deptInsSuccess').dialog('close')" style="width:90px">�ݱ�</a>
</div>
<!-- ��� ���н� ������ ȭ�� �Դϴ�.  ����  -->
<div id="dlg_deptInsFail" buttons="#dlg_buttons3" class="easyui-dialog" closed="true" style="width:300px">
   <label>��Ͻ����Ͽ����ϴ�.</label>
</div>
 <div id="dlg_buttons3">
   <a href="#" class="easyui-linkbutton" iconCls="icon-cancel" plain="true" onClick="javascript:$('#dlg_deptInsFail').dialog('close')" style="width:90px">�ݱ�</a>
</div>
<div style="float:center; width:900px;" a href="#" class="easyui-linkbutton c3" iconCls="icon-no" plain="true" onClick="cancel()" >������</a></div>
</div>
</body>
</html>











