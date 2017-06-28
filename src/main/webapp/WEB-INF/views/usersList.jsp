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
	<link href="<c:url value='/static/plugin/bootstrap-datepicker/css/bootstrap-datepicker3.min.css' />" rel="stylesheet" media="screen">
	<script type="text/javascript" src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
	<script type="text/javascript" src="<c:url value='/static/plugin/bootstrap-datepicker/bootstrap-datetimepicker.js' />" charset="UTF-8"></script>
	<script type="text/javascript" src="<c:url value='/static/plugin/bootstrap-datepicker/locales/bootstrap-datetimepicker.fr.js' />" charset="UTF-8"></script>
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
						<div class="col-md-3">
							<label class="left-modal">User name:</label>
							<div class="right-modal" >
								<input name="username" id="username" class="form-control input-group"  title="Username">
							</div>
						</div>
						<div class="col-md-3">
							<label class="left-modal">Creater:</label>
							<div class="right-modal" >
								<input name="creater" id="creater" class="form-control input-group"  title="Creater">
							</div>
						</div>
						<div class="col-md-3">
				             <label class="left-modal">Create At:</label>
				              	<div class="right-modal" >
				                	<input name="createDate" id="createDate" class="form-control"  title="Create Time">
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
											        <th>Creater</th>
											        <th>Create Time</th>
											        <th>Update Time</th>
											        <sec:authorize access="hasRole('SUPER_ADMIN')">
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
														<td>${user.creater}</td>
														<td>${user.create_at}</td>
														<td>${user.update_at}</td>
													    <sec:authorize access="hasRole('SUPER_ADMIN')">
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
                       <sec:authorize access="hasRole('SUPER_ADMIN')">
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
		
		<script type="text/javascript">
			$(document).ready(function(){
				$('#createDate').datepicker({
			        format: "yyyy-mm-dd",
			        autoclose: true,
			        minView: 3
			    });
			});
		</script>
		<script src="<c:url value='/static/js/vendor.js' />"></script>
		<script src="<c:url value='/static/js/app.js' />"></script>
</body>
</html>