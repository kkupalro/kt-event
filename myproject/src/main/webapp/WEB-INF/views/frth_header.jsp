<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>  
<html lang="ko" class=" cssanimations csstransitions cssanimations csstransitions">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>

	<div id="cfmClWrapper">
		<!-- crmClSkip -->
		<div id="cfmClSkip">
			<a href="#cfmClGnb">주메뉴 바로 가기</a> <a href="#cfmClContainer">본문
				바로가기</a>
		</div>
		<!-- /crmClSkip -->
		<!-- cfmIRHeader -->
		<div id="cfmClHeader" style="left: 0px;">
			<div class="floating-menu">
				<script type="text/javascript">
					kt.floating();
				</script>
				<div class="floating-menu"></div>
			</div>
			<div id="cfmClGnb" tabindex="0" class="sub bg">
				<script type="text/javascript">
					kt.gnb();
				</script>
				<div class="navigation">
					<ul class="inner">

						<li class="nav0">
							<a data-menucd="AA0000"
							href="javascript:kt_common.ktMenuLinkStat('event','^KT-진행중인^이벤트','_self','AA0000');"
							class="">
							<span>진행중인 이벤트</span>
							</a>
							<div class="sub-navigation" style="display: none;"></div>
						</li>


						<li class="nav2">
							<a data-menucd="B00000"
								href="javascript:kt_common.ktMenuLinkStat('lte','^KT-LTE^데이터^룰렛','_self','B00000');"
								class="">
								<span>LTE 데이터 룰렛</span>
							</a>
							<div class="sub-navigation" style="display: none;">
								<ul class="depth2">
								</ul>
								<ul class="depth2">
								</ul>
							</div>
						</li>
						
						<li class="nav4 membership">
							<a data-menucd="C00000"
								href="javascript:kt_common.ktMenuLinkStat('check','^KT-당첨자^확인','_self','C00000');"
								class="">
								<span>당첨자 확인</span>
							</a>
							<div class="sub-navigation" style="display: none;">
								<div class="cate">
									<h3></h3>
								</div>
							</div>
						</li>

						<li class="nav6">
							<a data-menucd="D00000"
								href="javascript:kt_common.ktMenuLinkStat('last','^KT-지난^이벤트','_self','D00000');"
								class="current">
								<span>지난 이벤트</span>
							</a>
							<div class="sub-navigation" style="display: none;"></div>
						</li>
					</ul>
				</div>
				
				<div class="utils bg-none">
					<div id="total-search" class="total-search">
						<div class="inner">
							<div class="search">
								<form onsubmit="return false;">
									<fieldset>
										<legend class="invisible">통합검색</legend>
										<input type="text" placeholder="무엇이 궁금하신가요?" value=""
											title="통합검색" maxlength="30">
										<button type="button">
											<span>검색</span>
										</button>
									</fieldset>
								</form>
								<div class="rltmkywd-div" tabindex="0">
									<div class="rltm_word">
										<!-- 더보기 활성화시 on 추가 -->
										<div class="roll_wrap">
											<h2 class="tit">실시간 인기 검색어</h2>
											<span class="btn_lay_open">실시간 인기 검색어 더보기</span>
											<ol id="rltmkywd-list" class="rltmkywd-list">
											</ol>
										</div>
									</div>
									<button class="rltmkywd-cls">
										<span>실시간 인기 검색어 레이어 닫기</span>
									</button>
								</div>
								<div class="result" style="display: none;">
									<ul></ul>
									<div class="summary-banner"></div>
									<div class="menu-shortcut">
										<strong>메뉴 바로가기</strong>
										<ol></ol>
									</div>
								</div>
							</div>
						</div>
						<div class="bottom">
							<div class="inner">
								<button type="button">
									<span>닫기</span>
								</button>
							</div>
						</div>
					</div>
					<div id="all-menus" class="all-menus" style="left: 0px;">
						<div class="inner">
							<div class="search-area">
								<form onsubmit="return false;">
									<fieldset class="reverse">
										<legend class="invisible">메뉴검색</legend>
										<input type="text" class="flow search-text"
											placeholder="검색어를 입력하세요." value="" maxlength="30"
											title="검색어를 입력하세요.">
										<button type="button" class="btn-close" style="display: none;">삭제</button>
										<button type="button" class="flow btn-search"
											onclick="kt_common.ktMenuLinkStat('', '^KT-개인_공통^GNB_Top^검색_전체메뉴', '_self', 'A00000');">
											<span>메뉴검색</span>
										</button>
									</fieldset>
								</form>
								<div class="result">
									<span style="display: none;"></span>
									<button type="button" class="next" style="display: none;">
										<span>다음 메뉴로 스크롤 이동</span>
									</button>
									<button type="button" class="prev" style="display: none;">
										<span>이전 메뉴로 스크롤 이동</span>
									</button>
								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="click-banner2 top" style="display: none;"></div>

				<div id="chnlink" class="chnlink">
					<ul>
						<li>
							<a href="javascript:kt_common.ktMenuLinkStat('/','^KT-메인페이지','_self','');">메인</a>
						</li>
						<li>
							<a href="javascript:kt_common.ktMenuLinkStat('login','^KT-로그인','_self','');">로그인</a>
						</li>
						<li>
							<a href="javascript:kt_common.ktMenuLinkStat('register','^KT-회원가입','_self','');">회원가입</a>
						</li>
					</ul>
				</div>
				
			</div>
		</div>
	</div>
</body>
</html>