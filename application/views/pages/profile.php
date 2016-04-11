	<style>
	div.searchbox {
	    color:white;
	    margin:20px;
	    padding:20px;
	    background: rgba(0,0,0,0.5);
	} 

	</style>
	<br>
	<br>
	<br>
	<br>
	<br>
<?php foreach ($userdata as $userdata_val): ?>
	<?php $username = $userdata_val['username'] ?>
<?php endforeach; ?>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="col-md-3">
				<img class="img-responsive" src= <?php echo base_url().'dep/img/Profile/' . $username.'/Profile.jpg' ?> alt="">
			</div>
			<div class="col-md-9">
				<h1> <?php echo $username ?> </h1>
			</div>
			
		</div>
	</div>
</div>
