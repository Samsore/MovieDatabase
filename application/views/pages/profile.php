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
<div class="container">
	<div class="row">
		<div class="col-lg-12">
			<div class="col-md-4">
				<div class="col-md-8">
					<?php foreach ($userdata as $userdata_val): ?>
						<?php echo $userdata_val['username'] ?>
					<?php endforeach; ?>
				</div>
			</div>
		</div>
	</div>
</div>