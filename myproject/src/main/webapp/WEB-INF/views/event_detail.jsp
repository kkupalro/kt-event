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
<title>이벤트 디테일 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>

	<div class="inner">
		<div class="contents">
			<div id="contents-title" class="contents-title">
				<div style="text-align: center;">
					<c:forEach var="evt" items="${evt}">
						<h1>
							<strong><c:out value="${evt.evtNm}" /></strong>
						</h1>
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
								<strong>당첨자발표</strong> : <c:out value="${evt.evtTrgDate}" />
								
							</div>
							<div class="last">
								<strong>이벤트문의</strong> :
								<c:out value="${evt.evtPhone}" />
							</div>
							<p class="d-day"><fmt:parseDate var="endDate" value="${evt.endDate}"
									pattern="yyyy-MM-dd" />
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:parseNumber var="now_N" value="${now.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="end_N"
									value="${endDate.time/(1000*60*60*24)}" integerOnly="true" />
								D - ${end_N - now_N + 1}</p>
						</div>
					</c:forEach>
					<img
						src="https://zone.membership.kt.com/event/2020AutoOasis/img/visual.jpg">
				</div>
			</div>
		</div>

		<div style="text-align: center;">
			<div class="btn-list">
				<a href="event" class="btn large is-navygray">목록</a>
			</div>
		</div>

	</div>

	<%@ include file="./event_footer.jsp"%>

</body>
</html>