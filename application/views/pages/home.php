    <!--Load Formhelper library-->
    <?php $this->load->helper('form'); ?>


    <!-- Header -->
    <header>

        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <img class="img-responsive" src="img/profile.png" alt="">
                    <div class="intro-text">
                        <span class="name"> Bootstrap</span>
                        <hr class="star-light">
                        <span class="skills">Web Developer - Graphic Artist - User Experience Designer</span>
                    </div>
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