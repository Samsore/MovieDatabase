	<?php foreach ($results as $val): ?>
	<?php $encode_url = str_replace(':', '', $val['name']);?>
	<?php $encode_url = urlencode( $encode_url) ?>
	<?php $encode_url = str_replace('+', '_', $encode_url);?>

	    
	<?php endforeach; ?>
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

	<?php foreach ($results as $val): ?>

	<div class="container"></div>
		<div class="row">
			<div class="col-lg-12">
				<div class="searchbox">
					<h1 color= "white"> <?php echo $val['name']?></h1>
		<!-- <img class="img-responsive" src= <?php// echo base_url('profile pic') ?> alt=""> -->
				</div>

				<div class="col-lg-8">
					<div class="searchbox">
						<h3>Gender</h3>
					<p><?php echo $val['gender']?></p>
					</div>
					<div class="searchbox">
						<h3>Agerange</h3>
					
					<p>	<?php echo $val['agerange']?></p>
					</div>

					<div class="searchbox">
						<h3>Ratings</h3>
						<hr/>
						<?php foreach ($watches as $rating): ?>

							<h4><?php echo $rating['fname']?> <?php echo $rating_val['lname']?></h4>
							<br>
						<?php endforeach; ?>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="searchbox">
                        <img class="img-responsive" src= <?php echo base_url('dep/img/Movie/Batman_vs_Superman/Poster.jpg') ?> alt="">
					</div>
				</div>
			</div>
			<div class="col-md-12">
				<div class="searchbox">
					<h3> Comments</h3>
				</div>
			</div>
		</div>
	</div>	

	<?php endforeach; ?>

</div>
