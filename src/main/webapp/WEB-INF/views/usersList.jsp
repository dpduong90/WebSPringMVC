<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>

<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
                   <div class="title-block">
                       <h1 class="title"> Account management </h1>
                   </div>
                   <c:url var="searchURL" value="/search" />
                   <form:form method="GET" class="form-horizontal" action="${searchURL}">
					<div class="row">
						<div class="col-md-5">
							<label class="left-modal">User name:</label>
							<div class="right-modal container-start-date-sql" >
								<input name="username" id="username" class="form-control input-group"  title="From">
							</div>
						</div>
						<div class="col-md-3">
							<input type="submit" class="btn btn-success mg-top-30" value="Search"></input> 
						</div>
					</div>
					</form:form>
                   <section class="section">

                       <div class="row">
                           <div class="col-md-12">
                               <div class="card">
                                   <div class="card-block">
                                       <section class="example">
                                           <table class="table table-sm">
                                               <thead class="thead-inverse">
                                                   <tr>
											        <th>Firstname</th>
											        <th>Lastname</th>
											        <th>Email</th>
											        <th>Username</th>
											        <th>Phone</th>
											        <th>Address</th>
											        <sec:authorize access="hasRole('ADMIN')">
											        	<th>Action</th>
											        </sec:authorize>
											        
												</tr>
                                               </thead>
                                               <tbody id="user-body">
                                                <c:forEach items="${users}" var="user">
													<tr>
														<td>${user.firstName}</td>
														<td>${user.lastName}</td>
														<td>${user.email}</td>
														<td>${user.username}</td>
														<td>${user.phone}</td>
														<td>${user.address}</td>
													    <sec:authorize access="hasRole('ADMIN')">
															<td>
																<a href="<c:url value='/edit-user-${user.username}' />" class="btn btn-success custom-width">Edit</a>
																<a href="<c:url value='/delete-user-${user.username}' />" class="btn btn-danger custom-width" onclick="return confirm('Are you sure delete this user?')">Delete</a>
															</td>
												        </sec:authorize>
													</tr>
												</c:forEach>
                                               </tbody>
                                           </table>
                                       </section>
                                   </div>
                               </div>
                           </div>
                       </div>
                       <sec:authorize access="hasRole('ADMIN')">
	                       <div class="row">
	                       		<div class="col-md-12">
	                       			<a href="<c:url value='/newuser' />" class="btn btn-info custom-width pull-right">Add User</a>
	                       		</div>
	                       </div>
                       </sec:authorize>
                       <c:if test="${success != null}">
							<div class="alert alert-success">
								<label>${success}</label>
							</div>
						</c:if>
						<c:if test="${error != null}">
							<div class="alert alert-danger">
								<label>${error}</label>
							</div>
						</c:if>
                   </section>
               </article>
           </div>
       </div>
		
		<!-- Include model -->
		<%@ include file="changePassword.jsp"%>
		
		<script src="<c:url value='/static/js/vendor.js' />"></script>
		<script src="<c:url value='/static/js/app.js' />"></script>
</body>
</html>