<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
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
                                               <tbody>
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
                   </section>
               </article>
               
               <!-- /.modal -->
               <div class="modal fade" id="confirm-modal">
                   <div class="modal-dialog" role="document">
                       <div class="modal-content">
                           <div class="modal-header"> 
                           		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
				   					<span aria-hidden="true">&times;</span>
				   				</button>
                               <h4 class="modal-title"><i class="fa fa-warning"></i> Alert</h4>
                           </div>
                           <div class="modal-body">
                               <p>Are you sure want to do this?</p>
                           </div>
                           <div class="modal-footer"> <button type="button" class="btn btn-primary" data-dismiss="modal">Yes</button> <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button> </div>
                       </div>
                       <!-- /.modal-content -->
                   </div>
                   <!-- /.modal-dialog -->
               </div>
               <c:if test="${success != null}">
					<div class="alert alert-danger">
						<label>Invalid username or password.</label>
					</div>
				</c:if>
               <!-- /.modal -->
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
		<!-- Include model -->
		<%@ include file="changePassword.jsp"%>
		
		<script src="<c:url value='/static/js/vendor.js' />"></script>
		<script src="<c:url value='/static/js/app.js' />"></script>
		<script src="<c:url value='/static/js/usersList.js' />"></script>
</body>
</html>