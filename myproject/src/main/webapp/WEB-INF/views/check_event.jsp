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

<title>당첨자 확인 | KT</title>
</head>
<body>
	<%@ include file="./main_header.jsp"%>

	<div class="visual event-ing">
		<div class="column">
			<div class="inner">
				<div class="location">
					<span><a href="/check" class="home">HOME</a></span> <span
						title="현재위치">당첨자 발표</span>
				</div>
				<div class="hgroup is-black">
					<h3>당첨자 발표</h3>
					<p>고객님께서 응모하신 이벤트의 당첨여부를 확인해보세요.</p>
				</div>
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
							title="아이디 또는 휴대폰으로 검색합니다." onchange="changeSearchBox()">
							<option value="strId" selected="selected">아이디</option>
							<option value="phone">휴대폰</option>
						</select> <span class="id-select active"> <input id="id_text"
							type="text" maxlength="32" class="flow search-text"
							placeholder="아이디" title="아이디 입력" value=""> <input
							id="name_text" type="text" maxlength="16"
							class="flow search-text" placeholder="이름" title="이름 입력" value="">
						</span> <span class="phone-select"> <input id="tel_text"
							type="text" maxlength="11" class="flow search-text tell"
							placeholder="'-' 없이 번호만 입력" title="휴대폰 번호 입력" value="">
						</span>
						<button id="win_btn" type="button" class="flow btn-search">
							<span class="invisible"> <!-- 1113 수정 -->검색하기<!-- //1113 수정 -->
							</span>
						</button>
					</div>
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
				<form name="form1" method="post" action="/check_search">
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
					<caption class="invisible">이벤트 당첨 발표를 위한 표</caption>
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
								<th scope="col">당첨자발표일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="row" items="${map.list}">
								<tr>
									<td><a
										href="check_detail?id=<c:out value="${row.evtIdx}"/>"><c:out
												value="${row.evtNm}" /></a></td>
									<td><c:out value="${row.evtTrgDate}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</c:if>
				</table>

				<div class="pagination">
					<c:choose>
						<c:when test="${map.cnt eq 0}" />
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
									<a href="javascript:;" class="dir last disabled">마지막 페이지로
										이동</a>
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
							href="javascript:kt_common.ktMenuLinkStat('/check_event','^KT-당첨자^확인','_self','C00000');"
							class="btn large is-navygray">목록</a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="./event_footer.jsp"%>

	<script type="text/javascript">
				var params = {}; // 파라미터	
				var strId = '';
				var strName = '';
				var strTel = '';
				function changeSearchBox() {
					$j('#id_text').val('');
					$j('#name_text').val('');
					$j('#tel_text').val('');
					if ($j('#selectForm').val() === 'strId') {
						$j('.phone-select ').removeClass('active');
						$j('.id-select').addClass('active').focus();
						params.searchType = 'strId';

					} else {
						$j('.id-select').removeClass('active');
						$j('.phone-select ').addClass('active').focus();
						params.searchType = 'phone';
					}
				}
	</script>

	<script>
	document.getElementById(${map.pageIdx}).innerHTML="<span>${map.pageIdx+1}</span>"
	</script>
</body>
</html>