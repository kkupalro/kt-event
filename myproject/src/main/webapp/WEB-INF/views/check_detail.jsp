<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="./html_head.html"%>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Gothic+A1:wght@700&display=swap')
	;
</style>
<title>당첨자 조회 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>
	<div class="visual event-ing">
		<div class="column">
			<div class="inner">
				<c:forEach var="evt" items="${evt}">
					<c:if test="${evt.evtSt ne 2}">
						<div class="location">
							<span><a href="/" class="home">HOME</a></span> <span title="현재위치">당첨자
								발표</span>
						</div>
						<div class="hgroup is-black">
							<h3>당첨자 발표</h3>
							<p>고객님께서 응모하신 이벤트의 당첨여부를 확인해보세요.</p>
						</div>
					</c:if>
					<c:if test="${evt.evtSt eq 2}">
						<div class="location">
							<span><a href="/" class="home">HOME</a></span> <span title="현재위치">당첨자
								발표</span>
						</div>
						<div class="hgroup is-black">
							<h3>당첨자 발표</h3>
							<p>고객님께서 응모하신 이벤트의 당첨여부를 확인해보세요.</p>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<div class="event-list-area">
		<div class="column">
			<div class="inner">
				<div class="contents">
					<c:forEach var="evt" items="${evt}">
						<div id="contents-title" class="contents-title"
							style="font-family: 'Gothic A1', sans-serif; background: linear-gradient(to right, rgb(127, 127, 213), rgb(134, 168, 231), rgb(145, 234, 228));">
							<c:out value="${evt.evtNm}" />
						</div>
						<div id="eventInfo" class="info">
							<div>
								<strong>응모기간</strong> :
								<c:out value="${evt.stDate}" />
								~
								<c:out value="${evt.endDate}" />
							</div>
							<div>
								<strong>응모대상</strong> :
								<c:out value="${evt.evtTrg}" />
							</div>
							<div>
								<strong>당첨자발표</strong> :
								<c:out value="${evt.evtTrgDate}" />
							</div>
							<div class="last">
								<strong>이벤트문의</strong> :
								<c:out value="${evt.evtPhone}" />
							</div>

							<c:if test="${evt.evtSt ne 2}">
								<p class="d-day">
									<fmt:parseDate var="endDate" value="${evt.endDate}"
										pattern="yyyy-MM-dd" />
									<c:set var="now" value="<%=new java.util.Date()%>" />
									<fmt:parseNumber var="now_N"
										value="${now.time/(1000*60*60*24)}" integerOnly="true" />
									<fmt:parseNumber var="end_N"
										value="${endDate.time/(1000*60*60*24)}" integerOnly="true" />
									D - ${end_N - now_N + 1}
								</p>
							</c:if>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>

		<div class="winning-check-area">
			<div class="column">
				<div class="inner">
					<div class="winning-check">
						<div class="winning-title">
							고객님께서 응모하신 <strong>이벤트의 당첨여부</strong>를 확인해보세요.
						</div>
						<div class="search-area hybrid">
							<select id="selectForm" class="flow search-select"
								title="아이디 또는 휴대폰으로 검색합니다.">
								<option value="strId" selected="selected">아이디</option>
								<option value="phone">휴대폰</option>
							</select> <span class="id-select active"> <input id="id_text" name = "id_text"
								type="text" maxlength="32" class="flow search-text"
								placeholder="아이디" title="아이디 입력" value=""> <input
								id="name_text" type="text" maxlength="16"
								class="flow search-text" placeholder="이름" title="이름 입력" value="">
							</span> <span class="phone-select"> <input id="tel_text"
								type="text" maxlength="11" class="flow search-text tell"
								placeholder="'-' 없이 번호만 입력" title="휴대폰 번호 입력" value="">
							</span>
							<button id="win_btn" type="button" class="flow btn-search" onclick="button_click();">
								<span class="invisible"> <!-- 1113 수정 -->검색하기<!-- //1113 수정 -->
								</span>
							</button>
						</div>
					</div>
					<div>
						<br> <br>
						<p>안녕하세요 고객님.</p>
						<p>당첨 확인을 위하여 고객 정보 조회 부탁 드립니다.</p>
						<p>당첨 고객님께는 안내 문자메시지를 보내드릴 예정입니다.</p>
					</div>
				</div>
			</div>
		</div>



		<div style="text-align: center;">
			<div class="btn-list">
				<c:forEach var="evt" items="${evt}">
					<a
						href="javascript:kt_common.ktMenuLinkStat('${evt.evtSt==2?'/check':'/'}','^마지막 페이지','_self','');"
						class="btn large is-navygray">목록</a>
				</c:forEach>
			</div>
		</div>
	</div>

	<%@ include file="./event_footer.jsp"%>
	 
	<script type="text/javascript">
	$("#id_text")
	.blur(
			function() {
				// id = "id_reg" / name = "userId"
				var user_id = $('#id_text').val();
				var evt_idx = ${evtIdx}
				$
						.ajax({
							url : '${pageContext.request.contextPath}/user/custidCheck?userId='
									+ user_id +'evtIdx'+evt_idx,
							type : 'get',
							success : function(data) {
								if (data == 0) {
									alert("사용해도 되는 아이디");

								} else {
									alert("아이디 바꿔주세요~")
								}
							},
							error : function() {
								console.log("실패");
							}
						});
			});
	</script>
	 
</body>
</html>