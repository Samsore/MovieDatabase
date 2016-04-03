    <!--Load Formhelper library-->
    <?php $this->load->helper('form'); ?>
<div>

</div>

    <!-- Header -->
    <header>

        <div class="container">
            <div class="row">
                <div class="intro-text">
                    <span class="name">New Releases</span>
                    <hr class="star-light">
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
</div>