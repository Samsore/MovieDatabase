<div>
<br>
<h2><?php echo $title; ?></h2>
<br>
<?php foreach ($randNews as $row)
{
   echo $row['title'], "\r\n";
   echo $row['slug'];
   echo $row['text'];
   echo 'rand row';

}
 ?>
<?php foreach ($news as $news_item): ?>

        <h3><?php echo $news_item['title']; ?></h3>
        <div class="main">
                <?php echo $news_item['text']; ?>
        </div>
        <p><a href="<?php echo site_url('news/'.$news_item['slug']); ?>">View article</a></p>
        <p>test text 1</p>
<?php endforeach; ?>
</div>