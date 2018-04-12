<%@ taglib prefix = "form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "c"    uri = "http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
	<title>luv2code Company Home Page</title>
	<!-- Reference Bootstrap files -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
	<script	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<h2>luv2code Company Home Page</h2>
	<hr>
	
	<!-- display the user id -->
	<p>
	    User: <sec:authentication property="principal.username"/>
        <br/><br/>
	    Roles(s): <sec:authentication property="principal.authorities"/>
    </p> 
    
    <!-- Add a link to point to /leaders... this is for the managers -->
    <p>
         <a href="${pageContext.request.contextPath}/leaders">LeaderShip Meeting</a>
         (Only for Manager peeps)
    </p>
    <hr>  
   <form:form action = "${pageContext.request.contextPath}/logout" method="POST">
   
         <input type = "submit" value="Logout"/>
         
   </form:form>
</body>

</html>