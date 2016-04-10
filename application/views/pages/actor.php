
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
		</div>
	</div>
</div>