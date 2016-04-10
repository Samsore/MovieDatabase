
	<style>
	div.searchbox {
	    color:white;
	    margin:20px;
	    padding:20px;
	    background: rgba(0,0,0,0.5);
	} 
	body {
	    background-repeat: no-repeat;
	    background-position: right top;
	    background-attachment: fixed;
	}
	</style>
	<br>
	<br>
	<br>
	<br>
	<br>
<div>
	<div class="container">
		<div class="row">
			<div class ="col-md-12">
				<?php foreach($actors as $actor_val): ?>
					<h1><?php echo $actor_val['fname']?> <?php echo $actor_val['lname'] ?></h1>
				<?php endforeach;?>
			</div>
			<div class ="col-md-8">
				<div>
					<?php foreach($birthday as $birthday_val): ?>
						<h4>Birthdate: <?php echo $birthday_val['datebirth']?></h4>
					<?php endforeach;?>
				</div>
				<div class ="col-md-8">
					<div>
						<h3>Roles played</h3>
						<?php foreach($roles as $role_val): ?>
							<ul list-style-type:none>
								<ul list-style-type:none>
									<li><h4><?php echo $role_val['name']?></h4></li>
								</ul>
								<ul list-style-type:none>
									<li> - <?php echo $role_val['rolename']?></li>
								</ul>
							</ul>
						<?php endforeach;?>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>