<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					<i class="material-icons">전체 ?건</i>
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
									<c:if test="${evt.evtSt == '1'}" var="result">
										<tr>
											<td>
												<div class="img-container">
													<img src="<c:out value="${evt.evtFileUrl}"/>"
														alt="<c:out value="${evt.evtNm}"/>">
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
														<i class="material-icons">D-? [EndDate - Date.now()]</i>
													</button>
												</div>
											</td>
										</tr>
									</c:if>
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