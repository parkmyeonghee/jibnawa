<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />


	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1" />
	<title>binsSelect - AXISJ</title>

    <link rel="shortcut icon" href="../../axisj/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="../axisj/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../../axisj/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="../../axisj/ui/AXJ.png" />
    <meta property="og:image" content="/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="../../axisj/ui/arongi/page.css">
    <link rel="stylesheet" type="text/css" href="../../axisj/ui/arongi/AXJ.min.css">

    <script type="text/javascript" src="../../axisj/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="../../axisj/dist/AXJ.min.js"></script>
    <script type="text/javascript" src="../../axisj/lib/AXSelect.js"></script>

	<script src="http://newdoc.axisj.com/scripts/prettify/prettify.js"></script>
	<script src="http://newdoc.axisj.com/scripts/prettify/lang-css.js"></script>
	<link type="text/css" rel="stylesheet"  href="http://newdoc.axisj.com/styles/prettify-tomorrow.css">
    <!-- js block -->

	<style type="text/css">
	
	</style>
</head>
	
<body>

	<div id="AXPage">
		<div id="AXPageBody" class="SampleAXSelect">
	        <div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
			<div class="AXdemoPageContent">

				<div class="title"><h1>AXSelect onexpand</h1></div>
				<!-- s.axlayer 1 -->

				<select name="" class="AXSelect W100" id="ax-select1-01"></select>
				&nbsp;
				<select name="" class="AXSelect W100" id="ax-select11-02"></select>

			</div>
		</div>

	</div>

<script>
var pageID = "AXSelect-onexpand";
var fnObj = {
	pageStart: function(){
		var parent_code;
		var child_data = {
			"1": [
				{optionValue:1, optionText:"�߱�"},
				{optionValue:2, optionText:"��"},
				{optionValue:3, optionText:"�湫��"},
				{optionValue:4, optionText:"���ǵ�"}
			],
			"2": [
				{optionValue:1, optionText:"����"},
				{optionValue:2, optionText:"����"},
				{optionValue:3, optionText:"�ƹ���"},
				{optionValue:4, optionText:"�Ƶ�"}
			],
			"3": [
				{optionValue:1, optionText:"��Ӹ�"},
				{optionValue:2, optionText:"�ڵ��"},
				{optionValue:3, optionText:"��Ӵ�"},
				{optionValue:4, optionText:"��"}
			],
			"4": [
				{optionValue:1, optionText:"Ű����"},
				{optionValue:2, optionText:"���콺"},
				{optionValue:3, optionText:"�����"},
				{optionValue:4, optionText:"��Ʈ��"}
			]
		}


		// ����� ���� ���ϰ� AXConfig �Ӽ� ���
		$("#ax-select1-01").bindSelect({
			isspace: true,
			isspaceTitle: "-- ���� --",
			options:[
				{optionValue:1, optionText:"����"},
				{optionValue:2, optionText:"����"},
				{optionValue:3, optionText:"����"},
				{optionValue:4, optionText:"��ǻ��"}
			],
			onchange: function(){
				//trace("change : " + Object.toJSON(this));
				parent_code = this.optionValue;
				$("#ax-select11-02").bindSelectUpdateOptions([]);
			}
		});

		// ����� ����
		$("#ax-select11-02").bindSelect({
			ajaxlUrl:".."
			
			onexpand: function(callBack){
				callBack({
					options: (parent_code) ? child_data[parent_code] : []
				});
			},
			onchange: function(){
				trace("change : " + Object.toJSON(this));
			}
		});
	}
};
jQuery(document.body).ready(function(){
	fnObj.pageStart();
});
</script>

</body>
</html>		
