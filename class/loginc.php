<?php
class User {
    private $conn;

    function __construct($dbConnection) 
    {
        $this->conn = $dbConnection; 
    }
    function signup($name, $email, $password)
    {
        $token = bin2hex(random_bytes(16));
        $sql = "INSERT INTO signup (name, email, password, verification_token) VALUES ('$name', '$email', '$password', '$token')";
        if (mysqli_query($this->conn, $sql)) {
            $this->send($email, $token);
            return "Signup successful!";
        } else {
            return "Signup not successful: ";
        }
    }
    private function send($to, $token)
    {
        $subject = "Email Verification";  
        $message = "Click here to verify your email: http://localhost/blog/verifymail/verify.php?token=$token";
        $headers = 'From: ramrattan099@gmail.com' . "\r\n" .
                   'Reply-To: ramrattan099@gmail.com' . "\r\n" .
                   'X-Mailer: PHP/' . phpversion();

        if(mail($to, $subject, $message, $headers)){  
            echo "Verification email sent successfully...";  
        } else {  
            echo "Sorry, unable to send email...";  
        }  
    }
    function login($email, $password) {
        $sql = "SELECT * FROM signup WHERE email='$email'";
        $result = $this->conn->query($sql);
        if ($result->num_rows > 0) 
        {
            $user = $result->fetch_assoc();
            if ($user['is_verified'] == 1) 
            {
                session_start();
                $_SESSION['username'] = $user['name'];
                return true; 
            } 
            else 
            {
                return 'Please verify your email'; 
            }
        } 
        else 
        {
            return 'No user found with this email'; 
        }
    }
    function display($category) 
    {
        $sql = "SELECT * FROM blogs WHERE category = '$category' ORDER BY created_at DESC"; 
        $result = $this->conn->query($sql); 
        if ($result->num_rows > 0) 
        {
            $blogs = [];
            while ($blog = $result->fetch_assoc()) 
            {
                $blogs[] = $blog; 
            }
            return $blogs; 
        } 
        else 
        {
            return []; 
        }
    }
    function contact($name, $email, $subject, $message,$table) 
    {
        global $token;
        $sql = "INSERT INTO $table (name, email, subject, message) VALUES ('$name', '$email', '$subject', '$message')";
        if ($this->conn->query($sql)) 
        {
            $this->send($email, $token);
            return true; 
        } 
        else 
        {
            return false;
        }
    }
    function addpost($title, $author, $category, $content, $excerpt, $file)
    {
        $image_path = "";
        $target_dir = "uploads/";
        $image_name = basename($file['name']);
        $image_path = $target_dir . $image_name;
        move_uploaded_file($file['tmp_name'], $image_path);
        $sql = "INSERT INTO blogs (title, author, category, content, image, excerpt) VALUES ('$title', '$author', '$category', '$content', '$image_path', '$excerpt')";
        if ($this->conn->query($sql)) 
        {
            return true; 
        } 
        else 
        {
            return false;
        }
    }
    function readmore($postId)
    {
        
            $sql = "SELECT * FROM blogs WHERE id = $postId";
            $result = $this->conn->query($sql);
            if ($result->num_rows == 1) 
            {
                $post = $result->fetch_assoc();
                return $post;
            }
    }
    function home() 
    {
        $sql = "SELECT * FROM blogs ORDER BY RAND() LIMIT 3";
        $result = $this->conn->query($sql);
        
        if ($result) {
            $blogs = [];
            while ($blog = $result->fetch_assoc()) {
                $blogs[] = $blog;
            }
            return $blogs; 
        } else {
            return [];
        }
    }
    function addComment($postId, $author, $content) {
        $query = "INSERT INTO comments (post_id, author, content) VALUES ($postId, '$author', '$content')";
        if ($this->conn->query($query) === TRUE)
        {
            return true; 
        } 
        else 
        {
            return false;
        }
    }
    function displaycomment($postId) {
        $query = "SELECT * FROM comments WHERE post_id = $postId"; // Use post_id instead of id
        $result = $this->conn->query($query);
        if ($result) 
        {
            $comments = []; // Initialize the comments array
            while ($comment = $result->fetch_assoc()) 
            {
                $comments[] = $comment; // Add each comment to the array
            }
            return $comments; 
        } 
        else 
        {
            return []; // Return an empty array if no comments found or on error
        }
    }
    
}   
?>  
