<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="js/curr_event.js"></script>

<%@ include file="./html_head.html"%>

<title>진행중인 이벤트 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>
	
	<div class="event-list-area">
		<div class="column">
			<div class="inner">
				<div class="search-option clearfix" style="padding-top: 20px;">
			<div class="inner"><br>
				<div class="search-option clearfix">
					<div class="flow select-search-result">
						전체 <span> ${fn:length(evt)}</span>건
					</div>
					<div class="search-area options reverse">
						<div class="view-type flow">
							<a href="javascript:;" class="active"><span>최신순</span></a><a
								href="javascript:;" class=""><span>마감일순</span></a>
						</div>
							<select id="search-select" class="flow search-select"
								title="진행중인 이벤트 분류 선택">
								<option value="ALL" selected="selected">전체</option>
								<option value="1">상품/서비스</option>
								<option value="2">멤버십</option>
								<option value="3">올레TV</option>
								<option value="4">기업</option>
								<option value="0">기타</option></select>
							<button id="btnSearch" type="button" class="flow btn-search">
								<span>검색</span>
							</button>
					</div>
					
				</div>
				<div class="event-list">
					<ul>
						<c:forEach var="evt" items="${evt}">
							<li><a href="event_detail?id=<c:out value="${evt.evtIdx}"/>">
									<div class="thumb">
										<img src="<c:out value="${evt.evtFileUrl}"/>"
											alt="<c:out value="${evt.evtNm}"/>">
										<div class="d-day">
											<fmt:parseDate var="endDate" value="${evt.endDate}"
												pattern="yyyy-MM-dd" />
											<c:set var="now" value="<%=new java.util.Date() %>" />
											<fmt:parseNumber var="now_N"
												value="${now.time/(1000*60*60*24)}" integerOnly="true" />
											<fmt:parseNumber var="end_N"
												value="${endDate.time/(1000*60*60*24)}" integerOnly="true" />
											D - ${end_N - now_N + 1}
										</div>
									</div>
									<div class="summary">
										<div class="title">
											<c:out value="${evt.evtNm}" />
										</div>
										<div class="date">
											<c:out value="${evt.stDate}" />
											~
											<c:out value="${evt.endDate}" />
										</div>
										<div class="type">
											<span class="product"> <c:out value="${evt.evtCtgNm}" />
											</span>
										</div>
									</div>
							</a></li>
						</c:forEach>
					</ul>
				</div>
				<div class="pagination">
					<div class="scope">
						<a href="javascript:;" class="dir first disabled">첫 페이지로 이동</a><a
							href="javascript:;" class="dir prev disabled">이전 페이지로 이동</a><span
							title="현재위치">1</span><a href="javascript:;" data-page="2">2</a><a
							href="javascript:;" data-page="3">3</a><a href="javascript:;"
							data-page="4">4</a><a href="javascript:;" data-page="5">5</a><a
							href="javascript:;" class="dir next ">다음 페이지로 이동</a><a
							href="javascript:;" class="dir last ">마지막 페이지로 이동</a>
					</div>
				</div>
				<div class="btn-list"></div>
			</div>
		</div>
	</div>
	<%@ include file="./event_footer.jsp"%>
</body>
</html>