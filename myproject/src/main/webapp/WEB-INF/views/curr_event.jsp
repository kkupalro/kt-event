<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@ include file="./html_head.html"%>
<title>진행중인 이벤트 | KT</title>
</head>
<body>
	<%@ include file="./main_header.jsp"%>
	<div class="wrapper">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header card-header-icon"
					data-background-color="rose">
					<i class="material-icons">전체 ${fn:length(evt)}건</i>
				</div>

				<div class="card-content">
					<h4 class="card-title">진행중인 이벤트(EVT_EVT T)</h4>
					<div class="table-responsive">

						<table class="table table-shopping">
							<thead>
								<tr>
									<th class="text-center">파일(EVT_FILE_URL)</th>
									<th>이벤트명(EVT_EVT), 이벤트 대상(EVT_TRG)</th>
									<th class="text-description">분류(EVT_CTG_ID)</th>
									<th class="text-description">시작날짜(ST_DATE) ~
										종료날자(END_DATE)</th>
									<th class="text-description">당첨자 발표일(EVT_TRG_DATE)</th>
									<th></th>
								</tr>
							</thead>

							<!-- JSTL 들어갈 부분 -->


							<tbody>
								<c:forEach var="evt" items="${evt}">
										<tr>
											<td>
												<div class="img-container">
													<a href="event_detail?id=<c:out value="${evt.evtCtgId}"/>">
													<img src="<c:out value="${evt.evtFileUrl}"/>"
														alt="<c:out value="${evt.evtNm}"/>"></a>
												</div>
											</td>
											<td class="td-name"><c:out value="${evt.evtNm}" /><br />
											<small><c:out value="${evt.evtTrg}" /></small></td>
											<td><c:out value="${evt.evtCtgId}" /></td>
											<td><c:out value="${evt.stDate}" /> ~ <c:out
													value="${evt.endDate}" /></td>
											<td class="td-name">
												<div class="btn-group">
													<button class="btn btn-round btn-info btn-xs">
														<fmt:parseDate var="endDate" value="${evt.endDate}" pattern="yyyy-MM-dd"/>
														<c:set var="now" value="<%=new java.util.Date() %>"/>
														<fmt:parseNumber var="now_N" value="${now.time/(1000*60*60*24)}" integerOnly="true"/>
														<fmt:parseNumber var="end_N" value="${endDate.time/(1000*60*60*24)}" integerOnly="true"/>
														<i class="material-icons">D - ${end_N - now_N + 1}</i>
													</button>
												</div>
											</td>
										</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@ include file="./event_footer.jsp"%>

</body>
</html>