<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
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

<!-- styling for table -->
<style>
@import
	url('https://fonts.googleapis.com/css?family=Roboto:200,300,400,600,700')
	;

* {
	font-family: 'Roboto', sans-serif;
	font-size: 12px;
	color: #444;
}

#payslip {
	width: calc(8.5in - 80px);
	height: calc(11in - 60px);
	background: #fff;
	padding: 30px 40px;
}

#title {
	margin-bottom: 20px;
	font-size: 38px;
	font-weight: 600;
}

#scope {
	border-top: 1px solid #ccc;
	border-bottom: 1px solid #ccc;
	padding: 7px 0 4px 0;
	display: flex;
	justify-content: space-around;
	background-color: #E0E0E0;
}

#scope>.scope-entry {
	text-align: center;
}

#scope>.scope-entry>.value {
	font-size: 14px;
	font-weight: 700;
}

.content {
	display: flex;
	border-bottom: 1px solid #ccc;
}

.content .left-panel {
	border-right: 1px solid #ccc;
	min-width: 200px;
	padding: 20px 16px 0 0;
}

.content .right-panel {
	width: 100%;
	padding: 10px 0 0 16px;
}

#employee {
	text-align: center;
	margin-bottom: 20px;
}

#employee #name {
	font-size: 15px;
	font-weight: 700;
}

#employee #email {
	font-size: 11px;
	font-weight: 300;
}

.details, .contributions, .ytd, .gross {
	margin-bottom: 20px;
}

.details .entry, .contributions .entry, .ytd .entry {
	display: flex;
	justify-content: space-between;
	margin-bottom: 6px;
}

.details .entry .value, .contributions .entry .value, .ytd .entry .value
	{
	font-weight: 700;
	max-width: 130px;
	text-align: right;
}

.gross .entry .value {
	font-weight: 700;
	text-align: right;
	font-size: 16px;
}

.contributions .title, .ytd .title, .gross .title {
	font-size: 15px;
	font-weight: 700;
	border-bottom: 1px solid #ccc;
	padding-bottom: 4px;
	margin-bottom: 6px;
}

.content .right-panel .details {
	width: 100%;
}

.content .right-panel .details .entry {
	display: flex;
	padding: 0 10px;
	margin: 6px 0;
}

.content .right-panel .details .label {
	font-weight: 700;
	width: 120px;
}

.content .right-panel .details .detail {
	font-weight: 600;
	width: 130px;
}

.content .right-panel .details .rate {
	font-weight: 400;
	width: 80px;
	font-style: italic;
	letter-spacing: 1px;
}

.content .right-panel .details .amount {
	text-align: right;
	font-weight: 700;
	width: 90px;
}

.content .right-panel .details .net_pay div, .content .right-panel .details .nti div
	{
	font-weight: 600;
	font-size: 12px;
}

.net_pay {
	background-color: #E0E0E0;
}

.content .right-panel .details .net_pay, .content .right-panel .details .nti
	{
	padding: 3px 0 2px 0;
	margin-bottom: 10px;
	background: rgba(0, 0, 0, 0.04);
}
</style>

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
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12 col-md-7">
							<div class="card">

								<div id="payslip">
									<div id="title">Payslip - Icon Africa</div>
									<div id="scope">
										<div class="scope-entry left-panel">
											<div class="title">Company Name</div>
											<div class="title">Company Address</div>
											<div class="title">Company Contacts</div>
										</div>
										<div class="scope-entry">
											<div class="value">IconAF PTY LTD</div>
											<div class="value">296 KENT AVENUE, RANDBURG,2194</div>
											<div class="value">Tel 011 781 4154 info@iconaf.com</div>
										</div>
									</div>
									<div class="details">
										<div class="content">
											<div class="left-panel">
												<div class="entry">
													<div class="value">Employee Name:</div>
													<div class="value">Alice Modiba</div>
												</div>
												<div class="entry">
													<div class="value">Employee Address:</div>
													<div class="value">145 CRESTHILL MANSIONS, 15 PETERSON STREET ,HILLBROW, 2001</div>
												</div>
												<div class="entry">
													<div class="value">Employee ID:</div>
													<div class="value">900505-6411-085</div>
												</div>
												<div class="entry">
													<div class="value">Employee tax no:</div>
													<div class="value">-</div>
												</div>
											</div>
											<div class="right-panel">
												<div class="entry">
													<div class="value">Engagement Date:</div>
													<div class="value">2017/09/11</div>
												</div>
												<div class="entry">
													<div class="value">Pay Period:</div>
													<div class="value">30-Nov-17</div>
												</div>
												<div class="entry">
													<div class="value">Designation:</div>
													<div class="value">Sales Agent</div>
												</div>
												<div class="entry">
													<div class="value">Employee Number:</div>
													<div class="value">70797</div>
												</div>
											</div>
										</div>
									</div>
									<div id="scope">
										<div class="scope-entry">
											<div class="title">Earnings</div>
										</div>
										<div class="scope-entry">
											<div class="title">Deductions</div>
										</div>
									</div>
									<div class="details">
										<div class="content">
											<div class="left-panel">
												<div class="entry">
													<div class="value">Basic salary:</div>
													<div class="value">2500,00</div>
												</div>
												<div class="entry">
													<div class="value">Commission:</div>
													<div class="value">992,35</div>
												</div>
												<div class="entry">
													<div class="value">Stipend:</div>
													<div class="value">0</div>
												</div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry"></div>
												<div class="entry">
													<div class="value">Total Earnings:</div>
													<div class="value">3 492,35</div>
												</div>
											</div>
											<div class="right-panel">
												<div class="details">

													<div class="entry">
														<div class="value">P.A.Y.E.</div>
														<div class="value">0</div>
													</div>
													<div class="entry">
														<div class="value">U.I.F:</div>
														<div class="value">25,00</div>
													</div>
													<div class="entry">
														<div class="value">Unpaid Leave:</div>
														<div class="value">113,64</div>
													</div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry"></div>
													<div class="entry">
														<div class="value">Total Deduction:</div>
														<div class="value">138,64</div>
													</div>
												</div>

											</div>


											<!-- div id="editor"></div --->


										</div>

										<div class="net_pay">
											<div class="entry">
												<div class="label" style="color: black;">NET Salary</div>
												<div class="value">69,656.21</div>
											</div>
										</div>
										<div class="content">
											<div class="footer">

												<div class="stats">
													<button type="submit" class="btn btn-info btn-fill btn-wd"
														id="cmd">Save As</button>
													<button type="submit" class="btn btn-info btn-fill btn-wd">Email</button>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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
										document
												.write(new Date().getFullYear())
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
<script src="https://code.jquery.com/jquery-1.12.3.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<script>
	$(document).ready(function() {
		var doc = new jsPDF();
		var specialElementHandlers = {
			'#editor' : function(element, renderer) {
				return true;
			}
		};

		$('#cmd').click(function() {
			doc.fromHTML($('#content').html(), 15, 15, {
				'width' : 170,
				'elementHandlers' : specialElementHandlers
			});
			doc.save('sample-file.pdf');
		});
	});
</script>


</html>