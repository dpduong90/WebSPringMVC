<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>AccessDenied page</title>
	<link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
	<link href="<c:url value='/static/css/vendor.css' />" rel="stylesheet"></link>
	<link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/font-awesome/4.2.0/css/font-awesome.css" />
</head>
<body>
      <div class="main-wrapper">
          <div class="app" id="app">
          		<%@ include file = "template/header.jsp" %>
              	<%@ include file = "template/menu.jsp" %>
              	<div class="sidebar-overlay" id="sidebar-overlay"></div>
              	<article class="content static-tables-page">
	           		<div class="alert alert-danger">
						<label>You are not authorized to access this page.</label>
					</div>
	           	</article>
           </div>
       </div>
	<script src="<c:url value='/static/js/vendor.js' />"></script>
	<script src="<c:url value='/static/js/app.js' />"></script>
</body>
</html>