<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<meta charset="UTF-8">
<title>Fluid ComboBox - jQuery EasyUI Demo</title>
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://www.jeasyui.com/easyui/jquery.easyui.min.js"></script>
<style type="text/css">

* {
    text-align: center;
    margin: auto;
}

div.combo-panel.panel-body.panel-body-noheader{
    height: 50px;
   
}
</style>
<script type="text/javascript">
/* $(document).ready(function() {
	$("#i_local_main").change(function(){ 
		var mLocal = $("#i_local_main").combobox("getValue");
		alert(mLocal);
		$("#i_local_sub option").each(function() { 
	         $(this).remove(); 
	      });
		if(mLocal=="����"){
			$("#i_local_sub").combobox.append("<option value='gh'>��õ��</option>");
			$("#i_local_sub").combobox.append("<option value='g2'>����</option>");
			$("#i_local_sub").combobox.append("<option value='g3'>����</option>");
		}
	});
	
}); */
/* $(document).ready(function(){
	$("#local_main").combobox({
		onSelect:function(record){
			var mLocal=record;
			 alert(mLocal.LOCATION);
 			if(mLocal.LOCATION=="����"){
				$("#local_sub").combobox('reload','../../jibnawa/jibnawaSearch.kosmo');
			} 
		}
	});
	
}) */
function f_submit(){
	$("#f_fsearch").attr("method","get");
	$("#f_fsearch").attr("action","../jibnawa/jibnawaSearchInsert.kosmo");
	$("#f_fsearch").submit();
	
}

$(document).ready(function(){
	$("#cc1").combobox({
		valueField: 'LOCATION',
		textField: 'LOCATION',
		
		
		url: '../jibnawa/jibnawaSearch.kosmo',
		onSelect: function(rec){
			
			
			/* alert($('#cc1').combobox('getValue')); */
			alert(rec.LOCATION);
			var location=rec.LOCATION.toString();
			alert(location);
		    var url = "../jibnawa/jibnawaSearch.kosmo?LOCATION="+location;
		    $('#cc2').combobox('reload', url);
			}
	})
})

</script>
</head>
<body>
<form id="f_fsearch">
<div class="easyui-panel" style="width:100%;max-width:800px; height:100%; max-height:100px; padding:20px 15px;">
        <div style="margin-bottom:20px">
        <table>
        <td>
        <input name="mainlocal" labelPosition="west" label="���� :" id="cc1" class="easyui-combobox">
		<input name="sublocal" labelPosition="west" label="������ :" id="cc2" class="easyui-combobox" data-options="valueField:'LOCNAME',textField:'LOCNAME'">
		</td>
         </table>
        </div>
  </div>
  <div class="easyui-panel" style="width:100%;max-width:800px;padding:40px 40px;">
    <table style="height:50px">
    	<tr>
    	<td>����/��Ʈ</td>
    	<td>�ο�</td>
    	<td>��� ������</td>
    	<td>��� ������</td>
    	<td>��űⰣ</td>
    	<td>�������</td>
    	</tr>
    	<tr>
				<td><select id="c_rent" name="rent_code" class="easyui-combobox"   style="line-height:5px;">
						<option value="rc_001">����</option>
						<option value="rc_002">��Ʈ</option>
						<option value="rc_003">����/��Ʈ</option>
				</select>
		</td>
		<td ><input id="t_inwon" name="mem_num" class="easyui-textbox" style="width:50%;">��</td>
    	<td ><input id="startDate" name="check_in_date" class="easyui-datebox"  labelPosition="top" required style="width:100px;"></td>
    	<td><input id="endDate" name="check_out_date" class="easyui-datebox" labelPosition="top" required data-options="validType:'md[\'10/11/2015\']'" style="width:100%;"></td>
    	<td ><select id="c_date" class="easyui-combobox">
						<option value="1">1��</option>
						<option value="2">2��</option>
						<option value="3">3��</option>
						<option value="4">4��</option>
						</select></td>
		<td ><input id="cost" name="bid_cost" class="easyui-textbox" style="width:100px;">��</td>
		<td ><a href="#" onClick="f_submit()" class="easyui-linkbutton c8" style="width:120px">��ŵ��</a></td>
    	</tr>
    </table>
    </div>
</form>
</body>
</html>