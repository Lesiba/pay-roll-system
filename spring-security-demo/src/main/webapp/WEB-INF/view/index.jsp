<%@ page  language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix = "security" uri="http://www.springframework.org/security/tags" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    
    <meta htpp-equiv="Content-Type" content="text/html; charset=ISO-8859-1"/>
   
    <title>Icon Af Payroll - Sign in</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/animate.min.css" />    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/demo.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/paper-dashboard.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/themify-icons.css"/>

</head>
<body>

<div class="wrapper">
    <div class="sidebar" data-background-color="white" data-active-color="danger">

        <!--
            Tip 1: you can change the color of the sidebar's background using: data-background-color="white | black"
            Tip 2: you can change the color of the active button using the data-active-color="primary | info | success | warning | danger"
        -->

        <div class="sidebar-wrapper">
            <div class="logo">
                <a href="#" class="simple-text">
                    ICON AFRICA
                </a>
            </div>

            <ul class="nav">

            </ul>
        </div>
    </div>

    <div class="main-panel">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar bar1"></span>
                        <span class="icon-bar bar2"></span>
                        <span class="icon-bar bar3"></span>
                    </button>
                    <a class="navbar-brand" href="#"></a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">

                    </ul>

                </div>
            </div>
        </nav>


        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8 col-md-2">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Sign in</h4>
                            </div>
                             <div>
									<c:if test="${param.error != null}">
										<p>Invalid username and password.</p>
									</c:if>
									
									<c:if test="${param.logout != null}">									
										<p>You have been logged out.</p>                                    
                                    </c:if>
                                    
					            </div>
                            <div class="content">
                                <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Username</label>
                                                <input type="text" class="form-control border-input" name = "username" placeholder="Username">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Password</label>
                                                <input type="password" class="form-control border-input" name= "password" placeholder="password">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-info btn-fill btn-wd">Login</button>
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

                        <li>
                            <a href="http://www.creative-tim.com">
                                Creative Tim
                            </a>
                        </li>
                        <li>
                            <a href="http://blog.creative-tim.com">
                                Blog
                            </a>
                        </li>
                        <li>
                            <a href="http://www.creative-tim.com/license">
                                Licenses
                            </a>
                        </li>
                    </ul>
                </nav>
                <div class="copyright pull-right">
                    &copy; <script>document.write(new Date().getFullYear())</script>, made with <i class="fa fa-heart heart"></i> by <a href="http://www.creative-tim.com">Creative Tim</a>
                </div>
            </div>
        </footer>

    </div>
</div>
</body>

<script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap.min.js"></script>
<script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-checkbox-radio.js"></script>
<script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-notify.js"></script>
<script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/jquery-1.10.2.js"></script>
<script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/paper-dashboard.js"></script>

</html>