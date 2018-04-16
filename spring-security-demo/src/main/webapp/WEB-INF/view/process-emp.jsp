<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="assets/img/apple-icon.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

<title>First page</title>

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0'
	name='viewport' />
<meta name="viewport" content="width=device-width" />


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/animate.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/demo.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/paper-dashboard.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/themify-icons.css" />



<!--  Fonts and icons     -->
<link
	href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Muli:400,300'
	rel='stylesheet' type='text/css'>

</head>
<body>
    <div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<div class="sidebar-wrapper">
				<div class="logo">
					<a href="#" class="simple-text"> ICON AFRICA </a>
				</div>
				<ul class="nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}/home"> <i
							class="ti-panel"></i>
							<p>Dashboard</p>					
					</a></li>
				</ul>
			</div>
		</div>

		<div class="main-panel">
			<nav class="navbar navbar-default">
				<div class="container-fluid">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar bar1"></span> <span class="icon-bar bar2"></span>
							<span class="icon-bar bar3"></span>
						</button>
						<a class="navbar-brand"
							href="${pageContext.request.contextPath}/home">Dashboard</a>
					</div>
					<div class="collapse navbar-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="ti-bell"></i>
									<p class="notification">5</p>
									<p>Notifications</p> <b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a href="#">Notification 1</a></li>
									<li><a href="#">Notification 2</a></li>
									<li><a href="#">Notification 3</a></li>
									<li><a href="#">Notification 4</a></li>
									<li><a href="#">Another notification</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown"> <i class="ti-settings"></i>
									<p>Settings</p> <b class="caret"></b>
							</a>

								<ul class="dropdown-menu">
									<li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
									<li><a href="javascript:void(0)" onclick="logout()">Sign
											out</a></li>
								</ul></li>
						</ul>

					</div>
				</div>
			</nav>

			<form:form action="${pageContext.request.contextPath}/logout"
				method="POST" id="_logout">

			</form:form>
			<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
				url="jdbc:mysql://localhost/project_payroll" user="root" password="" />

			<div class="container-fluid">
				<div class="row">
					<div class="col-md-3">
						<div class="text-center" style="width: 12px;">
							<a href="${pageContext.request.contextPath}/home"><button
									type="submit" class="btn btn-info btn-fill btn-wd">Back</button></a>
						</div>
					</div>
				</div>
			</div>

			<div class="content">
				
			</div>
			<footer class="footer">
				<div class="container-fluid">
					<nav class="pull-left">
						<ul>

							<li><a href="http://www.creative-tim.com"> ICON AF </a></li>
							<li><a href="http://blog.creative-tim.com"> Blog </a></li>
							<li><a href="http://www.creative-tim.com/license">
									Licenses </a></li>
						</ul>
					</nav>
					<div class="copyright pull-right">
						&copy;
						<script>
							document.write(new Date().getFullYear())
						</script>
						, made with <i class="fa fa-heart heart"></i> by <a
							href="http://www.creative-tim.com">Creative Tim</a>
					</div>
				</div>
			</footer>

		</div>
	</div>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-checkbox-radio.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-notify.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/paper-dashboard.js"></script>

<script type="text/javascript">
	function logout() {
		$("#_logout").submit();
	}
</script>
</html>