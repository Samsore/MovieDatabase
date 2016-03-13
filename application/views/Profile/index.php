<h2><?php echo $title; ?></h2>

<?php foreach ($profile as $profile_item): ?>

        <h3><?php echo $profile_item['title']; ?></h3>
        <div class="main">
                <?php echo $profile_item['text']; ?>
        </div>
        <p><a href="<?php echo site_url('profile'); ?>">View profile</a></p>

<?php endforeach; ?>