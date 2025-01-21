<?php
require_once __DIR__ . '/../vendors/autoload.php';
include("../common/connection.php");
include('../class/loginc.php');
$obb = new User($connect);
if (isset($_GET['id'])) {
    $blogId = $_GET['id'];
    $blog = $obb->readmore($blogId);
} else {
    $category = $_GET['category'];
    $blog = $obb->readcategory($category); // Change this to fetch all blogs for the category
}

    if ($blog) {
        $mpdf = new \Mpdf\Mpdf();
        $html = '
        <style>
            body { font-family: sans-serif; }
            .blog-image { width: 100%; height: auto; margin-bottom: 20px; }
            .blog-content { margin: 20px 0; }
            .category { font-style: italic; color: #555; }
            h1 { color: #333; }
        </style>
        
        <h1>' . $blog['title'] . '</h1>
        <p class="category"><strong>Category:</strong> ' . $blog['category'] . '</p>
        <img src="../' . $blog['image'] . '" alt="' . $blog['title'] . '" class="blog-image">
        <p><strong>By:</strong> ' . $blog['author'] . '</p>
        <p><strong>Date:</strong>' . date('F d, Y', strtotime($blog['created_at'])) . '</p>
        <div class="blog-content">
        
            ' . $blog['content'] . '
        </div>';
        $mpdf->WriteHTML($html);

        $mpdf->Output('blog-' . $blog['category'] . '.pdf','I');

    } else {
        echo "Blog not found.";
    }

