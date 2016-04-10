	<?php foreach ($results as $val): ?>
	<?php $encode_url = str_replace(':', '', $val['name']);?>
	<?php $encode_url = urlencode( $encode_url) ?>
	<?php $encode_url = str_replace('+', '_', $encode_url);?>

		<body background=<?php echo base_url().'dep/img/Movie/' . $encode_url.'/back.jpg' ?>>
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
		<!-- <img class="img-responsive" src= <?php// echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt=""> -->
				</div>

				<div class="col-lg-8">
					<div class="searchbox">
						<h3>Description</h3>
					<p><?php echo $val['description']?></p>
					</div>
					<div class="searchbox">
						<h3>Directors</h3>
						<hr/>
						<?php foreach ($director as $director_val): ?>
							<h4><?php echo $director_val['fname']?> <?php echo $director_val['lname']?></h4>
							<br>
						<?php endforeach; ?>
					</div>

					<div class="searchbox">
						<h3>Actors</h3>
						<hr/>
						<?php foreach ($actors as $actor_val): ?>

							<h4><?php echo $actor_val['fname']?> <?php echo $actor_val['lname']?></h4>
							<br>
						<?php endforeach; ?>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="searchbox">
                        <img class="img-responsive" src= <?php echo base_url('dep/img/Movie/Batman_vs_Superman/Poster.jpg') ?> alt="">
					</div>
					<div class="searchbox">
						<!-- PHP RATINGS -->
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