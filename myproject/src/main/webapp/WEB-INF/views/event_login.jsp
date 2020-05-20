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
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<%@ include file="./html_head.html"%>
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

<title>로그인 | KT</title>
</head>
<body>

	<%@ include file="./main_header.jsp"%>

	<div class="row">
		<div class="col-md-4 col-sm-6 col-md-offset-4 col-sm-offset-3">
			<form method="#" action="#">
				<div class="card card-login">
					<div class="card-header text-center" data-background-color="ktcolor">
						<h4 class="card-title">로그인</h4>
						<div class="social-line">
							<a href="#btn" class="btn btn-just-icon btn-simple">
								<i class="fa fa-facebook-square"></i>
							</a>
							<a href="#pablo" class="btn btn-just-icon btn-simple">
								<i class="fa fa-twitter"></i>
							</a> 
							<a href="#eugen" class="btn btn-just-icon btn-simple">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
					<p class="category text-center">이메일주소와 비밀번호를 입력하세요.</p>
					<div class="card-content">
						<div class="input-group">
							<span class="input-group-addon">
								<i class="material-icons">email</i>
							</span>

							<div class="form-group label-floating is-empty">
								<label class="control-label">이메일 주소</label>
								<input type="email" class="form-control">
								<span class="material-input"></span>
							</div>
						</div>

						<div class="input-group">
							<span class="input-group-addon">
								<i class="material-icons">lock_outline</i>
							</span>
							<div class="form-group label-floating is-empty">
								<label class="control-label">비밀번호</label>
								<input type="password" class="form-control">
								<span class="material-input"></span>
							</div>
						</div>
					</div>
					<div class="footer text-center">
						<button type="submit" class="btn btn-primary btn-round">로그인</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<%@ include file="./event_footer.jsp"%>

</body>
</html>