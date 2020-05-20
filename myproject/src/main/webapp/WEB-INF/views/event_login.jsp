<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="apple-touch-icon" sizes="76x76"
    href="img/apple-icon.png">
<link rel="icon" type="image/png" href="img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>사로나 프로젝트</title>
<meta
    content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" name="viewport">
<meta name="viewport" content="width=device-width">

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/material-dashboard.css?v=1.3.0" rel="stylesheet">
<link href="css/demo.css" rel="stylesheet">
<!--     Fonts and icons     -->
<link
    href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
    rel="stylesheet">
<link rel="stylesheet" type="text/css"
    href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Material+Icons">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
    rel="stylesheet">

<script type="text/javascript" charset="UTF-8"
    src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/common.js"></script>
<script type="text/javascript" charset="UTF-8"
    src="https://maps.googleapis.com/maps-api-v3/api/js/40/12/util.js"></script>
<!--   Core JS Files   -->
<script src="js/templ/jquery.min.js" type="text/javascript"></script>
<script src="js/templ/bootstrap.min.js" type="text/javascript"></script>
<script src="js/templ/material.min.js" type="text/javascript"></script>
<script src="js/templ/perfect-scrollbar.jquery.min.js"
    type="text/javascript"></script>

<!-- Include a polyfill for ES6 Promises (optional) for IE11, UC Browser and Android browser support SweetAlert -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
<!-- Library for adding dinamically elements -->
<script src="js/templ/arrive.min.js" type="text/javascript"></script>
<!-- Forms Validations Plugin -->
<script src="js/templ/jquery.validate.min.js"></script>
<!--  Plugin for Date Time Picker and Full Calendar Plugin-->
<script src="js/templ/moment.min.js"></script>
<!--  Charts Plugin, full documentation here: https://gionkunz.github.io/chartist-js/ -->
<script src="js/templ/chartist.min.js"></script>
<!--  Plugin for the Wizard, full documentation here: https://github.com/VinceG/twitter-bootstrap-wizard -->
<script src="js/templ/jquery.bootstrap-wizard.js"></script>
<!--  Notifications Plugin, full documentation here: http://bootstrap-notify.remabledesigns.com/    -->
<script src="js/templ/bootstrap-notify.js"></script>
<!--  Plugin for the DateTimePicker, full documentation here: https://eonasdan.github.io/bootstrap-datetimepicker/ -->
<script src="js/templ/bootstrap-datetimepicker.js"></script>
<!-- Vector Map plugin, full documentation here: http://jvectormap.com/documentation/ -->
<script src="js/templ/jquery-jvectormap.js"></script>
<!-- Sliders Plugin, full documentation here: https://refreshless.com/nouislider/ -->
<script src="js/templ/nouislider.min.js"></script>
<!--  Google Maps Plugin    -->
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
<!--  Plugin for Select, full documentation here: http://silviomoreto.github.io/bootstrap-select -->
<script src="js/templ/jquery.select-bootstrap.js"></script>
<!--  DataTables.net Plugin, full documentation here: https://datatables.net/    -->
<script src="js/templ/jquery.datatables.js"></script>
<!-- Sweet Alert 2 plugin, full documentation here: https://limonte.github.io/sweetalert2/ -->
<script src="js/templ/sweetalert2.js"></script>
<!-- Plugin for Fileupload, full documentation here: http://www.jasny.net/bootstrap/javascript/#fileinput -->
<script src="js/templ/jasny-bootstrap.min.js"></script>
<!--  Full Calendar Plugin, full documentation here: https://github.com/fullcalendar/fullcalendar    -->
<script src="js/templ/fullcalendar.min.js"></script>
<!-- Plugin for Tags, full documentation here: https://github.com/bootstrap-tagsinput/bootstrap-tagsinputs  -->
<script src="js/templ/jquery.tagsinput.js"></script>
<!-- Material Dashboard javascript methods -->
<script src="js/templ/material-dashboard.js?v=1.3.0"></script>
<!-- Material Dashboard DEMO methods, don't include it in your project! -->
<script src="js/templ/demo.js"></script>

<script type="text/javascript">
    $().ready(function() {
        demo.checkFullPageBackgroundImage();

        setTimeout(function() {
            // after 1000 ms we add the class animated to the login/register card
            $('.card').removeClass('card-hidden');
        }, 700)
    });
</script>
<%@ include file="./html_head.html"%>
<title>진행중인 이벤트 | KT</title>
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
							<a href="#btn" class="btn btn-just-icon btn-simple"> <i
								class="fa fa-facebook-square"></i>
							</a> <a href="#pablo" class="btn btn-just-icon btn-simple"> <i
								class="fa fa-twitter"></i>
							</a> <a href="#eugen" class="btn btn-just-icon btn-simple"> <i
								class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
					<p class="category text-center">이메일주소와 비밀번호를 입력하세요.</p>
					<div class="card-content">
						<div class="input-group">
							<span class="input-group-addon"> <i class="material-icons">email</i>
							</span>

							<div class="form-group label-floating is-empty">
								<label class="control-label">이메일 주소</label> <input type="email"
									class="form-control"> <span class="material-input"></span>
							</div>
						</div>

						<div class="input-group">
							<span class="input-group-addon"> <i class="material-icons">lock_outline</i>
							</span>
							<div class="form-group label-floating is-empty">
								<label class="control-label">비밀번호</label> <input type="password"
									class="form-control"> <span class="material-input"></span>
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