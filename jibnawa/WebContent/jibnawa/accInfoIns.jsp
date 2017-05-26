<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>업체 정보 등록</title>
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
	   
	
	   $.messager.confirm('Confirm','등록 하시겠습니까?',function(r){


	   if(r) {
	                
	                     alert("등록성공");
	                     
	                     $("#f_jibnawaAccinfoIns").attr("method", "post");//#폼아이디

	                     $("#f_jibnawaAccinfoIns").attr("action", './accInfoIns.kosmo');

	                     $("#f_jibnawaAccinfoIns").submit();
	                 
	                
	               }//end confirm if
	            })
	   }


/* 콤보 박스 (Region_code => Main_area_name 주 지역 정보) */
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
/* 콤보 박스 (Region_code => Main_area_name 주 지역 정보) */

/* 콤보 박스 (Sub_area_name 세부지역정보) */
function test(rec){
    	 alert("주지역:"+rec);
    	 
    	 $("#sub_area_name").combobox({
    
    		 url:"./getRegioncodeListSub.kosmo?main_area_name="+rec
    	
    		 						,onSelect : function(rec) {
				                     var row = $("#sub_area_name").combobox('getValue');
				                     sub_area_name = row.REGION_CODE; 
					        	 }  
          })  	 
}//
/* 콤보 박스 (Sub_area_name 세부지역정보) */

/*업체정보등록 정보를 입력하는 주화면에서 입력한 값을 확인하는 부화면창에 값을 넘기기  */
     function accInfoIns(){
    	 $("#dlg_accinfoIns").dialog('open').dialog('setTitle','업체정보 등록 확인');
    	 $("#c_region_code").textbox('setValue',$("#region_code").val());
  		 $("#c_sub_area_name").textbox('setValue',$("#sub_area_name").val());
 		 $("#c_Mem_num").textbox('setValue',$("#Mem_num").val());//인원
 		 $("#c_Acc_name").textbox('setValue',$("#Acc_name").val());//업체명
 		 $("#c_Addr").textbox('setValue',$("#Addr").val());
     }
/*업체정보등록 정보를 입력하는 주화면에서 입력한 값을 확인하는 부화면창에 값을 넘기기  */
</script>


</head>
<body>

<!--업체 정보 입력하는 화면 시작-->
<form id="f_jibnawaAccinfoIns">
	<div id="p1" class="easyui-panel" title="업체정보등록" 
        style="width:800px;height:200px;padding:10px;background:#addddd;"
        data-options="iconCls:'icon-ok', collapsible:true,maximizable:true">
<table>
<tr>
	<td>
	<br>
	<br>
	<br>
	<label width="30px">지역</label>
		<br>
	<input id="region_code" name="region_code2" 
						data-options="valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME'"
	 class="easyui-combobox" style="width:150px">
	</td>
	
	<td> 
	<br>
	<br>
	<br>
	<label width="30px">세부지역</label>
		<br>
	<input id="sub_area_name" name="region_code" 
					data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'"
	class="easyui-combobox" style="width:150px">	 
</td>
	
<td>
	<br>
	<br>
	<br>
	<label width="30px">카테고리</label>
	<br>
<select id="Mem_num" name="category_code" class="easyui-combobox" style="width:100px"">
    <option value="1">숙박</option>
    <option value="2">렌트</option>
    <option value="3">숙박/렌트</option>
    
</select>
</td>


<td>
	<br>
	<br>
	<br>
	<label width="30px">업체명</label>  
	<br>  
	<input id="Acc_name" name="acc_name" class="easyui-textbox" style="width:150px">
	</td>

<td>
	<br>
	<br>
	<br>
	<label width="30px">업체주소</label>  
	<br>  
	<input id="Addr" name="addr" class="easyui-textbox" style="width:150px">
	</td>
</tr>

<td colspan="2">
        <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="f_Accsubmit()">등록</a>
      </td>
	  <!--  -->
	  </td>
</table>
	</div>
</form>
<!--(주)업체 정보 입력하는 화면 끝-->

<!-- ---------------------------------------------------------------------------  -->

<!--(주)화면에서 사용자가 입력한 값을 (부)화면에서 받아 확인하는 화면  -->
<div id="dlg_accinfoIns" buttons="dlg_accinfoIns" data-options="iconCls:'icon-tip'" class="easyui-dialog" closed="true" style="width:300px">
	<form id="f_accinfoIns" method="post" style="padding:20px 50px">
	
	<div style="margin-bottom:10px">
		<input id="c_region_code"
		class="easyui-textbox" multiline="true" label="　지역　" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_sub_area_name" 
		class="easyui-textbox" label="　세부지역" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Mem_num"
		class="easyui-textbox" multiline="true" label="　인원　" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Acc_name"
		class="easyui-textbox" label="　업체명" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_Addr"
		class="easyui-textbox" label="　업체주소" required="true" style="width:200px">
	</div>
	
	
	<td colspan="2">
         <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onClick="">등록</a>
         <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dlg_accinfoIns').dialog('close')">돌아가기</a>
    </td>
 </form>
<!--(주)화면에서 사용자가 입력한 값을 (부)화면에서 받아 확인하는 화면  -->
</body>
</html>