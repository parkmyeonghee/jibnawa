<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.List, com.jibnawa.member.JibnawaMemberVO"%>
<%@ page import="org.json.simple.JSONValue"%>

<%
   //json �������� ������ �ޱ�
	List<JibnawaMemberVO> deptList = 
	//getAttribute("jibnawaMember"); ��  controller.java ���� //pMap.addAttribute("jibnawaMember",jibnawaMember);�� �����ϰ� ���߱�
	(List<JibnawaMemberVO>)request.getAttribute("jibnawaMember");
	String jsonJib = JSONValue.toJSONString(deptList);
	//�����͸� �׸��忡 �����ϴ� �κ� myGrid.setList(); ���� json �����͸� �޾� ��  ��ũ��Ʈ���� JSP ������ ���� �� �ְ� ����  �� myGrid.setList( < %= jsonJib % >);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1.0, minimum-scale=1" />
<title>AXGrid - AXISJ</title>
<link rel="shortcut icon" href="../axisj/ui/axisj.ico" type="image/x-icon" />
<link rel="icon" href="../axisj/ui/axisj.ico" type="image/x-icon" />
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="../axisj/ui/AXJ.png" />
<link rel="apple-touch-icon-precomposed" href="../axisj/ui/AXJ.png" />
<meta property="og:image" content="/samples/_img/axisj_sns.png" />
<meta property="og:site_name" content="Axis of Javascript - axisj.com" />
<meta property="og:description" id="meta_description"
	content="Javascript UI Library based on JQuery" />

<!-- css block -->
<link rel="stylesheet" type="text/css" href="../axisj/ui/arongi/page.css">
<link rel="stylesheet" type="text/css"
	href="../axisj/ui/arongi/AXJ.min.css" />

<style type="text/css">
</style>
<!-- css block -->

<!-- js block -->
<script type="text/javascript" src="../axisj/jquery/jquery.min.js"></script>
<script type="text/javascript" src="../axisj/dist/AXJ.min.js"></script>
<script type="text/javascript" src="../axisj/lib/AXGrid.js"></script>
<script type="text/javascript" src="../axisj/page.js"></script>
<script type="text/javascript" src="pageTab.js"></script>
<!-- js block -->

<!-- prettify block -->
<link type="text/css" rel="stylesheet"
	href="http://newdoc.axisj.com/styles/prettify-tomorrow.css">
<script src="http://newdoc.axisj.com/scripts/prettify/prettify.js"></script>
<script src="http://newdoc.axisj.com/scripts/prettify/lang-css.js"></script>
<!-- prettify block -->
<script id="jscode">
    /**
     * Require Files for AXISJ UI Component...
     * Based        : jQuery
     * Javascript   : AXJ.js, AXGrid.js, AXInput.js, AXSelect.js
     * CSS          : AXJ.css, AXGrid.css, AXButton.css, AXInput.css, AXSelecto.css
     */
    var pageID = "autoHeight";
    var fnObj = {
        pageStart: function(){
            fnObj.grid.bind();
        },
        grid: {
            target: new AXGrid(),
            bind: function(){
                window.myGrid = fnObj.grid.target;
                var getColGroup = function(){
                	//JSON key name�� ���� �ϰ� ���߱�
                    return [
                            {key:"MEM_EMAIL", label:"MEM_EMAIL", width:"100", align:"center"},
                            {key:"MEM_PW", label:"MEM_PW", width:"100", align:"center"},
                            {key:"MEM_EMAIL", label:"MEM_EMAIL", width:"100", align:"center"},
                            {key:"MEM_NICKNAME", label:"MEM_EMAIL", width:"100", align:"center"},
                            {key:"MEM_PHONE_F", label:"MEM_PHONE_F", width:"100", align:"center"},
                            {key:"MEM_PHONE_M", label:"MEM_PHONE_M", width:"100", align:"center"},
                            {key:"MEM_PHONE_M", label:"MEM_PHONE_E", width:"100", align:"center"}
                    ];
                };
                myGrid.setConfig({
                    targetID : "AXGridTarget",
                    //sort:false, ������ ������ ���� ��� (tip
                    //fitToWidth:true, // �ʺ� �ڵ� ����
                    height:"auto",
                    colGroup : getColGroup(),
                    colHeadAlign: "center", // ����� �⺻ ���� �� ( colHeadAlign �� �����ϸ� colGroup ���� ������ ������ ���õǰ� colHeadAlign : false �̰ų� ������ colGroup ���� ������ �Ӽ��� ����˴ϴ�.
                    body : {
                        onclick: function(){
                            toast.push(Object.toJSON({index:this.index, r:this.r, c:this.c, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                        },
                        /* ondblclick �����ϸ� onclick �̺�Ʈ�� 0.25 �� ���� �߻� �˴ϴ�. ���� �Ͻñ� �ٶ��ϴ�. */
                        ondblclick: function(){
                            toast.push("����Ŭ��");
                            //toast.push(Object.toJSON({index:this.index, r:this.r, c:this.c, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                        },
                        addClass: function(){
                            // red, green, blue, yellow, white, gray
                            if(this.index % 2 == 0){
                                return "blue";
                            }else{
                                return "white";
                            }
                        }
                    },
                    page: {
                        display: false,
                        paging: false
                    }
                });
                
                // JSON ���
                myGrid.setList(<%=jsonJib%>);
                myGrid.setDataSet({});
                trace(myGrid.getSortParam());
            },
            getExcel: function(type){
                var obj = myGrid.getExcelFormat(type);
                trace(obj);
                $("#printout").html(Object.toJSON(obj));
            }
        }
    };
    jQuery(document.body).ready(function() {
        fnObj.pageStart();
    });
    </script>
</head>

<body>

	<div id="AXPage">

		<div id="AXPageBody" class="SampleAXSelect">
			<div id="demoPageTabTarget" class="AXdemoPageTabTarget"></div>
			<div class="AXdemoPageContent">

				<div id="grid0">
					<div class="title">
						<h1>AXGrid (autoHeight)</h1>
					</div>
					<h2>height �Ӽ��� "auto" ���� ����ϸ� �׸����� ���̰� ���뿡 ���缭 �þ�ϴ�.</h2>

					<div id="AXGridTarget"></div>

					<div style="padding: 10px;">

						<input type="button" value="forExcel html" class="AXButton"
							onclick="fnObj.grid.getExcel('html');" /> <input type="button"
							value="forExcel json" class="AXButton"
							onclick="fnObj.grid.getExcel('json');" /> <input type="button"
							value="resetHeight : 300px" class="AXButton"
							onclick="$('#AXGridTarget').css({height:300});myGrid.resetHeight();" />
						<input type="button" value="resetHeight : 600px" class="AXButton"
							onclick="$('#AXGridTarget').css({height:600});myGrid.resetHeight();" />
					</div>
				</div>

				<pre id="pretty" class="prettyprint linenums"></pre>

				<div id="printout"></div>

			</div>
		</div>

	</div>

</body>
</html>
