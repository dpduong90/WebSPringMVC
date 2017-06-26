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
			<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
				 		<label class="left-modal">Old Password:</label>
		              	<div class="right-modal container-old-password">
		                	<input type="password" name="old-pass" id="old-password" class="form-control" value="" required>
		                	<span class="input-old-password-icon"></span>
		            	</div>
		            	<div class="input-old-password-message"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="left-modal">New Password:</label>
		              	<div class="right-modal container-new-password">
		                	<input  type="password" name="new-pass" id="new-password" class="form-control" value="" required>
		                	<span class="input-new-password-icon"></span>
		            	</div>
		            	<div class="input-new-password-message"></div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label class="left-modal">Retype New Password:</label>
		              	<div class="right-modal container-new-password-retype">
		                	<input type="password" name="new-pass-retype" id="new-pass-retype" class="form-control" value="" required>
		                	<span class="input-new-password-retype-icon"></span>
		            	</div>
		            	<div class="input-new-password-retype-message"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" id="btn-change-password" onClick="changePassword()">Save</button>
			</div>
		</div>
	</div>
</div>

<script>
	function changePassword() {
		var data = {
			password: $('#new-password').val(),
			oldPassword : $('#old-password').val()
		};
		/* if(check(data)){ return }; */
			$.ajax({
				url:"<c:url value="/change-password"/>",
				type: "POST",
				data: {username: 'admin', password: '1234'},
				contentType : "application/json",
				success : function(data){
					if(data.success){
					} else {
						showAlert("Lỗi", data.message);
					}
				}
			});
	}
		
	function check(data){
		var error = false;
		if(data.oldPassword.length == 0) {
			$(".container-old-password").addClass('has-error has-feedback');
      		$(".container-old-password-icon").addClass("glyphicon glyphicon-remove form-control-feedback");
      		error = true;
		} else {
			$(".container-old-password").removeClass('has-error has-feedback');
      		$(".container-old-password-icon").removeClass("glyphicon glyphicon-remove form-control-feedback");
		}

		if(data.password.length == 0) {
			$(".container-new-password").addClass('has-error has-feedback');
      		$(".container-new-password-icon").addClass("glyphicon glyphicon-remove form-control-feedback");
      		error = true;
		} else {
			$(".container-new-password").removeClass('has-error has-feedback');
      		$(".container-new-password-icon").removeClass("glyphicon glyphicon-remove form-control-feedback");
		}
		
		if($('#new-pass-retype').val().length == 0) {
			$(".container-new-password-retype").addClass('has-error has-feedback');
      		$(".container-new-password-retype-icon").addClass("glyphicon glyphicon-remove form-control-feedback");
      		error = true;
		} else {
			$(".container-new-password-retype").removeClass('has-error has-feedback');
      		$(".container-new-password-retype-icon").removeClass("glyphicon glyphicon-remove form-control-feedback");
		}
		
		if($('#new-pass-retype').val() != data.password) {
			$(".container-new-password").addClass('has-error has-feedback');
      		$(".container-new-password-icon").addClass("glyphicon glyphicon-remove form-control-feedback");
			$(".container-new-password-retype").addClass('has-error has-feedback');
      		$(".container-new-password-retype-icon").addClass("glyphicon glyphicon-remove form-control-feedback");
      		error = true;
		} else {
			$(".container-new-password").removeClass('has-error has-feedback');
      		$(".container-new-password-icon").removeClass("glyphicon glyphicon-remove form-control-feedback");
			$(".container-new-password-retype").removeClass('has-error has-feedback');
      		$(".container-new-password-retype-icon").removeClass("glyphicon glyphicon-remove form-control-feedback");
		}
		return error;
	}

</script>