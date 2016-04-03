<h2><?php echo $title; ?></h2>

<?php foreach ($actor as $actor_item): ?>

        <h3><?php echo $actor_item['name']; ?></h3>
        <div class="main">
                <?php echo $actor_item['age']; ?>
        </div>
        <p><a href="<?php echo site_url('news/'.$actor_item['slug']); ?>">View article</a></p>

<?php endforeach; ?>