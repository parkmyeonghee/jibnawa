<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="../css/partner/login.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.11.1.js" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/_jquery/plugin/jquery.cookie.js" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/_lib/base64.js?20140810_1" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/_jquery/plugin/jquery.sha1.js?20140810_1" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/_jquery/plugin/jquery.i18n.properties.js?20140810_1" type="text/javascript"></script>
<!-- account member -->
<script src="http://biz.wemakeprice.com/js/utils.js?20140810_1" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/account/account_v2.js?20140810_1" type="text/javascript"></script>
<script src="http://biz.wemakeprice.com/js/account/login_v2.js?20140810_1" type="text/javascript"></script>
<script type="text/javascript">
$.cookie('auth_page', '/partner/login', {path: '/'});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<div id="login_wrap">
    <h1 class="hidden">위메프 파트너 로그인</h1>

    <div id="slides" class="clearfix">
        <div class="wrap-text">
            <ul id="js-visual-text" class="visual-text">
                <li class="txt1">
                    <img class="txt-img1 text-active" src="//image.wemakeprice.com/images/partner/login/visual_text0.png" alt="위메프는">
                    <img class="txt-img2 text-active" src="//image.wemakeprice.com/images/partner/login/visual_text1_1-v1.png" alt="2,000만 구매 회원이">
                    <img class="txt-img3 text-active" src="//image.wemakeprice.com/images/partner/login/visual_text1_2.png" alt="있습니다.">
                    <img class="txt-img4 text-active" src="//image.wemakeprice.com/images/partner/login/visual_text1_3-v1.png" alt="구매력을 갖춘 2,000만 고객을 만나실 수 있습니다.">
                </li>
                <li class="txt2">
                    <img class="txt-img1" src="//image.wemakeprice.com/images/partner/login/visual_text2a_0.png" alt="위메프에서는">
                    <img class="txt-img2" src="//image.wemakeprice.com/images/partner/login/visual_text2a_1.png" alt="누구나 베스트셀러가">
                    <img class="txt-img3" src="//image.wemakeprice.com/images/partner/login/visual_text2a_2.png" alt="될 수 있습니다.">
                    <img class="txt-img4" src="//image.wemakeprice.com/images/partner/login/visual_text2a_3.png" alt="좋은 제품, 좋은 가격만으로 노출도를 높일 수 있습니다.">
                </li>
                <li class="txt3">
                    <img class="txt-img1" src="//image.wemakeprice.com/images/partner/login/visual_text0.png" alt="위메프는">
                    <img class="txt-img2" src="//image.wemakeprice.com/images/partner/login/visual_text3_1.png" alt="당신의 성공을">
                    <img class="txt-img3" src="//image.wemakeprice.com/images/partner/login/visual_text3_2.png" alt="믿습니다.">
                    <img class="txt-img4" src="//image.wemakeprice.com/images/partner/login/visual_text3_3.png" alt="지금 간편하게 가입하고, 손 쉽게 판매하세요.">
                </li>
            </ul>

            <a href="/partner/join/step1" id="js-btn-join" class="btn-join btn-img1"><span>가입하기</span></a>
        </div>

        <ol id="js-visual-pager" class="visual-pager">
            <li><a href="javascript:;" class="pager-link pager-active">1</a></li>
            <li><a href="javascript:;" class="pager-link">2</a></li>
            <li><a href="javascript:;" class="pager-link">3</a></li>
        </ol>
        <ul id="js-visual-img" class="visual-img">
            <li class="img1 in">img_visual1</li>
            <li class="img2">img_visual2</li>
            <li class="img3">img_visual3</li>
        </ul>
    </div>

    <div id="contents">
        <div id="cnt_login">
            <fieldset>
                <legend class="hidden">로그인정보 입력 폼</legend>
                <div class="login-form">
                    <div class="item">
                        <label class="label-iogin" for="login_uid">파트너 아이디</label>
                        <input type="text" id="login_uid" name="login_uid" maxlength="12" tabindex="1" class="input-login" value="">
                    </div>
                    <div class="item">
                        <label class="label-iogin" for="login_upw_biz">비밀번호</label>
                        <input type="password" id="login_upw_biz" name="login_upw" maxlength="15" tabindex="2" class="input-login">
                    </div>
                    <button type="submit" id="loginConfirmBtn_biz" tabindex="4" class="btn-login"><span>로그인</span></button>
                </div>
                <p id="login_error"></p>

                <ul class="login-option clearfix">
                    <li>
                        <label class="label-save" for="uidsave">아이디저장</label>
                        <input type="checkbox" id="uidsave" name="uidsave" tabindex="3" value="1" class="input-save" >
                        <input id="uhs" name="uhs" type="hidden">
                    </li>
                    <li><a href="javascript:openWin('/member/lost/id/popup/');" class="emp">아이디찾기</a></li>
                    <li><a href="javascript:openWin('/member/lost/pw/popup/');" class="emp">비밀번호찾기</a></li>
                    <li><a href="/partner/join/step1" class="emp">회원가입</a></li>
                </ul>
            <fieldset>
        </div>

        <div id="footer">
            <div class="footer-inner">
                <ul>
                    <li>
                        파트너센터 1644-4796&nbsp;&nbsp;평일 9:00~18:00&nbsp;&nbsp;토요일 10:00~17:00&nbsp;&nbsp;점심시간 12:00~13:00&nbsp;&nbsp;일요일/공휴일 휴무
                    </li>
                    <li>
                        본 시스템은 익스플로러 10.0 이상, 크롬, 파이어폭스에 최적화되어 있습니다.
                    </li>
                </ul>
                <a href="http://company.wemakeprice.com/wmp/customer" target="_blank" class="btn-ethics">윤리제보센터</a>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(document).ready(function() {
    // login_banner();
    $('#login_uid').focus();

    var i_text = $('.item .input-login');
    i_text
        .focus(function(){
            $(this).prev('.label-iogin').css('visibility','hidden');
        })
        .blur(function(){
            if($(this).val() == ''){
                $(this).prev('.label-iogin').css('visibility','visible');
            } else {
                $(this).prev('.label-iogin').css('visibility','hidden');
            }
        })
        .change(function(){
            if($(this).val() == ''){
                $(this).prev('.label-iogin').css('visibility','visible');
            } else {
                $(this).prev('.label-iogin').css('visibility','hidden');
            }
        })
        .blur();


    // INTRO 초기화
    BizIntro.initialize();
});
function openWin(url){
    window.open(url,'WeMakePrice','status=0,menu=0');
}

</script>

<script type="text/javascript" src="/js/account/intro.js?20150812_1"></script>

<script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-18774526-1']);
_gaq.push(['_setDomainName', 'wemakeprice.com']);
_gaq.push(['_addIgnoredRef', 'wemakeprice.com']);
_gaq.push(['_addIgnoredRef', 'wemakeprice.co.kr']);
_gaq.push(['_setCampaignCookieTimeout', 0]);
_gaq.push(['_trackPageview']);
//_gaq.push(['_trackPageLoadTime']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>

</body>
</html>