    <!--Load Formhelper library-->
    <?php $this->load->helper('form'); ?>
    <style>
    a,
    a:hover,
    a:focus,
    a:active,
    a.active {
        outline: 0;
        color: #ffffff;
    }</style>

    <!-- Header -->
    <header>
    <div  class="container">
        <div class="row">
            <div class='col-lg-12' >
                <?php echo form_open('pages/result'); 

                  $data = array(
                  'name'        => 'search',
                  'id'          => 'search_bar',
                  'value'       => '',
                  'maxlength'   => '100',
                  'size'        => '50',
                  'style'       => 'width:100%; height:40px',
                  'placeholder' => 'search',
                );
                ?>
                <p style="color:black">
                <?php echo form_input($data);?>
            </p>
                <?php echo form_submit('search_submit', 'Submit'); ?>
                <?php echo form_close() ?>
            </div>
        </div>
                <hr class="star-light">
            <div class="row">
                <div class="intro-text">
                    <span class="name">New Releases</span>

                </div>
                <div class="col-lg-12">
                    <?php foreach($movie as $movie_item): ?>
                        <div class="col-lg-4" style ='link=#ffffff'>
                            <?php $encode_url = urlencode( $movie_item['name']) ?>
                            <?php $encode_url = str_replace('+', '_', $encode_url);?>
                            <img class="img-responsive" src= <?php echo base_url().'dep/img/Movie/' . $encode_url.'/back.jpg' ?> alt="">

                            <?php $encode_url = str_replace(':', '', $movie_item['name']);?>
                            <?php $encode_url = urlencode( $encode_url) ?>
                            <?php $encode_url = str_replace('+', '_', $encode_url);?>
                            <h3><a href =<?php echo base_url().'pages/movie/'. $encode_url?> > <?php echo $movie_item['name']?> </a></h3>


                            <h6>Release Date: <?php echo $movie_item['released'] ?></h6>
                            <p><?php echo $movie_item['description']?></p>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
        </header>
    </div>