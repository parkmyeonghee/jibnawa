<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��� ��ǰ ���</title>
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">

var region_code = " ";
var sub_area_name = " ";

function f_submit(){
   

   

                     alert("��ż���");
                     $("#f_jibnawaIns").attr("method", "post");//#�����̵�
                     $("#f_jibnawaIns").attr("action", './jibnawaInsert.kosmo');
                     $("#f_jibnawaIns").submit();
              
                
                	  
        
            	   
          
   }/////////////////////////////////////////////////////////////////////////////end of f_submit()

/* �޺� �ڽ� (Region_code => Main_area_name �� ���� ����) */
	$(document).ready(function(){
    	$("#region_code").combobox(
         {
        url: './getRegioncodeList.kosmo'
        , onSelect : function(rec) {
        //alert("������:"+rec.MAIN_AREA_NAME); 
        test(rec.MAIN_AREA_NAME);
        								region_code = rec.MAIN_AREA_NAME;

       }
       });
 })
/* �޺� �ڽ� (Region_code => Main_area_name �� ���� ����) */

/* �޺� �ڽ� (Sub_area_name ������������) */
	function test(rec){
	    	 alert("������:"+rec);
	    	 
	    	 $("#sub_area_name").combobox({
	        	 url:"./getRegioncodeListSub.kosmo?main_area_name="+rec
	        			 
						        	    ,onSelect : function(rec) {
					                     var row = $("#sub_area_name").combobox('getValue');
					                     sub_area_name = row.REGION_CODE; 
						        	 }  
	          })  	 
	}
/* �޺� �ڽ� (Sub_area_name ������������) */

/* Datebox 'YYYY-MM-DD'�������� ���� ���� */
    $.fn.datebox.defaults.formatter = function(date){
    	   var y = date.getFullYear();
    	   var m = date.getMonth()+1;
    	   var d = date.getDate();
    	   return y+'-'+m+'-'+d;
    	}
    	$.fn.datebox.defaults.parser = function(s){
    	   var t = Date.parse(s);
    	   if (!isNaN(t)){
    	      return new Date(t);
    	   } else {
    	      return new Date();
    	   }
    	}
/* Datebox 'YYYY-MM-DD'�������� ���� ���� */

/* Datebox ���� ���� */
    $('#check_in_date').datebox({
        required:true
    });
    $('#check_out_date').datebox({
        required:true
    });
    $('#auc_start_date').datebox({
        required:true
    });
    $('#auc_end_date').datebox({
        required:true
    });
/* Datebox ���� ���� */

/*��Ż�ǰ��� ������ �Է��ϴ� ��ȭ�鿡�� ����ڰ� �ۼ��� ���� Ȯ���ϴ� ��ȭ��â�� ���� �ѱ��  */
     function goGo(){
    	$("#dlg_infoIns").dialog('open').dialog('setTitle','��� ��� Ȯ��');
   	   
 		$("#c_region_code").textbox('setValue',$("#region_code").val());
 		$("#c_sub_area_name").textbox('setValue',$("#sub_area_name").val());
 		$("#c_auc_comm_bigo").textbox('setValue',$("#auc_comm_bigo").val());
 		$("#c_check_in_date").textbox('setValue',$("#check_in_date").val());
 		$("#c_check_out_date").textbox('setValue',$("#check_out_date").val());
 		$("#c_bid_cost").textbox('setValue',$("#bid_cost").val());
 		$("#c_auc_start_date").textbox('setValue',$("#auc_start_date").val());
 		$("#c_auc_end_date").textbox('setValue',$("#auc_end_date").val());
     }
/*��Ż�ǰ��� ������ �Է��ϴ� ��ȭ�鿡�� ����ڰ� �ۼ��� ���� Ȯ���ϴ� ��ȭ��â�� ���� �ѱ��  */
    
    </script>
</head>
<body>
<!------------------(��ȭ��)��Ż�ǰ���� �Է�ȭ�� --------------------------->
<form id="f_jibnawaIns">
<div id="p1" class="easyui-panel" title="����" 
        style="width:800px;height:200px;padding:10px;background:#addddd;"
        data-options="iconCls:'icon-ok', collapsible:true,maximizable:true">
    <p>��Ž���</p>
<table>
<tr>
	<td>
		<label width="30px">����</label>
	<br>
		<input id="region_code" name="region_code2" 
					data-options="valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME'"
 					class="easyui-combobox" style="width:150px">
	</td>

	<td> 
		<label width="30px">��������</label>
	<br>
		<input id="sub_area_name" name="region_code" 
					data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'"
					class="easyui-combobox" style="width:150px">	 
	</td>
	<td>
		<label width="30px">��¥</label>
	<br>
		<input id="check_in_date" name="check_in_date" class="easyui-datebox"  
					required="required" style="width:150px">
	</td>
	<td>
	<br>
		<input id="check_out_date" name="check_out_date" class="easyui-datebox" 
					required="required" style="width:150px">
	</td>
</tr>
<tr>
	<td>
		<label width="30px">�����ݾ�</label>  
	<br>  
	    <input id="bid_cost" name="bid_cost" class="easyui-numberbox" style="width:150px">
	</td>
	<td>
		<label width="30px">�ο�</label>
	<br>
<select id="auc_comm_bigo" name="auc_comm_bigo" class="easyui-combobox" style="width:150px"">
    <option value="1">1�ν�</option>
    <option value="1~2">1~2��</option>
    <option value="3~4">3~4�ν�</option>
    <option value="8">8�ν�</option>
    <option value="12~18">12~18�ν�</option>
</select>
	</td>
	<td>
		<label width="50px">��űⰣ</label>
	<br>
		<input id="auc_start_date" name="auc_start_date" class="easyui-datebox" required="required" style="width:150px">
	</td>
	<td>
	<br>
		<input id="auc_end_date" name="auc_end_date" class="easyui-datebox" required="required" style="width:150px">
	<br>
<td colspan="2">
      <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="f_submit()">��Ž���</a>
</td>
	</td>
</tr>
</table>
</div>
<!------------------(��ȭ��)��Ż�ǰ���� �Է�ȭ�� --------------------------->

<!--(��)ȭ�鿡�� ����ڰ� �Է��� ���� (��)ȭ�鿡�� �޴� ȭ��  -->
<div id="dlg_infoIns" buttons="dlg_infoIns" data-options="iconCls:'icon-tip'" class="easyui-dialog" closed="true" style="width:300px">
	<form id="f_infoIns" method="post" style="padding:20px 50px">
	
	<div style="margin-bottom:10px">
		<input id="c_region_code"
		class="easyui-textbox" multiline="true" label="��������" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_sub_area_name" 
		class="easyui-textbox" label="����������" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_comm_bigo"
		class="easyui-textbox" multiline="true" label="���ο���" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_check_in_date"
		class="easyui-textbox" label="�����ڳ�¥" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_check_out_date"
		class="easyui-textbox" label="�����ڳ�¥" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_bid_cost"
		class="easyui-textbox" multiline="true" label="�������ݾ�" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_start_date" 
		class="easyui-textbox" multiline="true" label="����űⰣ" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_end_date"
		class="easyui-textbox" multiline="true" label="����űⰣ" required="true" style="width:200px">
	</div>
	<td colspan="2">
         <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onClick="f_submit()">��ŵ��</a>
         <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dlg_infoIns').dialog('close')">���ư���</a>
    </td>
	</form>
<!--(��)ȭ�鿡�� ����ڰ� �Է��� ���� (��)ȭ�鿡�� �޴� ȭ��  -->
</body>
</html>