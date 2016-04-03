    <!--Load Formhelper library-->
    <?php $this->load->helper('form'); ?>


    <!-- Header -->
    <header>

        <div class="container">
            <div class="row">
                <div class="intro-text">
                    <span class="name">New Releases</span>
                    <hr class="star-light">
                </div>
                <div class="col-lg-12">
                TO BE CHANGED ONCE DB IS LOADED WITH REAL INFORMATION
                    <?php foreach($movie as $movie_item): ?>
                        <div class="col-lg-4">
                            <img class="img-responsive" src= <?php echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt="">
                            <h3>Movie 1</h3>
                            <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu eleifend nulla, a consequat mauris. 
                                Fusce ut tempus nibh. Donec pharetra, dui non dignissim convallis, leo mauris 
                                congue sem, quis vestibulum est lorem dignissim leo. Nulla eu mi eu libero 
                            </p>
                        </div>
                    <?php endforeach; ?>
                    

                    <!-- <div class="col-lg-4">
                        <img class="img-responsive" src= <?php //echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt="">
                        <h3>Movie 1</h3>
                        <p>
                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus eu eleifend nulla, a consequat mauris. 
                            Fusce ut tempus nibh. Donec pharetra, dui non dignissim convallis, leo mauris 
                            congue sem, quis vestibulum est lorem dignissim leo. Nulla eu mi eu libero 
                        </p>
                    </div>
                    <div class="col-lg-4">
                        <img class="img-responsive" src= <?php //echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt="">
                    </div>
                    <div class="col-lg-4">
                        <img class="img-responsive" src= <?php //echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt="">
                    </div> -->



<!--                     <div class="intro-text">
                        <span class="name"> Movie Database</span>
                        <hr class="star-light">
                        <span class="skills">Best Movie Database NA EU KR SEA BR</span>
                    </div> -->
                </div>
            </div>
        </div>
    </header>
    <div>
    	<div>	
		<?php 
		echo form_open("results");
		echo form_input('Search');
		echo form_close();
		?>
	</div>
    </div>