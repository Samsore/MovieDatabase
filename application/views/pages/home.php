    <!--Load Formhelper library-->
    <?php $this->load->helper('form'); ?>


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
                        <div class="col-lg-4">
                            <img class="img-responsive" src= <?php echo base_url('dep/img/Movie/Batman_vs_Superman/Batman_vs_Superman.jpg') ?> alt="">
                            <h3><?php echo $movie_item['name'] ?></h3>
                            <h6>Release Date: <?php echo $movie_item['released'] ?></h6>
                            <p><?php echo $movie_item['description']?></p>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
        </header>
    </div>