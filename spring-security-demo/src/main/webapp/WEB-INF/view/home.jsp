<%@ page import="java.io.*,java.util.*,java.sql.*"%>

<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c"    uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
	<link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>First page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />


    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/animate.min.css" />    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/demo.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/paper-dashboard.css"/>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/css/themify-icons.css"/>



    <!--  Fonts and icons     -->
    <link href="http://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href='https://fonts.googleapis.com/css?family=Muli:400,300' rel='stylesheet' type='text/css'>
  
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
                <li class="active">
                    <a href="${pageContext.request.contextPath}/home">
                        <i class="ti-panel"></i>
                        <p>Dashboard</p>
                    </a>
                </li>

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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/home">Dashboard</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                              <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                    <i class="ti-bell"></i>
                                    <p class="notification">5</p>
									<p>Notifications</p>
									<b class="caret"></b>
                              </a>
                              <ul class="dropdown-menu">
                                <li><a href="#">Notification 1</a></li>
                                <li><a href="#">Notification 2</a></li>
                                <li><a href="#">Notification 3</a></li>
                                <li><a href="#">Notification 4</a></li>
                                <li><a href="#">Another notification</a></li>
                              </ul>
                        </li>
						<li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<i class="ti-settings"></i>
								<p>Settings</p>
                                <b class="caret"></b>
                            </a>
                            
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/profile">Profile</a></li>
                                <li><a href="javascript:void(0)" onclick="logout()">Sign out</a></li>                                               
                           </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
       
        <form:form action = "${pageContext.request.contextPath}/logout" method="POST" id = "_logout">
            
        </form:form>
        <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/project_payroll"
         user = "root"  password = ""/>
        
         <sql:query dataSource="${snapshot}" var="result">
            SELECT empID,name,surname,department FROM hresources.employees;
         </sql:query>  
 
  
        <div class = "container">
          <div class="container-fluid">
            <form>
               <div class="row">
                     <div class="col-md-4">
                         <div class="form-group">
                              <label></label>
                              <input type="text" class="form-control border-input" placeholder="Search employee">
                         </div>
                    </div> 
                    <div class="col-md-2">
                         <div class="form-group">
                               <label></label>
                               <select class="form-control border-input" id="sel1">
                                  <option value ="Admin">Admin</option>
                                  <option value ="IT">I.T</option>
                                  <option value ="Call Center">Call Center</option>
                                  <option value ="Verification">Verification</option>
                                  <option value ="HR">HR</option>
                                  <option value ="Manager">Manager</option>
                                  <option value ="Field Sales">Field Sales</option>
                                  <option value ="other">Other</option>
                              </select>
                         </div>
                    </div>                                        
                    <div class="col-md-2">
                         <div class="form-group">
                               <label></label><br/>
                               <button type="submit" class="btn btn-info btn-fill btn-wd">Search</button>
                         </div>
                    </div> 
               </div>                                        
           </form>
          </div>
        </div>
       
        <div class="container">
         <div class="container-fluid">
                <div class="row">
                    <div class="col-md-10">
                        <div class="card">
                           
                            <div class="content table-responsive table-full-width">
                                <table class="table table-striped" id="datasetEmp">
                                    <thead>
                                        <th>empID</th>
                                    	<th>Name</th>
                                    	<th>Surname</th>
                                    	<th>Department</th>
                                        <th>More</th>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="row" items="${result.rows}">
                                        <tr>
                                        	<td>${row.empID}</td>
                                        	<td>${row.name}</td>
                                        	<td>${row.surname} </td>
                                        	<td>${row.department }</td>
                                            <td><a href="${pageContext.request.contextPath}/showEmployee?empID=${row.empID}"><i class = "ti-angle-right"></i></a></td>
                                        </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

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
                                ICON AF
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
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
   <script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap.min.js"></script>
   <script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-checkbox-radio.js"></script>
   <script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/bootstrap-notify.js"></script>
   <script src = "https://cdn.jsdelivr.net/npm/paper-dashboard@1.1.0/assets/js/paper-dashboard.js"></script>
   

   <script type="text/javascript">
	   
	function logout()
	{
		$("#_logout").submit();	
	}
	
    
	</script>
    
    <script>
    (function($) {

    	$.fn.ddTableFilter = function(options) {
    	  options = $.extend(true, $.fn.ddTableFilter.defaultOptions, options);

    	  return this.each(function() {
    	    if($(this).hasClass('ddtf-processed')) {
    	      refreshFilters(this);
    	      return;
    	    }
    	    var table = $(this);
    	    var start = new Date();

    	    $('th:visible', table).each(function(index) {
    	      if($(this).hasClass('skip-filter')) return;
    	      var selectbox = $('<select>');
    	      var values = [];
    	      var opts = [];
    	      selectbox.append('<option value="--all--">' + $(this).text() + '</option>');

    	      var col = $('tr:not(.skip-filter) td:nth-child(' + (index + 1) + ')', table).each(function() {
    	        var cellVal = options.valueCallback.apply(this);
    	        if(cellVal.length == 0) {
    	          cellVal = '--empty--';
    	        }
    	        $(this).attr('ddtf-value', cellVal);

    	        if($.inArray(cellVal, values) === -1) {
    	          var cellText = options.textCallback.apply(this);
    	          if(cellText.length == 0) {cellText = options.emptyText;}
    	          values.push(cellVal);
    	          opts.push({val:cellVal, text:cellText});
    	        }
    	      });
    	      if(opts.length < options.minOptions){
    	        return;
    	      }
    	      if(options.sortOpt) {
    	        opts.sort(options.sortOptCallback);
    	      }
    	      $.each(opts, function() {
    	        $(selectbox).append('<option value="' + this.val + '">' + this.text + '</option>')
    	      });

    	      $(this).wrapInner('<div style="display:none">');
    	      $(this).append(selectbox);

    	      selectbox.bind('change', {column:col}, function(event) {
    	        var changeStart = new Date();
    	        var value = $(this).val();

    	        event.data.column.each(function() {
    	          if($(this).attr('ddtf-value') === value || value == '--all--') {
    	            $(this).removeClass('ddtf-filtered');
    	          }
    	          else {
    	            $(this).addClass('ddtf-filtered');
    	          }
    	        });
    	        var changeStop = new Date();
    	        if(options.debug) {
    	          console.log('Search: ' + (changeStop.getTime() - changeStart.getTime()) + 'ms');
    	        }
    	        refreshFilters(table);

    	      });
    	      table.addClass('ddtf-processed');
    	      if($.isFunction(options.afterBuild)) {
    	        options.afterBuild.apply(table);
    	      }
    	    });

    	    function refreshFilters(table) {
    	      var refreshStart = new Date();
    	      $('tr', table).each(function() {
    	        var row = $(this);
    	        if($('td.ddtf-filtered', row).length > 0) {
    	          options.transition.hide.apply(row, options.transition.options);
    	        }
    	        else {
    	          options.transition.show.apply(row, options.transition.options);
    	        }
    	      });

    	      if($.isFunction(options.afterFilter)) {
    	        options.afterFilter.apply(table);
    	      }

    	      if(options.debug) {
    	        var refreshEnd = new Date();
    	        console.log('Refresh: ' + (refreshEnd.getTime() - refreshStart.getTime()) + 'ms');
    	      }
    	    }

    	    if(options.debug) {
    	      var stop = new Date();
    	      console.log('Build: ' + (stop.getTime() - start.getTime()) + 'ms');
    	    }
    	  });
    	};

    	$.fn.ddTableFilter.defaultOptions = {
    	  valueCallback:function() {
    	    return encodeURIComponent($.trim($(this).text()));
    	  },
    	  textCallback:function() {
    	    return $.trim($(this).text());
    	  },
    	  sortOptCallback: function(a, b) {
    	    return a.text.toLowerCase() > b.text.toLowerCase();
    	  },
    	  afterFilter: null,
    	  afterBuild: null,
    	  transition: {
    	    hide:$.fn.hide,
    	    show:$.fn.show,
    	    options: []
    	  },
    	  emptyText:'--Empty--',
    	  sortOpt:true,
    	  debug:false,
    	  minOptions:2
    	}

    	})(jQuery);   
    
	$("#datasetEmp").ddTableFilter();

    </script>
</html>
