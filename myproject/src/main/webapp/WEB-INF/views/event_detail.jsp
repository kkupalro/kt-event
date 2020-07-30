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
<title>이벤트 디테일 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>
	<div class="visual event-ing">
		<div class="column">
			<div class="inner">
				<c:forEach var="evt" items="${evt}">
					<c:if test="${evt.evtSt ne 2}">
						<div class="location">
							<span><a href="/" class="home">HOME</a></span> <span title="현재위치">진행중인
								이벤트</span>
						</div>
						<div class="hgroup is-black">
							<h3>진행중인 이벤트</h3>
							<p>KT에서 진행중인 다양한 이벤트를 확인 및 참여하세요.</p>
						</div>
					</c:if>
					<c:if test="${evt.evtSt eq 2}">
						<div class="location">
							<span><a href="/past_event" class="home">HOME</a></span> <span
								title="현재위치">지난 이벤트</span>
						</div>
						<div class="hgroup is-black">
							<h3>지난 이벤트</h3>
							<p>그동안 kt.com에서 진행된 이벤트 입니다.</p>
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
							<div id="contents-title" class="contents-title" style ="font-family: 'Gothic A1', sans-serif; background: linear-gradient(to right, rgb(127, 127, 213), rgb(134, 168, 231), rgb(145, 234, 228));">
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

						<c:forEach var="evt_dt" items="${evt_dt}">
							<c:set var="type" value="${evt_dt.dataType}" />
							<c:choose>
								<c:when test="${type eq 'IMG'}">
									<img src="<c:out value="${evt_dt.resData}"/>">
								</c:when>
								<c:when test="${type eq 'VIDEO'}">
									<c:out value="${evt_dt.resData}" escapeXml="false" />
								</c:when>
								<c:when test="${type eq 'BTN'}">
									<button type="button">
										<img src="<c:out value="${evt_dt.resData}"/>" alt="버튼 이미지">
									</button>
								</c:when>
								<c:when test="${type eq 'TXT'}">
								<div class="txt"><div class="box-close"><c:out value="${evt_dt.resData}" /></div><div id="evtThumb" class="thumb"></div></div>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</div>

			<div style="text-align: center;">
				<div class="btn-list">
					<c:forEach var="evt" items="${evt}">
						<a
							href="javascript:kt_common.ktMenuLinkStat('${evt.evtSt==2?'/past_event':'/'}','^마지막 페이지','_self','');"
							class="btn large is-navygray">목록</a>												
							
						<c:if test="${evt.evtSt==1}">
						<a
							href="javascript:kt_common.ktMenuLinkStat('/event_enrollment?evt_idx=${evt.evtIdx}','^신청 페이지','_self','');"
							class="btn large is-blue">신청하기</a>
						</c:if>
						
					</c:forEach>
				</div>
			</div>
		</div>

	<%@ include file="./event_footer.jsp"%>
	<script type="text/javascript">
	var generateRandom = function (min, max) {
		  var ranNum = Math.floor(Math.random()*(max-min+1)) + min;
		  return ranNum;
	}
	var i = generateRandom(1, 100);
	if(i % 5 == 0){
		// 20%
		// 당첨 처리 CUST_APP_RES.PRIZE = 1
		alert('난수 = ' + i + ' (당첨)');
	}
	else {
		// 비당첨 처리 CUST_APP_RES.PRIZE = 0
		alert('난수 = ' + i + ' (비당첨)');
	}
	</script>
</body>
</html>