<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/gray/easyui.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/themes/color.css">
<link rel="stylesheet" type="text/css" href="http://www.jeasyui.com/easyui/demo/demo.css">
<script type="text/javascript" src="../js/jquery.min.js"></script>
<script type="text/javascript" src="../js/jquery.easyui.min.js"></script>
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
	
	alert("����ڽ�Ʈ"+bidCost);
	$.messager.confirm('Confirm','��ŵ�� �Ͻðڽ��ϱ�?',function(r){


	if (r) {
						if (mainLocal != " " && subLocal != " "
								&& memNum != "" && bidCost != ""
								&& startDate != "" && endDate != "") {
							alert("��ż���");
							alert(memNum);
							alert(subLocal);
							/* $("#f_fsearch").attr("method", "get");
							$("#f_fsearch").attr("action",
									"../../jibnawa/jibnawaSearchInsert.kosmo"); 
							$("#f_fsearch").submit(); */

						location.href="./jibnawaSearchInsert.kosmo?&auc_bigo="+$("#auc_bigo").val()+"&bid_cost="+$("#bidCost").val()+"&region_code="+subLocal+"&auc_comm_bigo="+$("#memNum").val()+"&check_in_date="+$("#startDate").val()+"&check_out_date="+$("#endDate").val();
						}//end if
						else {
							alert("�������� �Է��ϼ���");
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
    <div style="margin:20px 0;"></div>
    <div class="easyui-layout" style="width:800px;height:350px;">
    <form id="f_fsearch">
		<div id="mainLocal" class="easyui-datalist" 
		data-options="region:'west',valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME',url:'./jibnawaSearch.kosmo'" 
		title="����" style="width: 150px;">
		</div>
		<div data-options="region:'east'" title="��Ž�û�ϱ�"
			style="width: 500px; padding: 10px">
			<div>
				<table style="width:450px; height: 100px;">
					<tr>
						<td><input id="startDate" label="���۳�¥" name="check_in_date"
							class="easyui-datebox" labelPosition="top" required></td>
						<td><input id="endDate" label="���ᳯ¥" name="check_out_date"
							class="easyui-datebox" labelPosition="top" required
							data-options="validType:'md[\'10/11/2015\']'"></td>
					</tr>
				</table>
			</div>
			<div>
				<table style="width:450px; height: 100px;">
					<tr>
						<td><select label="����/��Ʈ" id="auc_bigo" name="auc_bigo"
							class="easyui-combobox" style="width:150px; line-height: 5px;">
								<option value="1">����</option>
								<option value="2">��Ʈ</option>
								<option value="3">����/��Ʈ</option>
						</select></td>
						<td><input id="memNum" name="auc_comm_bigo" class="easyui-textbox"
							label="�ο�">��</td>
					</tr>
				</table>
			</div>
			<div>
				<table style="width:450px; height: 100px; padding: 10px">
					<tr>
						<td><select label="��� ������" id="aucDate" name="auc_date" style="width:150px"
							class="easyui-combobox" >
								<option value="1">1��</option>
								<option value="2">2��</option>
								<option value="3">3��</option>
						</select></td>
						<td><input id="bidCost" label="�����" name="bid_cost"
							class="easyui-textbox" style="width:150px" >��</td>
						<td><a href="#" onClick="f_submit()"
							class="easyui-linkbutton c8" style="width: 150px">��ŵ��</a></td>
					</tr>
				</table>
			</div>
		</div>
		<div   data-options="region:'center'" title="��������" style="width:150px;">
        <input id="subLocal" name="region_code"  class="easyui-datalist" data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'">
        </div>
    </form>
    </div>
</body>
</html>