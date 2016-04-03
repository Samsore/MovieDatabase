<br>
<h2><?php echo $title; ?></h2>
<br>
<?php foreach ($randProfile as $row)
{
   echo $row['title'], "\r\n";
   echo $row['slug'];
   echo $row['text'];
   echo 'rand row';

}
 ?>
<?php foreach ($profile as $profile_item): ?>

        <h3><?php echo $profile_item['title']; ?></h3>
        <div class="main">
                <?php echo $profile_item['text']; ?>
        </div>
        <p><a href="<?php echo site_url('profile/'.$profile_item['slug']); ?>">View profile</a></p>
        <p>test text 1</p>
<?php endforeach; ?>