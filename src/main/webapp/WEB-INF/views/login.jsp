<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Login page</title>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/vendor.css' />" rel="stylesheet"></link>
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
</head>

<body>
	<div class="auth" id="mainWrapper">
		<div class="auth-container">
			<div class="card">
				<header class="auth-header">
					<h1 class="auth-title">
						<div class="logo">
							<span class="l l1"></span> 
							<span class="l l2"></span> 
							<span class="l l3"></span> 
							<span class="l l4"></span> 
							<span class="l l5"></span> 
						</div> Admin 
					</h1>
				</header>
				<div class="auth-content">
					<p class="text-xs-center">LOGIN TO CONTINUE</p>
					<c:url var="loginUrl" value="/login" />
					<form action="${loginUrl}" method="post" class="form-horizontal">
						<c:if test="${param.error != null}">
							<div class="alert alert-danger">
								<label>Invalid username or password.</label>
							</div>
						</c:if>
						<div class="form-group">
							<label for="username">Username</label> <input type="text"
								class="form-control underlined" id="username" name="username" placeholder="Your username" required>
						</div>
						<div class="form-group">
							<label for="password">Password</label> <input type="password"
								class="form-control underlined" name="password" id="password" placeholder="Your password" required>
						</div>
						<div class="form-group">
							<label>
								<input type="checkbox" id="rememberme" name="remember-me"> Remember Me
							</label>
						</div>
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<div class="form-actions">
							<input type="submit" class="btn btn-block btn-primary" value="Log in">
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- Reference block for JS -->
	<div class="ref" id="ref">
		<div class="color-primary"></div>
		<div class="chart">
			<div class="color-primary"></div>
			<div class="color-secondary"></div>
		</div>
	</div>
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'https://www.google-analytics.com/analytics.js', 'ga');
		ga('create', 'UA-80463319-2', 'auto');
		ga('send', 'pageview');
	</script>
	<script src="<c:url value='/static/js/vendor.js' />"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
</body>
</html>