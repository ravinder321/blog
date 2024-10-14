<?php
    session_start(); 
    include("common/connection.php");
    include('class/loginc.php');
    $obb = new User($connect);
    if (!empty($_GET['log'])) 
    {
        session_destroy();
        header('location:index.php');
    }
    include('googleapi.php');
    include('facebookapi.php');
?>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blogged Website </title>
    <link rel="stylesheet" href="css/styles.css?v=1.1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
</head>

<body>
    <?php include('common/header.php'); ?>
    <div class="container">
        <?php include('common/category.php'); ?>
        <main class="content">
            <h2>Welcome to Our Blog</h2>
            <p>Discover the latest insights and articles from various categories. Enjoy reading our handpicked blogs!
            </p>
            <h2>Random Blogs</h2>
            <section class="blog-posts">
                <?php $blogs = $obb->home();
                            foreach ($blogs as $blog) 
                            {
                                echo "<article class='blog-post'>
                                        <img src='{$blog['image']}' alt='{$blog['title']}' class='blog-image'>
                                            <div class='blog-content'>
                                                <h3>" . $blog['title'] . "</h3>
                                                <p><strong>By:</strong> " . $blog['author'] . " | <strong>Date:</strong> " . date('F d, Y', strtotime($blog['created_at'])) . "</p>
                                                <p>" . $blog['excerpt'] . "</p>
                                                <a href='readmore.php?id=" . $blog['id'] . "' class='read-more'>Read More</a>
                                            </div>
                                    </article>";
                            } ?>
            </section>
        </main>
    </div>
    <?php include('common/footer.php'); ?>
</body>

</html>