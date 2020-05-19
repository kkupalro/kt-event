<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html lang="ko" class=" cssanimations csstransitions cssanimations csstransitions">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>

	<!-- cfmClFooter -->
	<div id="cfmClFooter">
	
		<script type="text/javascript">
			kt.footer();
		</script>
		
		<style>/* 다이렉트 메뉴 서브 메뉴 수정 */
			#cfmClGnb .navigation .nav0 .depth2>li:first-child>a {
				letter-spacing: -1.5px;
			}
			/* 다이렉트 메뉴 추가 : 메뉴별 간격 40px#cfmClGnb .navigation .nav1>a{left: 108px;}#cfmClGnb .navigation .nav2>a{left: 233px}#cfmClGnb .navigation .nav3>a{left: 358px;}#cfmClGnb .navigation .nav4>a{left: 490px;}#cfmClGnb .navigation .nav5>a{left: 581px;}#cfmClGnb .navigation .nav6>a{left: 689px;}  */
				#cfmClGnb .navigation .nav0>a {
				font-family: "Noto Sans Regular";
			} /* IE9에서 간편납부 비노출 */
			.no-cssanimations .floating-menu .quick.menus a:first-child {
				display: none;
			} /* 빅배너 좌우이동버튼 하단 설명 문구 감춤(웹접근성) */
			.key-visual .bx-controls .bx-controls-direction a span {
				display: none;
				color: #bbb;
			} /* 패밀리 사이트 영역 길이 수정 */
			#cfmClFooter .family button.open+div {
				top: -150px !important;
				height: 110px !important;
			}
		</style>

		<div class="click-banner2 footer" style="display: none;"></div>

		<div class="column" style="height: 50px">
			<div class="inner group">
				<div class="address">
					사로나&nbsp; 서울특별시 서초구 효령로 176 (방배동)&nbsp;<br>
					박길준 | 홍성욱 | 김호영 | 송민재 | 유태준 | 이예은 | 이정민 | 홍다경
				</div>
				<p class="copyright">Copyright© 2020 ktds corp. All rights reserved.</p>
				<div class="partner">
					<img src="./images/common/favicon/ktds.png">
				</div>
			</div>
		</div>
		
	</div>
	<!-- /cfmClFooter -->

<!--  	<div class="recommdiv psn-recommdiv" style="display: block;">
		<div class="inner">
			<strong>추천메뉴</strong>
			<ul>
				<li class="billChargeTotalList">
					<a href="#">
						<span style="background-image: url('https://cfm.kt.com/images/area/A000000254/C000001510v7h4054.png');">데이터충전</span>
					</a>
				</li>
				<li class="billChargeTotalList">
					<a href="#">
						<span style="background-image: url('https://cfm.kt.com/images/area/A000000254/C000001511v7h4055.png');">내게맞는 요금제찾기</span>
					</a>
				</li>
				<li class="billChargeTotalList">
					<a href="#">
						<span style="background-image: url('https://cfm.kt.com/images/area/A000000254/C000001512v7h4056.png');">진행중인 이벤트</span>
					</a>
				</li>
				<li class="billChargeTotalList">
					<a href="#">
						<span style="background-image: url('https://cfm.kt.com/images/area/A000000254/C000001513v17h7172.png');">카카오페이 납부</span>
					</a>
				</li>
			</ul>
		</div>
	</div>
-->
	<!-- script -->
	<script type="text/javascript" src="./js/plugin/skrollr/skrollr.js"></script>
	<script type="text/javascript" src="./js/plugin/jquery.bxslider/jquery.fitvids.js"></script>
	<script type="text/javascript" src="./js/plugin/jquery.bxslider/jquery.bxslider.min.js"></script>
	<script type="text/javascript" src="./js/plugin/rangeslider/rangeslider.min.js"></script>
	<script type="text/javascript" src="./js/sub.js"></script>
	<!-- /script -->
	
</body>
</html>