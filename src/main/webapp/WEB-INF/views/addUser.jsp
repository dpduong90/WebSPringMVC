<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Users List</title>
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
               		<form:form method="POST" modelAttribute="user" class="form-horizontal">
						<form:input type="hidden" path="id" id="id"/>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="firstName">First Name</label>
								<div class="col-md-7">
									<form:input type="text" path="firstName" id="firstName" class="form-control input-sm"/>
									<div class="has-error">
										<form:errors path="firstName" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="lastName">Last Name</label>
								<div class="col-md-7">
									<form:input type="text" path="lastName" id="lastName" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="lastName" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="username">Username</label>
								<div class="col-md-7">
									<c:choose>
										<c:when test="${edit}">
											<form:input type="text" path="username" id="username" class="form-control input-sm" disabled="true"/>
										</c:when>
										<c:otherwise>
											<form:input type="text" path="username" id="username" class="form-control input-sm" />
											<div class="has-error">
												<form:errors path="username" class="help-inline"/>
											</div>
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="password">Password</label>
								<div class="col-md-7">
									<form:input type="password" path="password" id="password" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="password" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="email">Email</label>
								<div class="col-md-7">
									<form:input type="text" path="email" id="email" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="email" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="roles">Roles</label>
								<div class="col-md-7">
									<form:select path="roles" items="${roles}" multiple="false" itemValue="id" itemLabel="type" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="roles" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
				
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="phone">Phone</label>
								<div class="col-md-7">
									<form:input type="text" path="phone" id="phone" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="lastName" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="form-group col-md-12">
								<label class="col-md-3 control-lable" for="address">Address</label>
								<div class="col-md-7">
									<form:input type="text" path="address" id="address" class="form-control input-sm" />
									<div class="has-error">
										<form:errors path="lastName" class="help-inline"/>
									</div>
								</div>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-7">
								<div class="form-actions floatRight  pull-right">
									<c:choose>
										<c:when test="${edit}">
											<input type="submit" class="btn btn-info custom-width" value="Update User"></input> 
											<a href="<c:url value='/list' />" class="btn btn-danger custom-width">Cancel</a>
										</c:when>
										<c:otherwise>
											<input type="submit" class="btn btn-info custom-width" value="Add User"></input> 
											<a href="<c:url value='/list' />" class="btn btn-danger custom-width">Cancel</a> 
										</c:otherwise>
									</c:choose>
								</div>
							</div>
						</div>
					</form:form>
               </article>
        	</div>
        </div>
        <script src="<c:url value='/static/js/vendor.js' />"></script>
		<script src="<c:url value='/static/js/app.js' />"></script>
</body>
</html>

