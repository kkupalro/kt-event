<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="apple-touch-icon" sizes="76x76" href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/material-dashboard.css?v=1.3.0" rel="stylesheet">
<link href="css/demo.css" rel="stylesheet">
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<%@ include file="./html_head.html"%>

<title>회원가입 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>

	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="card card-signup">
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

						<form class="form" method="" action="" onSubmit="return checkPw(this)">
							<div class="card-content">
								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">face</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control"
											placeholder="이름을 입력해주세요"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">email</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control"
											placeholder="이메일을 입력해주세요"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">account_box</i>
									</span>
									<div class="form-group is-empty">
										<input type="text" class="form-control"
											placeholder="ID를 입력해주세요"> <span
											class="material-input"></span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">lock_outline</i>
									</span>
									<div class="form-group is-empty">
										<input type="password" id="password_1"
											placeholder="비밀번호를 입력해주세요" class="form-control"> <span>8~15자리의
											영문, 숫자, 특수문자의 입력이 가능합니다.</span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">lock_outline</i>
									</span>
									<div class="form-group is-empty">
										<input type="password" id="password_2" placeholder="비밀번호확인"
											class="form-control">
										<!--  <span class="material-input"></span>-->
										<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span> 
										<span id="alert-danger" style="display: none; color: #d92742; font-weight: bold;">비밀번호가
											일치하지 않습니다.</span>
									</div>
								</div>

								<div class="input-group">
									<span class="input-group-addon"> <i
										class="material-icons">phone</i>
									</span>
									<div class="form-group is-empty">
										<input type="tel" placeholder="휴대폰 번호를 입력해주세요"
											class="form-control"> <span class="material-input"></span>
									</div>
								</div>

								<div class="checkbox">
									<label> <input type="checkbox" name="optionsCheckboxes"
										checked> <a href="#something">개인약관 </a>에 동의합니다.
									</label>
								</div>
							</div>

							<div class="footer text-center">
								<a href="/" type = "submit" id="register" class="btn btn-primary btn-round">회원가입</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" charset="UTF-8"
		src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/common.js"></script>
	<script type="text/javascript" charset="UTF-8"
		src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/util.js"></script>
	<script src="js/templ/jquery.min.js" type="text/javascript"></script>
	<script src="js/templ/bootstrap.min.js" type="text/javascript"></script>
	<script src="js/templ/material.min.js" type="text/javascript"></script>
	<script src="js/templ/perfect-scrollbar.jquery.min.js"
		type="text/javascript"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
	<script src="js/templ/arrive.min.js" type="text/javascript"></script>
	<script src="js/templ/jquery.validate.min.js"></script>
	<script src="js/templ/moment.min.js"></script>
	<script src="js/templ/chartist.min.js"></script>
	<script src="js/templ/jquery.bootstrap-wizard.js"></script>
	<script src="js/templ/bootstrap-notify.js"></script>
	<script src="js/templ/bootstrap-datetimepicker.js"></script>
	<script src="js/templ/jquery-jvectormap.js"></script>
	<script src="js/templ/nouislider.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<script src="js/templ/jquery.select-bootstrap.js"></script>
	<script src="js/templ/jquery.datatables.js"></script>
	<script src="js/templ/sweetalert2.js"></script>
	<script src="js/templ/jasny-bootstrap.min.js"></script>
	<script src="js/templ/fullcalendar.min.js"></script>
	<script src="js/templ/jquery.tagsinput.js"></script>
	<script src="js/templ/material-dashboard.js?v=1.3.0"></script>
	<script src="js/templ/demo.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script>
		$('.form-control').focusout(function() {
			var pwd1 = $("#password_1").val();
			var pwd2 = $("#password_2").val();
			
			if (pwd1 != '' && pwd2 == '') {
				null;
			} else if (pwd1 != "" || pwd2 != "") {
				
				if (pwd1 == pwd2) {
					$("#alert-success").css('display', 'inline-block');
					$("#alert-danger").css('display', 'none');
					$("#register").attr('href', "/");
				} else {
					/* alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요."); */
					$("#alert-success").css('display', 'none');
					$("#alert-danger").css('display', 'inline-block');
					$("#register").attr('href', "javascript:alert('패스워드가 일치하지 않습니다.')");
				}
			}
		});
	</script> 
	<script type="text/javascript">
		function checkPw(form) {
			var pwd1 = form.password_1.value;
			var pwd2 = form.password_2.value;
			if(pwd1 != pwd2){
				alert("패스 X");
				console.log(pwd1);
				console.log(pwd2);
				return false;
			}else{
				return true;		
			}
		}
		
	
	</script>
	<script type="text/javascript">
		$().ready(function() {
			demo.checkFullPageBackgroundImage();

			setTimeout(function() {
				// after 1000 ms we add the class animated to the login/register card
				$('.card').removeClass('card-hidden');
			}, 700)
		});
	</script>
	<%@ include file="./event_footer.jsp"%>

</body>
</html>