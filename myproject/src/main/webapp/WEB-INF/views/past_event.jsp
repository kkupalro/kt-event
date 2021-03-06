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

<title>지난 이벤트 | KT</title>
</head>
<body>
	<%@ include file="./main_header.jsp"%>

	<div class="visual event-ing">
		<div class="column">
			<div class="inner">
				<div class="location">
					<span><a href="/past_event" class="home">HOME</a></span> <span
						title="현재위치">지난 이벤트</span>
				</div>
				<div class="hgroup is-black">
					<h3>지난 이벤트</h3>
					<p>그동안 kt.com에서 진행된 이벤트 입니다.</p>
				</div>
			</div>
		</div>
	</div>
	<div class="event-list-area">
		<div class="column">
			<div class="inner">
				<div class="flow select-search-result">
					전체 <span>${map.cnt}</span>건
				</div>
				<form name="form1" method="post" action="/past_search">
					<div class="search-area options reverse">
						<select id="searchOption" class="flow search-select"
							name="searchOption" title="서비스별 검색 선택">
							<option value=""
								<c:out value="${map.searchOption == ''?'selected':''}"/>>전체</option>
							<option value="1"
								<c:out value="${map.searchOption == '1'?'selected':''}"/>>상품/서비스</option>
							<option value="2"
								<c:out value="${map.searchOption == '2'?'selected':''}"/>>멤버십</option>
							<option value="3"
								<c:out value="${map.searchOption == '3'?'selected':''}"/>>올레TV</option>
							<option value="4"
								<c:out value="${map.searchOption == '4'?'selected':''}"/>>기업</option>
							<option value="0"
								<c:out value="${map.searchOption == '0'?'selected':''}"/>>기타</option>
						</select> <input type="text" id="search-text" maxlength="32"
							class="flow search-text" placeholder="이벤트명을 입력해주세요."
							name="searchWord" title="이벤트명을 입력해주세요." value="">
						<button id="btnSearch" type="submit" class="flow btn-search">
							<span>검색</span>
						</button>
					</div>
				</form>
				<table class="board dir-vertical">
					<caption class="invisible">지난 이벤트에 대하여 이벤트명, 응모기간으로 정리한 표</caption>
					<c:if test="${map.cnt eq '0'}">
						<tbody>
							<tr>
								<td class='empty'>'${map.searchWord}'에 대한 검색결과가 없습니다.</td>
							</tr>
						</tbody>
					</c:if>

					<c:if test="${map.cnt ne '0'}">
						<colgroup>
							<col>
							<col style="width: 300px">
						</colgroup>
						<thead>
							<tr>
								<th scope="col">이벤트명</th>
								<th scope="col">응모기간</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${map.list}">
								<tr>
									<td><a
										href="event_detail?id=<c:out value="${row.evtIdx}"/>"><c:out
												value="${row.evtNm}" /></a></td>
									<td><c:out value="${row.stDate}" /> ~ <c:out
											value="${row.endDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>

				<div class="pagination">
				<c:choose>
				<c:when test="${map.cnt eq 0}"/>
				<c:otherwise>
					<div class="scope">
						<c:if test="${map.pageIdx eq 0}">
							<a href="javascript:;" class="dir first disabled">첫 페이지로 이동</a>
							<a href="javascript:;" class="dir prev disabled">이전 페이지로 이동</a>
						</c:if>
						<c:if test="${map.pageIdx ne 0}">
							<a
								href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=0&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^첫 페이지','_self','');"
								class="dir first">첫 페이지로 이동</a>
							<a
								href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${map.pageIdx==0?0:map.pageIdx-1}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^이전 페이지','_self','');"
								class="dir prev">이전 페이지로 이동</a>
						</c:if>
						<c:choose>
							<c:when test="${map.cnt eq 0}" />
							<c:when test="${map.endPage < 10}">
								<c:forEach begin="0" end="${map.endPage}" var="idx">
									<a id="${idx}"
										href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${idx}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^${idx}페이지','_self','');">${idx+1}</a>
								</c:forEach>
							</c:when>
							<c:when test="${map.endPage >= 10}">
								<c:choose>
									<c:when test="${map.pageIdx < 10}">
										<c:forEach begin="0" end="9" var="idx">
											<a id="${idx}"
												href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${idx}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^${idx}페이지','_self','');">${idx+1}</a>
										</c:forEach>
									</c:when>

									<c:when test="${map.pageIdx >= 10}">
										<fmt:parseNumber var="pages" integerOnly="true"
											value="${map.pageIdx / 10}" />

										<fmt:parseNumber var="val" integerOnly="true"
											value="${pages*10 + 9 < map.endPage?9:map.endPage - pages*10}" />
										<c:forEach begin="${pages*10}" end="${pages*10 + val}"
											var="idx">
											<a id="${idx}"
												href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${idx}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^${idx}페이지','_self','');">${idx+1}</a>
										</c:forEach>
									</c:when>
								</c:choose>
							</c:when>
						</c:choose>
						<c:if test="${map.pageIdx eq map.endPage}">
							<a href="javascript:;" class="dir next disabled">다음 페이지로 이동</a>
							<a href="javascript:;" class="dir last disabled">마지막 페이지로 이동</a>
						</c:if>
						<c:if test="${map.pageIdx ne map.endPage}">
							<a
								href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${map.pageIdx>=map.endPage?map.endPage:map.pageIdx+1}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^다음 페이지','_self','');;"
								class="dir next >">다음 페이지로 이동</a>
							<a
								href="javascript:kt_common.ktMenuLinkStat('past_page?pageIdx=${map.endPage}&searchOption=${map.searchOption}&searchWord=${map.searchWord}','^마지막 페이지','_self','');"
								class="dir last ">마지막 페이지로 이동</a>
						</c:if>
					</div>
					</c:otherwise>
					</c:choose>
				</div>
				<div class="btn-list">
					<c:if test="${map.searchOption ne '' or map.searchWord ne ''}">
						<a
							href="javascript:kt_common.ktMenuLinkStat('/past_event','^KT-지난^이벤트','_self','D00000');"
							class="btn large is-navygray">목록</a>
					</c:if>
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