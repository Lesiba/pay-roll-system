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
<style>
.error {
	color: red;
}
</style>
</head>
<body>

	<div class="wrapper">
		<div class="sidebar" data-background-color="white"
			data-active-color="danger">

			<!--
		Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
		Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
	-->

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
								<div class="header">

									<%
										int empId = Integer.parseInt(request.getParameter("empID"));
									%>

									<!-- script for title formation -->
									<sql:query dataSource="${snapshot}" var="titleResult">
                                   SELECT name,surname FROM hresources.employees WHERE empID= <%=empId%>;
                                 </sql:query>
									<!-- Displaying title from abc table  table -->

									<sql:query dataSource="${snapshot}" var="campaignResult">
                                   SELECT * FROM abc_credit.users WHERE empID= <%=empId%>;
                                  </sql:query>

									<!-- Displaying title from hrresources table -->
									<c:forEach var="row" items="${titleResult.rows}">
										<h5 class="title">
											Name:
											<c:out value="${row.name}" />
											<c:out value="${row.surname}" />
										</h5>
										<br />


									</c:forEach>
									<!-- Query for abc_credit agents -->
									<c:forEach var="row" items="${campaignResult.rows}">
										<h5 class="title">Department: ABC_Credit</h5>
									</c:forEach>


								</div>
								<div class="content">
									<form:form
										action="${pageContext.request.contextPath}/processEmp"
										method="POST" modelAttribute="employee">
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Enter Sales Per Agent</label> <input type="text"
														class="form-control border-input" id="_sales" name="sales"
														onkeyup="fillSales()" placeholder="Sales Per Agent" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Select Campaign</label>
													<form:select path="campaign" id="selectCampaign"
														class="form-control border-input" onChange = "doCalculations()">
														<form:option value="0" label="--- Select Campaign ---" />
														<form:option value="Mzansi_Money" label="Mzansi Money" />
														<form:option value="Discovery" label="Discovery" />
														<form:option value="Santam" label="Santam" />
														<form:option value="King_Price" label="King Price" />
														<form:option value="Cfl" label="Cover for life" />
														<form:option value="CarTrack" label="Car Track" />
														<form:option value="ImaliSave" label="Imali save" />

													</form:select>
													<form:errors path="basicSalary" cssClass="error" />
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Sales Per Agent</label>
													<form:input type="text" class="form-control border-input"
														id = "sal" path="sales" name="sales" placeholder="Sales Per Agent"/>
													<form:errors path="sales" cssClass="error"/>
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Basic Salary</label>
													<form:input type="text" name="basicSalary"
														id = "basic_salary" class="form-control border-input" path="basicSalary"
														placeholder="Basic Salary" />
													<form:errors path="basicSalary" cssClass="error" />
												</div>
											</div>
										</div>

										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>Unpaid Days</label>
													<form:input type="text" name="unpaidDays"
														class="form-control border-input" path="unpaidDays"
														placeholder="Unpaid Days" />
													<form:errors path="basicSalary" cssClass="error" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>Basic Less Unpaid Days</label>
													<form:input type="text" name="blud" id="basic_salary"
														class="form-control border-input" path="blud"
														placeholder="Basic Less Unpaid Days" />
													<form:errors path="blud" cssClass="error" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-6">
												<div class="form-group">
													<label>GARNISHES + Late coming</label>
													<form:input type="text" path="girnLate" name="garnLate"
														class="form-control border-input"
														placeholder="GARNISHES + Late coming" />
													<form:errors path="girnLate" cssClass="error" />
												</div>
											</div>
											<div class="col-md-6">
												<div class="form-group">
													<label>COMMISSION</label>
													<form:input type="text" path="commission" name="commision"
														id = "commission" class="form-control border-input" placeholder="COMMISSION" />

													<form:errors path="commission" cssClass="error" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3">
												<div class="form-group">
													<label>GROSS PAY</label>
													<form:input type="text" path="grossPay" name="grossPay"
														class="form-control border-input" placeholder="GROSS PAY" />

													<form:errors path="grossPay" cssClass="error" />
												</div>
											</div>
											<input type="hidden" name="empId" value="<%=empId%>">

											<div class="col-md-3">
												<div class="form-group">
													<label>PAYE 6317+</label>
													<form:input type="text" path="payePlus" name="paye"
														class="form-control border-input" placeholder="PAYE 6317+" />
													<form:errors path="payePlus" cssClass="error" />

												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>UIF</label>
													<form:input type="text" path="uif" name="uif"
														class="form-control border-input" placeholder="UIF" />

													<form:errors path="uif" cssClass="error" />
												</div>
											</div>
											<div class="col-md-3">
												<div class="form-group">
													<label>NET SALARY</label>
													<form:input type="text" path="netSalary" name="netSalary"
														class="form-control border-input" placeholder="NET SALARY" />
													<form:errors path="netSalary" cssClass="error" />
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-md-3"></div>
											<div class="col-md-3"></div>
											<div class="col-md-3"></div>
											<div class="col-md-3">
												<div class="text-center" style="width: 12px;">
													<input type="submit" class="btn btn-info btn-fill btn-wd"
														value="Next" />
												</div>
											</div>
										</div>

										<div class="clearfix"></div>
									</form:form>
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
	
	function fillSales(sales){
		$( "#sal" ).val($( "#_sales" ).val());
		document.getElementById("sal").disabled = true;
	}
	
	
	function doCalculations()
	{
	    var x = document.getElementById("selectCampaign").value;
	    var sales;
	    var basic_salary;
	    var commission;
	    
	    var per1 = 0.05 * 89;
	    var per2 = 0.15 * 89;
	    var per3 = 0.25 * 89;
	    
	    var for200;
	    
	    //campaign selected.
	    console.log(x);
	    
	    if(x == "King_Price")
	    {
	        console.log("king price selected..");	
	    }
	    
	    if(x == "CarTrack")
	    {
	    	sales = document.getElementById("_sales").value;
	        if(sales == "")
	    	{
	    		alert("Enter number of sales.");
	    		$( "#_sales" ).focus();
	    	}	
	    }
        if(x == 'Mzansi_Money')
        {
        	sales = document.getElementById("_sales").value;
        	if(sales == "")
        	{
        		alert("Enter number of sales.");
        		$( "#_sales" ).focus();       
        	}
        	if(sales == 181)
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		console.log("qualifies for basic salary - " + basic_salary);
        		$( "#basic_salary" ).val(basic_salary);

        	}
        	if(sales < 181)
        	{
        		commission = parseFloat(sales * 10).toFixed(2);
        		console.log("do not qualify for basic salary - " + commission);
        		$( "#commission" ).val(commission);

        	}
        	if((sales >= 200) && (sales < 300))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per1 * sales).toFixed(2);
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);

        		console.log("commission for 200 sales - " + commission);
        	}
        	if((sales >= 300) && (sales < 400))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per2 * sales).toFixed(2);
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        		console.log("commission for 300 sales - " + commission);
        	}
        	if(sales >= 400)
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per3 * sales).toFixed(2);
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        		console.log("commission for 400 sales - " + commission);        		
        	}
        }
        
        if(x == 'Discovery')
        {
        	basic_salary = parseFloat('2500').toFixed(2);
        	sales = document.getElementById("_sales").value;
        	if(sales == "")
        	{
        		alert("Enter number of sales.");
        		$( "#_sales" ).focus();
        	}
        	if((sales >= '15') && (sales < '25'))
        	{
        		console.log('15 sales and probation - ' + basic_salary);	
        	}
        	if((sales >= '25') && (sales < '26'))
        	{
        		console.log('25 sales and not on probation - ' + basic_salary);
        	}
        	if((sales >= '26') && (sales <= '49'))
        	{
        		commission = sales * 50;
        		console.log('between 26 and 49 - 50 per sale');
        		console.log('no basic salary');
        	}
        }
        
        if(x == "Cfl")
        {
            sales = document.getElementById("_sales").value;
            if(sales == "")
        	{
        		alert("Enter number of sales.");
        		$( "#_sales" ).focus();
        	}
        	if(sales == 181)
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		console.log("qualifies for basic salary - " + basic_salary);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        	if(sales < 181)
        	{
        		basic_salary = parseFloat(sales * 10).toFixed(2);
        		console.log("do not qualify for basic salary - " + basic_salary);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        	if((sales >= 200) && (sales < 300))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per1 * sales).toFixed(2);
        		console.log("commission for 200 sales - " + commission);
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        	if((sales >= 300) && (sales < 400))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per2 * sales).toFixed(2);
        		console.log("commission for 300 sales - " + commission);
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        	if(sales >= 400)
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission =  parseFloat(per3 * sales).toFixed(2);
        		console.log("commission for 400 sales - " + commission);    
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        }
        
        if(x == "Santam")
        {
            sales = document.getElementById("_sales").value;
            if(sales == "")
        	{
        		alert("Enter number of sales.");
        		$( "#_sales" ).focus();
        	}
        	commission = sales  * 20;
    		console.log("commission(santam) - " + commission); 
    		$( "#commission" ).val(commission);
        }
        if(x == "ImaliSave")
        {
            sales = document.getElementById("_sales").value;
            if(sales == "")
        	{
        		alert("Enter number of sales.");
        		$( "#_sales" ).focus();
        	}
        }	
        
        if(x == "ImaliSave")	
        {
            sales = document.getElementById("_sales").value;
    		basic_salary = parseFloat('2500').toFixed(2);

            if(sales < 10)
            {
            	console.log('less than  10..');	
            }
        	if(sales == 10)
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		console.log('qualify for basic - ' + basic_salary);
        	}	
        	if((sales >= 11) && (sales <= 20))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission = sales * 80;
        		console.log("commission - " + commission);
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        	}
        	if((sales >=21) && (sales <= 24))
        	{
        		basic_salary = parseFloat('2500').toFixed(2);
        		commission = sales * 100;
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
        	}	
            if((sales >= 25))
            {
            	basic_salary = parseFloat('2500').toFixed(2);
        		commission = sales * 120;
        		
        		$( "#commission" ).val(commission);
        		$( "#basic_salary" ).val(basic_salary);
            }
        }
	}
</script>
</html>
