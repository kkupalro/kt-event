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

	<div class="inner">
		<div class="contents">
			<div id="contents-title" class="contents-title">
				<div style="text-align: center;">
					<c:forEach var="evt" items="${evt}">
						<div
							style="font-family: 'Gothic A1', sans-serif; background: linear-gradient(to right, rgb(127, 127, 213), rgb(134, 168, 231), rgb(145, 234, 228));">
							<br>
							<h1>
								<strong><c:out value="${evt.evtNm}" /></strong><br>
							</h1>
							<br>
						</div>
						<br>
						<br>
						<div id="eventInfo" class="info"
							style="width: 700px; margin-left: 22%;">
							<table align="middle" style="background-color: #ffffff;">
								<th align=left><strong> 응모기간</strong> : <c:out
										value="${evt.stDate}" /> ~ <c:out value="${evt.endDate}" /></th>
								<th align=left><strong> 응모대상</strong> : <c:out
										value="${evt.evtTrg}" /></th>
								<tr>
									<!-- 첫번째 줄 시작 -->
									<td align=left><strong>당첨자발표</strong> : <c:out
											value="${evt.evtTrgDate}" /></td>
									<td align=left><strong>이벤트문의</strong> : <c:out
											value="${evt.evtPhone}" /></td>
								</tr>
								<!-- 첫번째 줄 끝 -->
								<tr align=left>
									<!-- 두번째 줄 시작 -->
									<td align=left>
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
									</td>
									<td></td>
								</tr>
								<!-- 두번째 줄 끝 -->
							</table>
							<br> <br>
							<%-- <div>
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
							<p class="d-day">
								<fmt:parseDate var="endDate" value="${evt.endDate}"
									pattern="yyyy-MM-dd" />
								<c:set var="now" value="<%=new java.util.Date()%>" />
								<fmt:parseNumber var="now_N" value="${now.time/(1000*60*60*24)}"
									integerOnly="true" />
								<fmt:parseNumber var="end_N"
									value="${endDate.time/(1000*60*60*24)}" integerOnly="true" />
								D - ${end_N - now_N + 1}
							</p>--%>
						</div>
					</c:forEach>

					<c:forEach var="evt_dt" items="${evt_dt}">
						<c:set var="type" value="${evt_dt.dataType}" />
						<c:choose>
							<c:when test="${type eq 'IMG'}">
								<img src="<c:out value="${evt_dt.resData}"/>">
							</c:when>
							<c:when test="${type eq 'VIDEO'}">
								<!-- video -->
								<c:out value="${evt_dt.resData}" escapeXml="false" />
							</c:when>
							<c:when test="${type eq 'BTN'}">
								<!-- button -->
								<button type="button">
									<img src="<c:out value="${evt_dt.resData}"/>" alt="버튼 이미지">
								</button>
							</c:when>
							<c:when test="${type eq 'TXT'}">
								<!-- 종료이벤트 = txt -->
								<div class="box-close">
									<c:out value="${evt_dt.resData}" />
								</div>
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
				</c:forEach>
			</div>
		</div>

	</div>

	<%@ include file="./event_footer.jsp"%>

</body>
</html>