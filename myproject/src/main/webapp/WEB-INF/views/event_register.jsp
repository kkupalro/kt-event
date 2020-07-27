<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/material-dashboard.css?v=1.3.0" rel="stylesheet">
<link href="css/demo.css" rel="stylesheet">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<%@ include file="./html_head.html"%>

<title>회원가입 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="card card-signup" style ="margin-top: 50px;"><br>
				<h2 class="card-title text-center">회원가입</h2>

				<div class="row">
					<div class="col-md-12">
						<div class="social text-center">
							<button class="btn btn-just-icon btn-round btn-twitter">
								<i class="fa fa-twitter"></i>
							</button>
							<button class="btn btn-just-icon btn-round btn-dribbble">
								<i class="fa fa-dribbble"></i>
							</button>
							<button class="btn btn-just-icon btn-round btn-facebook">
								<i class="fa fa-facebook"> </i>
							</button>
						</div>

						<form class="form" name="form" action="registerProcess"
							method="post" onSubmit="return checkAll()">
							<div class="card-content">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">face</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control"
											placeholder="이름을 입력해주세요" name="custName"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">email</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control"
											placeholder="이메일을 입력해주세요" name="custEmail"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon">
										<i class="material-icons">account_box</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control" placeholder="ID를 입력해주세요" name="custId" id="custId" style="width: 80%">
										<span class="material-input"></span>
										<input type="button" class="btn btn-rose" style="position: relative; align : right;" id="id_check "
											value="중복확인" onclick="button1_click();">
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">lock_outline</i>
									</span>
									<div class="form-group is-empty">

										<input type="password" id="password_1"
											placeholder="비밀번호를 입력해주세요" class="form-control"
											name="custPwd"> <span>8~15자리의 영문, 숫자, 특수문자의
											입력이 가능합니다.</span>


									</div>

								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">lock_outline</i>
									</span>
									<div class="form-group is-empty">
										<input type="password" id="password_2" placeholder="비밀번호확인"
											class="form-control" name="password2">
										<!--  <span class="material-input"></span>-->
										<span id="alert-success" style="display: none;">비밀번호가
											일치합니다.</span> <span id="alert-danger"
											style="display: none; color: #d92742; font-weight: bold;">
											비밀번호가 일치하지 않습니다. </span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">phone</i>
									</span>
									<div class="form-group is-empty">
										<input type="tel" placeholder="휴대폰 번호를 입력해주세요"
											class="form-control" name="custPhone"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="checkbox">
									<label> <input type="checkbox" id="checkbox" unchecked>
										<a href="#something">개인약관 </a>에 동의합니다.
									</label>
								</div>
							</div>

							<div class="footer text-center">
								<input type="submit" id="register"
									class="btn btn-primary btn-round" value="회원가입">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/common.js"></script>
	<script type="text/javascript" charset="UTF-8" src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/util.js"></script>
	<script src="js/templ/jquery.min.js" type="text/javascript"></script>
	<script src="js/templ/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/templ/material.min.js" type="text/javascript"></script>
	<script src="js/templ/perfect-scrollbar.jquery.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<script src="js/templ/arrive.min.js" type="text/javascript"></script>
	<script src="js/templ/jquery.validate.min.js"></script>
	<script src="js/templ/moment.min.js"></script>
	<script src="js/templ/chartist.min.js"></script>
	<script src="js/templ/jquery.bootstrap-wizard.js"></script>
	<script src="js/templ/bootstrap-notify.js"></script>
	<script src="js/templ/bootstrap-datetimepicker.js"></script>
	<script src="js/templ/jquery-jvectormap.js"></script>
	<script src="js/templ/nouislider.min.js"></script>
	<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script src="js/templ/jquery.select-bootstrap.js"></script>
	<script src="js/templ/jquery.datatables.js"></script>
	<script src="js/templ/sweetalert2.js"></script>
	<script src="js/templ/jasny-bootstrap.min.js"></script>
	<script src="js/templ/fullcalendar.min.js"></script>
	<script src="js/templ/jquery.tagsinput.js"></script>
	<script src="js/templ/material-dashboard.js?v=1.3.0"></script>
	<script src="js/templ/demo.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="js/templ/register.js"></script>
	<%@ include file="./event_footer.jsp"%>

	<script>
		$("#custId")
				.blur(
						function() {
							// id = "id_reg" / name = "userId"
							var user_id = $('#custId').val();
							$
									.ajax({
										url : '${pageContext.request.contextPath}/user/idCheck?userId='
												+ user_id,
										type : 'get',
										success : function(data) {
											if (data == 0) {
												alert("사용해도 되는 아이디");

											} else {
												alert("아이디 바꿔주세요~")
											}
										},
										error : function() {
											console.log("실패");
										}
									});
						});
	</script>

</body>
</html>
