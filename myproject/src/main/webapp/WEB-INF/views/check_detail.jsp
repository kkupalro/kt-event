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
					<div class="location">
						<span><a href="/" class="home">HOME</a></span> <span title="현재위치">당첨자
							발표</span>
					</div>
					<div class="hgroup is-black">
						<h3>당첨자 발표</h3>
						<p>고객님께서 응모하신 이벤트의 당첨여부를 확인해보세요.</p>
					</div>
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
					<div>
						<c:choose>
							<c:when test="${empty checkID}">
								<script>alert("'${custNm}'고객님께서는 해당 이벤트에 당첨되지 않으셨습니다.\n다음 기회에 다시 한번 응모 해주시기 바랍니다.")</script>
								<!-- 여기에 비당첨 페이지 꾸밀꺼 구현하면 됨. -->
								${custNm} 님께서는 해당 이벤트에 당첨되지 못하셨습니다.<br>다음 기회에 다시 도전해주세요.  
							</c:when>
							<c:otherwise>
								<script>alert("'${custNm}'고객님께서는 해당 이벤트에 당첨되셨습니다.\n당첨을 축하드립니다.")</script>
								<!-- 여기에 당첨 페이지 꾸밀꺼 구현하면 됨. -->
								${custNm}님! 당첨을 축하드립니다!! <br> 당첨되신 분께는 따로 문자로 연락을 드릴 예정입니다. <br> 감사합니다. 
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>

		<div style="text-align: center;">
			<div class="btn-list">
				<a
						href="javascript:kt_common.ktMenuLinkStat('/check_event','^마지막 페이지','_self','');"
						class="btn large is-navygray">목록</a>
			</div>
		</div>
	</div>

	<%@ include file="./event_footer.jsp"%>

</body>
</html>