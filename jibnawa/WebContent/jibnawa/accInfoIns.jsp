<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>��ü ���� ���</title>
<link rel="stylesheet" type="text/css" href="../css/easyui.css">
<link rel="stylesheet" type="text/css" href="../css/icon.css">
<link rel="stylesheet" type="text/css" href="../css/color.css">
<link rel="stylesheet" type="text/css" href="../css/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
<script type="text/javascript">

	var region_code = " ";
	var sub_area_name = " ";
function f_Accsubmit(){
	   
	
	   $.messager.confirm('Confirm','��� �Ͻðڽ��ϱ�?',function(r){


	   if(r) {
	                
	                     alert("��ϼ���");
	                     
	                     $("#f_jibnawaAccinfoIns").attr("method", "post");//#�����̵�

	                     $("#f_jibnawaAccinfoIns").attr("action", './accInfoIns.kosmo');

	                     $("#f_jibnawaAccinfoIns").submit();
	                 
	                
	               }//end confirm if
	            })
	   }


/* �޺� �ڽ� (Region_code => Main_area_name �� ���� ����) */
$(document).ready(function(){
	$("#region_code").combobox(
     {
    
    url: './getRegioncodeList.kosmo'
 
    , onSelect : function(rec) {
    test(rec.MAIN_AREA_NAME);
    region_code = rec.MAIN_AREA_NAME;
    										/* getRegioncodeList.kosmo */
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
}//
/* �޺� �ڽ� (Sub_area_name ������������) */

/*��ü������� ������ �Է��ϴ� ��ȭ�鿡�� �Է��� ���� Ȯ���ϴ� ��ȭ��â�� ���� �ѱ��  */
     function accInfoIns(){
    	 $("#dlg_accinfoIns").dialog('open').dialog('setTitle','��ü���� ��� Ȯ��');
    	 $("#c_region_code").textbox('setValue',$("#region_code").val());
  		 $("#c_sub_area_name").textbox('setValue',$("#sub_area_name").val());
 		 $("#c_Mem_num").textbox('setValue',$("#Mem_num").val());//�ο�
 		 $("#c_Acc_name").textbox('setValue',$("#Acc_name").val());//��ü��
 		 $("#c_Addr").textbox('setValue',$("#Addr").val());
     }
/*��ü������� ������ �Է��ϴ� ��ȭ�鿡�� �Է��� ���� Ȯ���ϴ� ��ȭ��â�� ���� �ѱ��  */
</script>


</head>
<body>

<!--��ü ���� �Է��ϴ� ȭ�� ����-->
<form id="f_jibnawaAccinfoIns">
	<div id="p1" class="easyui-panel" title="��ü�������" 
        style="width:800px;height:200px;padding:10px;background:#addddd;"
        data-options="iconCls:'icon-ok', collapsible:true,maximizable:true">
<table>
<tr>
	<td>
	<br>
	<br>
	<br>
	<label width="30px">����</label>
		<br>
	<input id="region_code" name="region_code2" 
						data-options="valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME'"
	 class="easyui-combobox" style="width:150px">
	</td>
	
	<td> 
	<br>
	<br>
	<br>
	<label width="30px">��������</label>
		<br>
	<input id="sub_area_name" name="region_code" 
					data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'"
	class="easyui-combobox" style="width:150px">	 
</td>
	
<td>
	<br>
	<br>
	<br>
	<label width="30px">ī�װ�</label>
	<br>
<select id="Mem_num" name="category_code" class="easyui-combobox" style="width:100px"">
    <option value="1">����</option>
    <option value="2">��Ʈ</option>
    <option value="3">����/��Ʈ</option>
    
</select>
</td>


<td>
	<br>
	<br>
	<br>
	<label width="30px">��ü��</label>  
	<br>  
	<input id="Acc_name" name="acc_name" class="easyui-textbox" style="width:150px">
	</td>

<td>
	<br>
	<br>
	<br>
	<label width="30px">��ü�ּ�</label>  
	<br>  
	<input id="Addr" name="addr" class="easyui-textbox" style="width:150px">
	</td>
</tr>

<td colspan="2">
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="f_Accsubmit()">���</a>
      </td>
	  <!--  -->
	  </td>
</table>
	</div>
</form>
<!--(��)��ü ���� �Է��ϴ� ȭ�� ��-->

<!-- ---------------------------------------------------------------------------  -->

<!--(��)ȭ�鿡�� ����ڰ� �Է��� ���� (��)ȭ�鿡�� �޾� Ȯ���ϴ� ȭ��  -->
<div id="dlg_accinfoIns" buttons="dlg_accinfoIns" data-options="iconCls:'icon-tip'" class="easyui-dialog" closed="true" style="width:300px">
	<form id="f_accinfoIns" method="post" style="padding:20px 50px">
	
	<div style="margin-bottom:10px">
		<input id="c_region_code"
		class="easyui-textbox" multiline="true" label="��������" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_sub_area_name" 
		class="easyui-textbox" label="����������" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Mem_num"
		class="easyui-textbox" multiline="true" label="���ο���" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Acc_name"
		class="easyui-textbox" label="����ü��" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Addr"
		class="easyui-textbox" label="����ü�ּ�" required="true" style="width:200px">
	</div>
	
	
	<td colspan="2">
         <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onClick="">���</a>
         <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dlg_accinfoIns').dialog('close')">���ư���</a>
    </td>
 </form>
<!--(��)ȭ�鿡�� ����ڰ� �Է��� ���� (��)ȭ�鿡�� �޾� Ȯ���ϴ� ȭ��  -->
</body>
</html>