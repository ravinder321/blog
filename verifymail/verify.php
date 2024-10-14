<?php
session_start();
include('common/connection.php');

if (isset($_GET['token'])) {
    $token = $_GET['token'];
    $query = "UPDATE signup SET is_verified = 1 WHERE verification_token = '$token'";
    if (mysqli_query($connect, $query)) {
        echo "Your email has been verified. You can now log in.";
    } else {
        echo "Verification failed. Please try again.";
    }
} else {
    echo "No token provided.";
}
?>
