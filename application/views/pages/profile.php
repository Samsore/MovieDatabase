	<style>
	div.searchbox {
	    color:white;
	    margin:20px;
	    padding:20px;
	    background: rgba(0,0,0,0.5);

	} 
	div.recomended {
	    background-color:#e7e7e7;
	    color:black;
	    margin:20px;
	    padding:20px;
	} 
	h3.wordwrap{
		word-wrap: break-word;
	}
	</style>
	<br>
	<br>
	<br>
	<br>
	<br>
<?php foreach ($userdata as $userdata_val): ?>
	<?php $username   = $userdata_val['username'];
		  $fname      = $userdata_val['fname'];
		  $lname      = $userdata_val['lname'];
		  $email      = $userdata_val['email'];
		  $country    = $userdata_val['country'];	
		  $province   = $userdata_val['province'];	  
		  $city       = $userdata_val['city'];
		  $yearborn   = $userdata_val['yearborn'];		  
		  $gender     = $userdata_val['gender'];
		  $occupation = $userdata_val['occupation'];
		  $device     = $userdata_val['device'];
	?>

<?php endforeach; ?>
<div class="container">
	<div class="row">
		<div class="col-lg-12">
				<div class="col-md-3">
					<img class="img-responsive" src= <?php echo base_url().'dep/img/Profile/' . $username.'/Profile.jpg' ?> alt="">
				</div>
				<div class="col-md-9">

					<h1> <?php echo $username ?> </h1>
					<h3>Name: <?php echo $fname ?> <?php echo $lname ?> </h3>
					<h3>Birthdate: <?php echo $yearborn ?></h3>
					<h3>Gender: <?php echo $gender ?></h3>					
					<h3>Country:  <?php echo $country ?> <?php echo $province ?> <?php echo $city ?> </h3>
					<h3>Email:  <?php echo $email ?> </h3>
					<h3>Occupation:  <?php echo $occupation ?> </h3>
					<h3>Device:  <?php echo $device ?> </h3>
					<br>
				</div>
			</div>	
			<div>
				<div class="col-md-12">

					<h1> Recomended Movies:</h1>
					<?php foreach($best_movie_genre as $best_movie_genre_val): ?>
						<div class="col-lg-3">

							<?php $encode_url = str_replace(':', '', $best_movie_genre_val['name']);?>
							<?php $encode_url = urlencode( $encode_url) ?>
							<?php $encode_url = str_replace('+', '_', $encode_url);?>

							<img class="img-responsive" src= <?php echo base_url().'dep/img/Movie/'. $encode_url .'/Poster.jpg' ?> alt="">
							<h3 class="wordwrap"><?php echo $best_movie_genre_val['name']?> </h3>
						</div>
					<?php endforeach;?>
				</div>
			</div>
	</div>
</div>
