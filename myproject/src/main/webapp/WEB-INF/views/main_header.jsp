<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko"
	class=" cssanimations csstransitions cssanimations csstransitions">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap')
	;
</style>
</head>
<div id="cfmClWrapper">
	<div id="cfmClHeader" style="left: 0px;">
		<div class="floating-menu">
			<script type="text/javascript">
				kt.floating();
			</script>
		</div>
		<div id="cfmClGnb" tabindex="0" class="active">
			<script type="text/javascript">
				kt.gnb();
			</script>
			<div class="navigation">
				<ul class="inner">
					<li class="nav0"><a data-menucd="B00000"
						href="javascript:kt_common.ktMenuLinkStat('lte','^KT-LTE^데이터^룰렛','_self','B00000');"
						class=""><span> </span> </a></li>


					<li class="nav1"><a data-menucd="AA0000"
						href="javascript:kt_common.ktMenuLinkStat('/','^KT-진행중인^이벤트','_self','AA0000');"
						class=""><span>진행중인 이벤트</span> </a></li>


					<li class="nav3 membership"><a data-menucd="C00000"
						href="javascript:kt_common.ktMenuLinkStat('check','^KT-당첨자^확인','_self','C00000');"
						class=""> <span>당첨자 확인</span>
					</a></li>

					<li class="nav6"><a data-menucd="D00000"
						href="javascript:kt_common.ktMenuLinkStat('/past_event','^KT-지난^이벤트','_self','D00000');"
						class=""> <span>지난 이벤트</span>
					</a></li>
				</ul>
			</div>

			

			<div id="chnlink" class="chnlink">
				<ul>
					<li><a
						href="javascript:kt_common.ktMenuLinkStat('/','^KT-메인페이지','_self','');">메인</a>
					</li>

					<c:if test="${!empty custId }">
						<li><a
							href="javascript:kt_common.ktMenuLinkStat('/','^KT-로그아웃','_self','');">로그아웃</a>
						</li>
					</c:if>


					<c:if test="${empty custId }">
						<li><a
							href="javascript:kt_common.ktMenuLinkStat('login','^KT-로그인','_self','');">로그인</a>
						</li>
						<li><a
							href="javascript:kt_common.ktMenuLinkStat('register','^KT-회원가입','_self','');">회원가입</a>
						</li>
					</c:if>
				</ul>
			</div>

		</div>
	</div>
</div>
</html>
