<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div class="inner">
						<br>
						<div class="search-option clearfix">
							<div class="flow select-search-result">
								전체 <span> ${fn:length(map.list)}</span>건
							</div>
							<form name="form1" method="post" action="/">
								<div class="search-area options reverse">
									<div class="view-type flow">
										<a
											href="javascript:kt_common.ktMenuLinkStat('Newest?searchOption=${map.searchOption}','^최신순','_self','');"
											class="<c:out value="${map.searchType == 'Newest'?'active':''}"/>"><span>최신순</span></a>
										<a
											href="javascript:kt_common.ktMenuLinkStat('Deadline?searchOption=${map.searchOption}','^마감일순','_self','');"
											class="<c:out value="${map.searchType == 'Deadline'?'active':''}"/>"><span>마감일순</span></a>
									</div>
									<select id="searchOption" class="flow search-select"
										name="searchOption" title="진행중인 이벤트 분류 선택">
										<option value=""
											<c:out value="${map.searchOption == '' ?'selected':''}"/>>전체</option>
										<option value="1"
											<c:out value="${map.searchOption == '1' ?'selected':''}"/>>상품/서비스</option>
										<option value="2"
											<c:out value="${map.searchOption == '2' ?'selected':''}"/>>멤버십</option>
										<option value="3"
											<c:out value="${map.searchOption == '3' ?'selected':''}"/>>올레TV</option>
										<option value="4"
											<c:out value="${map.searchOption == '4' ?'selected':''}"/>>기업</option>
										<option value="0"
											<c:out value="${map.searchOption == '0' ?'selected':''}"/>>기타</option>
									</select>
									<button id="btnSearch" type="submit" class="flow btn-search">
										<span>검색</span>
									</button>
								</div>
							</form>
						</div>

						<div class="event-list" id="table">
							<ul>
								<c:forEach var="row" items="${map.list}">
									<li><a
										href="event_detail?id=<c:out value="${row.evtIdx}"/>">
											<div class="thumb">
												<img src="<c:out value="${row.evtFileUrl}"/>"
													alt="<c:out value="${row.evtNm}"/>">
												<div class="d-day">
													<fmt:parseDate var="endDate" value="${row.endDate}"
														pattern="yyyy-MM-dd" />
													<c:set var="now" value="<%=new java.util.Date()%>" />
													<fmt:parseNumber var="now_N"
														value="${now.time/(1000*60*60*24)}" integerOnly="true" />
													<fmt:parseNumber var="end_N"
														value="${endDate.time/(1000*60*60*24)}" integerOnly="true" />
													D - ${end_N - now_N + 1}
												</div>
											</div>
											<div class="summary">
												<div class="title">
													<c:out value="${row.evtNm}" />
												</div>
												<div class="date">
													<c:out value="${row.stDate}" />
													~
													<c:out value="${row.endDate}" />
												</div>
												<div class="type">
													<span class="product"> <c:out
															value="${row.evtCtgNm}" />
													</span>
												</div>
											</div>
									</a></li>
								</c:forEach>
							</ul>
						</div>
						<div class="pagination">
							<div class="scope">
								<a href="javascript:kt_common.ktMenuLinkStat('page?pageIdx=0&searchOption=${map.searchOption}&searchType=${map.searchType}','^첫 페이지','_self','');" class="dir first">첫 페이지로 이동</a>
								<a href="javascript:kt_common.ktMenuLinkStat('page?pageIdx=${map.pageIdx==0?0:map.pageIdx-1}&searchOption=${map.searchOption}&searchType=${map.searchType}','^이전 페이지','_self','');" class="dir prev">이전 페이지로 이동</a>
								<a id="0" href="javascript:kt_common.ktMenuLinkStat('page?pageIdx=0&searchOption=${map.searchOption}&searchType=${map.searchType}','^1페이지','_self','');">1</a>
								<a id="1" href="javascript:kt_common.ktMenuLinkStat('page?pageIdx=1&searchOption=${map.searchOption}&searchType=${map.searchType}','^2페이지','_self','');">2</a>
								<a id="2" href="javascript:kt_common.ktMenuLinkStat('page?pageIdx=2&searchOption=${map.searchOption}&searchType=${map.searchType}','^3페이지','_self','');">3</a>
								<a href="javascript:;" class="dir next >">다음 페이지로 이동</a>
								<a href="javascript:;" class="dir last ">마지막 페이지로 이동</a>
							</div>
						</div>
						<div class="btn-list"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="./event_footer.jsp"%>
	<script>
	document.getElementById(${map.pageIdx}).innerHTML="<span>${map.pageIdx+1}</span>"
	</script>
</body>
</html>