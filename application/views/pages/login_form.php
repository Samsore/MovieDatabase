<?php
if (isset($this->session->userdata['logged_in'])) {

header("location: http://localhost/login/index.php/user_authentication/user_login_process");
}
?>
<br>
<br>
<br>
<br>
<br>
<head>
<title>Login Form</title>
<link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>css/style.css">
<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro|Open+Sans+Condensed:300|Raleway' rel='stylesheet' type='text/css'>
</head>
	<div>
		<?php
		if (isset($logout_message)) {
		echo "<div class='message'>";
		echo $logout_message;
		echo "</div>";
		}
		?>
		<?php
		if (isset($message_display)) {
		echo "<div class='message'>";
		echo $message_display;
		echo "</div>";
		}
		?>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div id="main">
						<div id="login">
							<h2>Login Form</h2>
							<hr/>
							<?php echo form_open('user_authentication/user_login_process'); ?>
							<?php
							echo "<div class='error_msg'>";
							if (isset($error_message)) {
								echo $error_message;
							}
							echo validation_errors();
							echo "</div>";
							?>
							<label>Username :</label>
							<input type="text" name="username" id="name" placeholder="username"/><br /><br />
							<label>Password :</label>
							<input type="password" name="password" id="password" placeholder="**********"/><br/><br />
							<input type="submit" value=" Login " name="submit"/><br />
							<hr/>
							<a href="<?php echo base_url() ?>index.php/user_authentication/user_registration_show">To Sign Up, Click Here.</a>
							<?php echo form_close(); ?>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>