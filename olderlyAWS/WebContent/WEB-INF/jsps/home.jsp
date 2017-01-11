<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<sec:authorize access="!isAuthenticated()">
		<p>
			<a href="<c:url value='/login'/>">Log In</a>
		</p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<p>
			<c:url var="logoutUrl" value="/logout" />
		<form action="${logoutUrl}" method="post">
			<input type="submit" value="Log Out" /> <input type="hidden"
				name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>


	</sec:authorize>

	<sec:authorize access="!isAuthenticated()">
		<p>
			<a href="<c:url value='/newaccount'/>">Create Account</a>
		</p>
	</sec:authorize>

	<sec:authorize access="isAuthenticated()">
		<p>
			<a href="<c:url value='/assignments'/>">View All Assignments</a>
		</p>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_USER')">
		<p>
			<a href="<c:url value='/myassignments'/>">My Assignments</a>
		</p>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<p>
			<a href="<c:url value='/createassignment'/>">Add New Assignment</a>
		</p>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<p>
			<a href="<c:url value='/clients'/>">View All Clients</a>
		</p>
	</sec:authorize>

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<p>
			<a href="<c:url value='/newclient'/>">Add New Client</a>
		</p>
	</sec:authorize>

</body>
</html>