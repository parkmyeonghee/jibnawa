<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<!-- <meta charset="UTF-8"> -->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>경매 상품 등록</title>
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
   

   

                     alert("경매성공");
                     $("#f_jibnawaIns").attr("method", "post");//#폼아이디
                     $("#f_jibnawaIns").attr("action", './jibnawaInsert.kosmo');
                     $("#f_jibnawaIns").submit();
              
                
                	  
        
            	   
          
   }/////////////////////////////////////////////////////////////////////////////end of f_submit()

/* 콤보 박스 (Region_code => Main_area_name 주 지역 정보) */
	$(document).ready(function(){
    	$("#region_code").combobox(
         {
        url: './getRegioncodeList.kosmo'
        , onSelect : function(rec) {
        //alert("주지역:"+rec.MAIN_AREA_NAME); 
        test(rec.MAIN_AREA_NAME);
        								region_code = rec.MAIN_AREA_NAME;

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
	}
/* 콤보 박스 (Sub_area_name 세부지역정보) */

/* Datebox 'YYYY-MM-DD'형식으로 포멧 구간 */
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
/* Datebox 'YYYY-MM-DD'형식으로 포멧 구간 */

/* Datebox 구현 구간 */
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
/* Datebox 구현 구간 */

/*경매상품등록 정보를 입력하는 주화면에서 사용자가 작성한 값을 확인하는 부화면창에 값을 넘기기  */
     function goGo(){
    	$("#dlg_infoIns").dialog('open').dialog('setTitle','경매 등록 확인');
   	   
 		$("#c_region_code").textbox('setValue',$("#region_code").val());
 		$("#c_sub_area_name").textbox('setValue',$("#sub_area_name").val());
 		$("#c_auc_comm_bigo").textbox('setValue',$("#auc_comm_bigo").val());
 		$("#c_check_in_date").textbox('setValue',$("#check_in_date").val());
 		$("#c_check_out_date").textbox('setValue',$("#check_out_date").val());
 		$("#c_bid_cost").textbox('setValue',$("#bid_cost").val());
 		$("#c_auc_start_date").textbox('setValue',$("#auc_start_date").val());
 		$("#c_auc_end_date").textbox('setValue',$("#auc_end_date").val());
     }
/*경매상품등록 정보를 입력하는 주화면에서 사용자가 작성한 값을 확인하는 부화면창에 값을 넘기기  */
    
    </script>
</head>
<body>
<!------------------(주화면)경매상품정보 입력화면 --------------------------->
<form id="f_jibnawaIns">
<div id="p1" class="easyui-panel" title="숙박" 
        style="width:800px;height:200px;padding:10px;background:#addddd;"
        data-options="iconCls:'icon-ok', collapsible:true,maximizable:true">
    <p>경매시작</p>
<table>
<tr>
	<td>
		<label width="30px">지역</label>
	<br>
		<input id="region_code" name="region_code2" 
					data-options="valueField:'MAIN_AREA_NAME',textField:'MAIN_AREA_NAME'"
 					class="easyui-combobox" style="width:150px">
	</td>

	<td> 
		<label width="30px">세부지역</label>
	<br>
		<input id="sub_area_name" name="region_code" 
					data-options="valueField:'REGION_CODE',textField:'SUB_AREA_NAME'"
					class="easyui-combobox" style="width:150px">	 
	</td>
	<td>
		<label width="30px">날짜</label>
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
		<label width="30px">낙찰금액</label>  
	<br>  
	    <input id="bid_cost" name="bid_cost" class="easyui-numberbox" style="width:150px">
	</td>
	<td>
		<label width="30px">인원</label>
	<br>
<select id="auc_comm_bigo" name="auc_comm_bigo" class="easyui-combobox" style="width:150px"">
    <option value="1">1인실</option>
    <option value="1~2">1~2인</option>
    <option value="3~4">3~4인실</option>
    <option value="8">8인실</option>
    <option value="12~18">12~18인실</option>
</select>
	</td>
	<td>
		<label width="50px">경매기간</label>
	<br>
		<input id="auc_start_date" name="auc_start_date" class="easyui-datebox" required="required" style="width:150px">
	</td>
	<td>
	<br>
		<input id="auc_end_date" name="auc_end_date" class="easyui-datebox" required="required" style="width:150px">
	<br>
<td colspan="2">
      <a href="#" class="easyui-linkbutton" iconCls="icon-redo" onclick="f_submit()">경매시작</a>
</td>
	</td>
</tr>
</table>
</div>
<!------------------(주화면)경매상품정보 입력화면 --------------------------->

<!--(주)화면에서 사용자가 입력한 값을 (부)화면에서 받는 화면  -->
<div id="dlg_infoIns" buttons="dlg_infoIns" data-options="iconCls:'icon-tip'" class="easyui-dialog" closed="true" style="width:300px">
	<form id="f_infoIns" method="post" style="padding:20px 50px">
	
	<div style="margin-bottom:10px">
		<input id="c_region_code"
		class="easyui-textbox" multiline="true" label="　지역　" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_sub_area_name" 
		class="easyui-textbox" label="　세부지역" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_comm_bigo"
		class="easyui-textbox" multiline="true" label="　인원　" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_check_in_date"
		class="easyui-textbox" label="　숙박날짜" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_check_out_date"
		class="easyui-textbox" label="　숙박날짜" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_bid_cost"
		class="easyui-textbox" multiline="true" label="　낙찰금액" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_start_date" 
		class="easyui-textbox" multiline="true" label="　경매기간" required="true" style="width:200px">
	</div>
	
	<div style="margin-bottom:10px">
		<input id="c_auc_end_date"
		class="easyui-textbox" multiline="true" label="　경매기간" required="true" style="width:200px">
	</div>
	<td colspan="2">
         <a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onClick="f_submit()">경매등록</a>
         <a href="#" class="easyui-linkbutton" iconCls="icon-undo" plain="true" onclick="javascript:$('#dlg_infoIns').dialog('close')">돌아가기</a>
    </td>
	</form>
<!--(주)화면에서 사용자가 입력한 값을 (부)화면에서 받는 화면  -->
</body>
</html>