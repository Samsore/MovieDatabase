	<body background=<?php echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?>>
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
<div>

	<?php foreach ($results as $val): ?>
	<div class="searchbox">
		<h1><?php echo $val['name']?></h1>
		<!-- <img class="img-responsive" src= <?php// echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt=""> -->
	<?php endforeach; ?>

</div>