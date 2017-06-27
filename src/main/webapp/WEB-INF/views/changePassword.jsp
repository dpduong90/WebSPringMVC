<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="modal fade" id="modal-media">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span> <span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Change Password</h4>
			</div>
			<c:url var="changePasswordURL" value="/change-password" />
			<form:form method="POST" class="form-horizontal" action="${changePasswordURL}-${loggedinuser}">
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<div id ="alert" class="alert alert-danger hidden">
							<label>Retype New Password do not match!</label>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
				 		<label class="left-modal" for="old-password">Old Password:</label>
		              	<div class="right-modal container-old-password">
		                	<input type="password" name="oldPassword" id="oldPassword" class="form-control" value="" required>
		                	<span class="input-old-password-icon"></span>
		            	</div>
		            	<div class="input-old-password-message"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="left-modal" for="new-password">New Password:</label>
		              	<div class="right-modal container-new-password">
		                	<input  type="password" name="newPassword" id="newPassword" class="form-control" value="" required>
		                	<span class="input-new-password-icon"></span>
		            	</div>
		            	<div class="input-new-password-message"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="left-modal">Retype New Password:</label>
		              	<div class="right-modal container-new-password-retype">
		                	<input type="password" name="newPasswordRetype" id="newPasswordRetype" class="form-control" value="" required>
		                	<span class="input-new-password-retype-icon"></span>
		            	</div>
		            	<div class="input-new-password-retype-message"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<input type="submit" class="btn btn-primary" value="Save" onClick="return validate()"></input> 
			</div>
			</form:form>
		</div>
	</div>
</div>

<script>
	function validate(){
		var newPassword = $('#newPassword').val();
		var newPasswordRetype = $('#newPasswordRetype').val();
		if(newPassword != newPasswordRetype) {
			$("#alert").removeClass('hidden');
      		return false;
		}
		return true;
	}

</script>