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
	div.commentbox {
	    color:white;
	    margin:20px;
	    padding:20px;
	    background: rgba(255,255,255,0.5);
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

							<h4><a href=<?php echo base_url().'pages/actor/'. $actor_val['fname'] .'/'. $actor_val['lname'] ?> ><?php echo $actor_val['fname']?> <?php echo $actor_val['lname']?></a></h4>
							<br>
						<?php endforeach; ?>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="searchbox">
                        <img class="img-responsive" src= <?php echo base_url('dep/img/Movie/Batman_vs_Superman/Poster.jpg') ?> alt="">
					</div>
					<div class="searchbox">
						<?php foreach ($rating as $rating_val): ?>
							<h2>Rating: <?php echo $rating_val['round']?> /10</h2>
						<?php endforeach; ?>
					</div>
					<div class="searchbox">					
    					<object width='100%' length='400px' data="http://www.youtube.com/v/Ahg6qcgoay4" type="application/x-shockwave-flash">
						<param name="src" value="http://www.youtube.com/v/<get trailer link from movie" /></object>
					</div>
				</div>
			</div>
			<div class="col-md-8">
				<?php if (isset($this->session->userdata['logged_in'])): ?>
				<div class="searchbox">
					<h3>Comments</h3>
					<div class ="commentbox">
						<?php foreach ($comments as $comment_val): ?>
							<p><?php echo $comment_val['comment'] ?></p>
							<h5>-<?php echo $comment_val['username'] ?></h5>
						<?php endforeach; ?>
					</div>
					<div>
						<?php echo form_open('pages/comment_success'); 

		                  $data = array(
		                  'name'        => 'Comment',
		                  'id'          => 'comment_bar',
		                  'value'       => '',
		                  'maxlength'   => '100',
		                  'size'        => '50',
		                  'style'       => 'width:100%; height:300px',
		                  'placeholder' => 'comment',
		                );
		                ?>
		                <p style="color:black">
		                <?php echo form_input($data);?>
		            	</p>

						<?php foreach ($movieid as $movieid_val): ?>
		            		<?php form_hidden('userid',$movieid_val['movieid']);?>
						<?php endforeach; ?>

						<?php foreach ($userid as $userid_val): ?>
		            		<?php form_hidden('movieid',$userid_val['userid']);  ?>          	
						<?php endforeach; ?>

		                <?php echo form_submit('search_submit', 'Submit'); ?>
		                <?php echo form_close() ?>
		            </div>
				</div>
				<?php else:?>
				<div class="searchbox">
					<h3>You must Log In to Write a Comment</h3>
				</div>
				<?php endif; ?>
			</div>
		</div>
	</div>	

	<?php endforeach; ?>

</div>