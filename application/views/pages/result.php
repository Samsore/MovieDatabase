
<style>
div.searchbox {
    background-color:#e7e7e7;
    color:black;
    margin:20px;
    padding:20px;
} 
</style>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="container">
	<h1>Search Results</h1>

	<?php foreach ($results as $val): ?>

		<div class="searchbox">
			<?php $encode_url = urlencode( $val['name']) ?>
			<?php $encode_url = str_replace('+', '-', $encode_url);?>
			<h3><a href =<?php echo base_url().'pages/movie/'. $encode_url ?> > <?php echo $val['name']?> </a></h3>
			<div class="row">
				<div class="col-lg-12">
					<div class="col-lg-4">
						<?php $encode_url = str_replace(':', '', $val['name']);?>
						<?php $encode_url = urlencode( $encode_url) ?>
						<?php $encode_url = str_replace('+', '_', $encode_url);?>
						<img class="img-responsive" src= <?php echo base_url().'dep/img/Movie/' . $encode_url.'/back.jpg' ?> alt="">
					</div>
					<div class="col-lg-8">
						<p size='2'><?php echo $val['description']?></p>
					</div>
				</div>
			</div>
		</div>

	<?php endforeach; ?>
</div>