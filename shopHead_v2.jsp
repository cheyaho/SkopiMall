<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="framework" uri="http://www.skcc.com/ctl/framework" %>
<%@ taglib prefix="ui" uri="http://www.skcc.com/ctl/ui" %>
<%@ page import="com.skopi.front.common.util.SkopiMemberInfo"%>
<%
	SkopiMemberInfo sessionMemberInfo = (SkopiMemberInfo) session.getAttribute("memberSession");
	
	int memberCd = 0;
	if(sessionMemberInfo != null){
		memberCd = sessionMemberInfo.getMembercd();
	} 
%>
<framework:behind bean="com.skopi.front.common.login.behind.LoginBehind"/>

<script type="text/javascript"> 
	//로그아웃
	function goLogout(){
		var frm = document.myform;
		frm.mode.value = "logout";
		frm.submit();
	}

	function popTutorial() {
		var tutorial = window.open('/web/jsp/front/tutorial/SkopiTutorialMain.jsp', '', 'width=998, height=680');
		tutorial.focus();
	}

	function winPop(url, name, feature){
		var pop = window.open(url, name, feature);
		pop.focus();
	}

	//공지사항 상세조회
	function fncNoticeDetail(ptcCttSeq){
		var frm = document.getElementById('noticeParamForm');
		frm.ptcCttSeq.value = ptcCttSeq;
		frm.action = "/web/jsp/front/bbs/PrintNoticeDetailR.jsp"
		frm.submit();
	}

	// Global Navigation Handler 
	var GlobalMenu = function(){
		var gnb = $("#globalMenu");
		var oneDepthMenu = $(gnb).find(".oneDepth");
		var twoDepthMenu = $(oneDepthMenu).find(".sub_nav_box");
		var subBg = $(".sub_bg");
		$(oneDepthMenu).hover(
				function(){
					$(subBg).queue('fx',[]).stop();
					$(twoDepthMenu).queue('fx',[]).stop();
					$(subBg).animate({height:'270px'}, 200);	
					$(twoDepthMenu).animate({height:'250px'}, 300);
				},
				function(){
					$(subBg).queue('fx',[]).stop();
					$(twoDepthMenu).queue('fx',[]).stop();
					$(subBg).animate({height:'0'}, 400);	
					$(twoDepthMenu).animate({height:'0'}, 200);			
				}
			);
	};
	
	function imgOnOver(obj){ // 이미지를 obj로 받아서 속성 src를 '_on', '_off'로 변경함
		var _this = obj;
		var chSrc;
		var _src = $(obj).attr('src');
		var _srcExt = _src.split('_'); 
		var len = $(_srcExt).length-1;
		var ext = getExt(_srcExt[len]);
		if(_srcExt[len] == "on."+ext){
			chSrc = _src.replace('_on.'+ext, '_off.'+ext);
		}else if(_srcExt[len] == "off."+ext){
			chSrc = _src.replace('_off.'+ext, '_on.'+ext);
		}else { 
			chSrc = _src;
		}
		$(_this).attr('src', chSrc);
		
		function getExt(fn){
			var spFn = fn.split('.');
			var fnExt = spFn[spFn.length-1];
			return fnExt;
		}
	}
	
	function fncCouponPop(cid){
		<c:if test="${empty usrInfo}">
			alert("로그인을 해주세요.");
			location.href="https://www.skopi.com/web/jsp/front/SkopiLogin.jsp?returnUrl=https://www.skopi.com/web/jsp/front/Main.jsp";
		</c:if>
    	if(cid=="coupang"){	
			<c:if test="${not empty usrInfo}">
    			window.open('/web/jsp/front/order/myshop/CoupangCpnPopupC.jsp?memberCd=<%=memberCd%>','coupang','width=440,height=320');
			</c:if>	    
    	}else{
		    <c:if test="${not empty usrInfo}">
	        		window.open('/web/jsp/front/order/myshop/CouponPopupC.jsp?memberCd=<%=memberCd%>','myshop','width=440,height=320');
	    	</c:if>	    	
    	}
    }
	
	
	$(document).ready(function(){
		GlobalMenu();
		/*
		$("#globalMenu > .oneDepth > li").hover(
			function(){
				imgOnOver($(this).find('> a > img'));
			},
			function(){
				imgOnOver($(this).find('> a > img'));
			}
		);
		*/
		
		// 메인메뉴에 이벤트 뱃지 넣기
		if(checkEventDate('20210501', '20211130')){ //5월 EVENT 날짜 체크
			insertBadge('menu02', '40%', 'red');  // 포토북
			insertBadge('menu09', '30%', 'red');  // 플랫 
			insertBadge('menu03', '20%', 'red');  // 앨범 
			insertBadge('menu06', '40%', 'red');  // 팬시
			insertBadge('menu10', '30%', 'red');  // 졸업앨범 
		}else if(checkEventDate('20211201', '20221130')){ //5월 EVENT 날짜 체크
			insertBadge('menu02', '50%', 'red');  // 포토북
			//insertBadge('menu04', '20%', 'red');  // 포토달력 
			insertBadge('menu09', '10%', 'red');  // 플랫 
			insertBadge('menu03', '10%', 'red');  // 앨범 
			insertBadge('menu06', '20%', 'red');  // 팬시
			insertBadge('menu10', '10%', 'red');  // 졸업앨범 
		}else if(checkEventDate('20221201', '20230831')){ //5월 EVENT 날짜 체크
			insertBadge('menu02', '10%', 'red');  // 포토북
			//insertBadge('menu04', '20%', 'red');  // 포토달력 
			insertBadge('menu09', '10%', 'red');  // 플랫 
			insertBadge('menu03', '10%', 'red');  // 앨범 
			insertBadge('menu06', '20%', 'red');  // 팬시
			insertBadge('menu10', '10%', 'red');  // 졸업앨범 
			insertBadge('menu11', '20%', 'red');  // 이야기북 
		}else if(checkEventDate('20230901', '20240231')){ //9월 EVENT 날짜 체크
			insertBadge('menu02', '10%', 'red');  // 포토북
			//insertBadge('menu04', '20%', 'red');  // 포토달력 
			insertBadge('menu09', '10%', 'red');  // 플랫 
			insertBadge('menu03', '10%', 'red');  // 앨범 
			insertBadge('menu06', '20%', 'red');  // 팬시
			insertBadge('menu10', '10%', 'red');  // 졸업앨범 
			insertBadge('menu11', '20%', 'red');  // 이야기북 
		}
		
		
		thuEventCheck(); //목요이벤트 사진인화 뱃지
		
		if($('#shopHeader').hasClass('winter')){
			$('h1 a img').attr('src', '/web/images/front/common/header/2013/logo_w.png');
		}
	});
	
	$(window).ready(function(){
		if(document.getElementById('ContentWrap')){
			bh = $('body').height();
			wh = $(window).height();
			//if(bh<wh){
				//$('#ContentWrap').height(wh-317);
			//}
		}
	});
	
	function thuEventCheck(){
		var _date = new Date();
		if(_date.getDay() == 4){
			if(checkEventDate('20180201', '20180430')){
				insertBadge('menu01', '100', 'red');
			}else{
				insertBadge('menu01', '160', 'red');
			}
		}
	}
</script>
<div id="Wrapper">

<div class="tab_family">
	<ul>
		<li class="active">스코피</li>
		<li><a href="http://www.skopiad.com" target="_blank">스코피AD</a></li>
		<li><a href="http://magic.skopi.com" target="_blank">스코피렌탈</a></li>
	</ul>
</div>

<div id="shopHeader" class="">
	<form name="myform"><input type="hidden" name="one" value="" ><input type="hidden" name="mode" value="" ></form>
	
	<div class="header_top">
		<h1><a href="/web/jsp/front/Main.jsp" onclick="goHome(); return false;"><img src="/web/images/front/common/header/2013/logo.png" alt="오늘날의 사진생활 Skopi" /></a></h1>
		
		<ul class="top_link">
			<li><a href="/web/jsp/front/bbs/PrintNoticeListR.jsp">공지사항</a></li>
			<li><a href="/web/jsp/front/bbs/EventListR.jsp?liveGubun=Y">이벤트</a></li>
			<li><a href="http://www.skopi.com/web/jsp/front/custcent/servcent/ServiceHelpListR.jsp">도움말</a></li>
			<!-- li><a href="http://magic.skopi.com" target="_blank" class="skopiShop">SK매직 렌탈몰</a></li-->
		</ul>
		<div class="eventTag"><a href="/web/jsp/front/bbs/EventDetailR.jsp?eventseq=387&amp;liveGubun=Y"><img src="/web/images/front/main/2013/tag_deliveryFree.png" alt="사진인화 3만원 이상 무료배송" /></a></div>
		<!--div class="eventTag"><img src="/web/images/front/common/header/newYear/tag_newYear.png" alt="2015 Happy New Year" /></div-->
	</div>
	
	<div id="globalMenu" class="after">
		<ul class="oneDepth" class="after">
			<li id="menu01" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/photo/GeneralPhotoR.jsp?treePath=0-57-64" class="hover">사진인화</a>
				<div class="sub_nav_box" id="sub_menu01">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/photo/GeneralPhotoR.jsp?treePath=0-57-64"><span>일반인화</span></a></li>
						<li><a href="/web/jsp/front/prodcat/photo/IdPhotoR.jsp?prodGrpCd=N88SKOFastID" onclick="fncMoveProdDetail('N88SKOFastID'); return false;"><span>증명사진</span></a></li>
						<li><a href="/web/jsp/front/prodcat/photo/MiddlePhotoR.jsp?treePath=0-57-66"><span>대형인화패키지</span></a></li>
						<li><a href="/web/jsp/front/prodcat/photo/LongLifePhoto.jsp?treePath=0-57-167"><span>장수액자</span></a></li>
						<!--  li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKODPSPP" onclick="fncMoveProdDetail('N88SKODPSPP'); return false;"><span>스마트폰사진</span></a></li-->
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKODPWALLET" onclick="fncMoveProdDetail('N88SKODPWALLET'); return false;"><span>디자인포토</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOSTKNM" onclick="fncMoveProdDetail('N88SKOSTKNM'); return false;"><span>스티커사진</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu02" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-58-70" class="hover">포토북</a>
				<div class="sub_nav_box" id="sub_menu02">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPB8RH" onclick="fncMoveProdDetail('N88SKOPB8RH'); return false;"><span>포토북 8x8 하드</span> </a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPBA4H" onclick="fncMoveProdDetail('N88SKOPBA4H'); return false;"><span>포토북 A4 하드</span> </a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPBA5H" onclick="fncMoveProdDetail('N88SKOPBA5H'); return false;"><span>포토북 A5 하드</span> </a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPB8RS" onclick="fncMoveProdDetail('N88SKOPB8RS'); return false;"><span>포토북 8x8 소프트</span> </a>	</li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPBA4S" onclick="fncMoveProdDetail('N88SKOPBA4S'); return false;"><span>포토북 A4 소프트</span> </a>	</li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPBA5S" onclick="fncMoveProdDetail('N88SKOPBA5S'); return false;"><span>포토북 A5 소프트</span> </a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOMGZ" onclick="fncMoveProdDetail('N88SKOMGZ'); return false;"><span>포토진</span> </a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-58-70-163"><span>개별배송</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu09" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-134" class="hover">플랫인화북</a>
				<div class="sub_nav_box" id="sub_menu03">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-134-135"><span>포토</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-134-136"><span>포크로스</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-134-137"><span>PU</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-134-165"><span>인화북</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu11" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-184" class="hover">이야기북</a>
				<div class="sub_nav_box" id="sub_menu03">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOSTO10R" onclick="fncMoveProdDetail('N88SKOSTO10R'); return false;""><span>이야기북 10x10</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOSTO8R" onclick="fncMoveProdDetail('N88SKOSTO8R'); return false;""><span>이야기북 8x8</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOSTO57" onclick="fncMoveProdDetail('N88SKOSTO57'); return false;""><span>이야기북 5x7</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu03" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60" class="hover">포토앨범</a>
				<div class="sub_nav_box" id="sub_menu03">
					<ul class="twoDepth">
						<!-- li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-83"><span>프리미엄앨범</span></a></li -->
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-84"><span>10x10</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-85"><span>8x8</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-86"><span>6x6</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-87"><span>5x5</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-60-88"><span>미니</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu04" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-59" class="hover">포토달력</a>
				<div class="sub_nav_box" id="sub_menu04">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCALPD" onclick="fncMoveProdDetail('N88SKOCALPD'); return false;"><span>양면인화달력</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCALD" onclick="fncMoveProdDetail('N88SKOCALD'); return false;"><span>양면달력</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCALS" onclick="fncMoveProdDetail('N88SKOCALS'); return false;"><span>단면달력</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCALTABLE" onclick="fncMoveProdDetail('N88SKOCALTABLE'); return false;"><span>대형탁상달력</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCALV" onclick="fncMoveProdDetail('N88SKOCALV'); return false;"><span>세로탁상달력</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88HSCALWALL" onclick="fncMoveProdDetail('N88HSCALWALL'); return false;"><span>벽걸이달력</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu05" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-61" class="hover">돌잔치</a>
				<div class="sub_nav_box" id="sub_menu05">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-61-90"><span>보드용품</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-61-91"><span>배너용품</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-61-92"><span>안내장</span></a></li>
					</ul>
				</div>
			</li>
			<li id="menu06" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-62" class="hover">포토액자</a>
				<div class="sub_nav_box" id="sub_menu05">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-62-130"><span>포토액자</span></a></li>
						<li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-62-93"><span>포토팬시</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKODPPCARD" onclick="fncMoveProdDetail('N88SKODPPCARD'); return false;"><span>포토엽서</span></a></li>
						<li class="last"><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOPNCARD" onclick="fncMoveProdDetail('N88SKOPNCARD'); return false;"><span>포토명함</span></a></li>
						<!-- li><a href="/web/jsp/front/prodcat/album/PhotoBookListR.jsp?treePath=0-62-161"><span>핸드폰케이스</span></a></li -->
					</ul>
				</div>
			</li>
			<li id="menu10" class="oneDepthMenu">
				<a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOYBF" class="hover">졸업앨범</a>
				<div class="sub_nav_box" id="sub_menu05">
					<ul class="twoDepth">
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOYBA" onclick="fncMoveProdDetail('N88SKOYBA'); return false;"><span>졸업앨범</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOYBF" onclick="fncMoveProdDetail('N88SKOYBF'); return false;"><span>플랫 졸업앨범</span></a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCLSAL" onclick="fncMoveProdDetail('N88SKOCLSAL'); return false;">학급앨범</a></li>
						<li><a href="/web/jsp/front/prodcat/common/SkinCoverListR.jsp?prodGrpCd=N88SKOCLSMJ" onclick="fncMoveProdDetail('N88SKOCLSMJ'); return false;">학급문집</a></li>
					</ul>
				</div>
			</li>
			<!-- <li id="menu07" class="oneDepthMenu episode">
				<a href="/web/jsp/front/bbs/SkopiEpisodeListR.jsp" class="hover">스코피 에피소드</a>
			</li> -->
		</ul>
	</div>
	<div class="gnbBack"><div class="sub_bg"></div></div>
	<span class="mobile_menu"><span></span></span>
</div>

	<!--  floating Banner  --> 
	<div id="floating" class="">
        <c:if test="${empty usrInfo}">
    		<div class="memberInfo">
    			<button type="button" onclick="goLogin()" class="button login">로그인</button>
    			<a href="https://www.skopi.com/web/jsp/front/custcent/member/MemberJoin.jsp" class="button joinus">회원가입</a>
    		</div>
    		<ul class="top_route">
    			<li><a href="#" onclick="goMyShop(); return false;">주문내역조회</a></li>
    			<li class="last"><a href="/web/jsp/front/order/webcart/WebCart.jsp">장바구니</a></li>
    		</ul>
		</c:if>
        <c:if test="${not empty usrInfo}">
    		<div class="memberInfo">
    			<p class="welcome"><span class="memberName"><span class="name"><c:out value="${usrInfo.MEMBERNAME}"/></span> 님</span> 반갑습니다.</p>
    			<span class="level">Lv. <c:out value="${usrInfo.MEMLEVEL}"/></span>
                <c:choose>
                <c:when test="${usrInfo.MEMLEVEL eq 'ORANGE'}">
					<p style="padding:3px 0 12px; display:none;"><a href="/web/jsp/front/premium/PremiumMembMain.jsp">프리미엄회원가입</a></p>
				</c:when>
                <c:otherwise><span class="endDate">(~<c:out value="${usrInfo.EDATE}"/>)</span></c:otherwise>
                </c:choose>
                <button class="btn_logout" onclick="goLogout();">로그아웃</button>
    		</div>
    		<ul class="top_route join">
    			<li><a href="/web/jsp/front/order/myshop/OrderListR.jsp">마이페이지</a></li>
    			<li><a href="#" onclick="goMyShop(); return false;">주문배송현황</a></li>
    			<li><a href="/web/jsp/front/order/myshop/CouponListR.jsp">쿠폰등록</a></li>
    			<li><a href="/web/jsp/front/order/myshop/SkopiMoneyListR.jsp">스코피머니상품권</a></li>
    			<li><a href="/web/jsp/front/order/webcart/WebCart.jsp">장바구니</a></li>
    			<li class="last"><a href="/web/jsp/front/order/webcart/WebStorage.jsp">주문보관함</a></li>
    		</ul>
		</c:if>
		
		<ul>
			<li class="noLine"><a href="/web/jsp/front/tutorial/SkopiTutorialSub01.jsp"><img src="/web/images/front/common/header/2013/quick_manual.png" alt="편집기 사용방법" /></a></li>
			<li><a href="/web/jsp/front/custcent/support/supportTip.jsp"><img src="/web/images/front/common/header/2013/quick_tip.png" alt="포토북 편집시 편리한 TIP" /></a></li>
			<li><a href="/web/jsp/front/custcent/servcent/InquiryC.jsp"><img src="/web/images/front/common/header/2013/quick_question.png" alt="1:1 문의하기" /></a></li>
			<li><a href="/web/jsp/front/custcent/pop/FindPaymentList.jsp" onclick="winPop('/web/jsp/front/custcent/pop/FindPaymentList.jsp', '', 'width=570, height=370, scrollbars=no'); return false;"><img src="/web/images/front/common/header/2013/quick_findAccount.png" alt="입금자를 찾습니다." /></a></li>
			<!-- <li><a href="/web/jsp/front/bbs/PrintNoticeDetailR.jsp?ptcCttseq=153" onclick="fncNoticeDetail('153'); return false;"><img src="/web/images/front/common/header/2013/quick_error.png" alt="오류메세지 대처방법" /></a></li> -->
			<!-- li><a href="/web/jsp/front/order/orderbbs/OrderBbsMain.jsp" onclick="winPop('/web/jsp/front/order/orderbbs/OrderBbsMain.jsp', '', 'width=1018, height=700, scrollbars=1'); return false;"><img src="/web/images/front/common/header/2013/quick_film.png" alt="필름스캔서비스" /></a></li-->
		</ul>		
	</div>
			
<script type="text/javascript">
// Floating Banner
$(document).ready(function(){
	resetFloating();
});

function resetFloating(){
	var offset = document.documentElement.scrollHeight;
		
	if (fncAgentCheck() != "mobile"){
		$("#floating").height(offset);
	}

	// console.log("floating : " + offset );
}
</script>
<form id="noticeParamForm" name="noticeParamForm" method="post">
	<input type="hidden" name="ptcCttSeq"/>
</form>
