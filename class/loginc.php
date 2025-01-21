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
        $result = $this->conn->query($sql);
        if ($result) {
            $this->send($email, $token);
                $users = []; // Initialize an array to hold the user data
                while ($user = $result->fetch_assoc()) 
                { // Fetch each row as an associative array
                    $users[] = $user;
                    session_start();
                    $_SESSION['uid']= $users['uid'];// Add the user to the array
                }
            return "Signup successful!";
        } else {
            return "Signup not successful: ";
        }
    }
    private function send($to, $token)
    {
        global $user;
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
                $_SESSION['id'] = $user['id'];
                $_SESSION['username'] = $user['name'];
                $_SESSION['user_data'] = $user; 
                $_SESSION['role'] = $user['role'];
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
        $sql = "SELECT * FROM blogs WHERE category = '$category' AND approved = 1 ORDER BY created_at DESC"; 
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
    function addpost($title, $author, $category, $content, $excerpt, $file,$uid)
    {
        $image_path = "";
        $target_dir = "images/";
        $target_dirs = "../images/";
        $image_name = basename($file['name']);
        $image_path = $target_dir . $image_name;
        $image_paths = $target_dirs. $image_name;
        move_uploaded_file($file['tmp_name'], $image_paths);
        $sql = "INSERT INTO blogs (uid ,title, author, category, content, image, excerpt) VALUES ('$uid','$title', '$author', '$category', '$content', '$image_path', '$excerpt')";
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
        
            $sql = "SELECT * FROM blogs WHERE blog_id = $postId";
            $result = $this->conn->query($sql);
            if ($result->num_rows == 1) 
            {
                $post = $result->fetch_assoc();
                return $post;
            }
    }
    function recent($uid) 
    {
        $sql = "SELECT * FROM blogs WHERE uid='$uid' ORDER BY created_at DESC LIMIT 3";
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
    function home() 
    {
        $sql = "SELECT * FROM blogs where approved = 1 ORDER BY RAND() LIMIT 3";
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
    function notapproved($limit, $offset) 
    {
        $sql = "SELECT * FROM blogs WHERE approved = 0 LIMIT $limit OFFSET $offset";
        $result = $this->conn->query($sql);
        
        if ($result) {
            $data = [];
            while ($blog = $result->fetch_assoc()) {
                $data[] = $blog;
            }
            return $data; 
        } else {
            return [];
        }
    }
    function dash() 
    {
        $sql = "SELECT id, title, author, created_at, image, excerpt 
                     FROM blogs 
                     ORDER BY created_at DESC 
                     LIMIT 5";
        $result = $this->conn->query($sql);
        
        if ($result) {
            $blogss = [];
            while ($blog = $result->fetch_assoc()) {
                $blogs[] = $blog;
            }
            return $blogss; 
        } else {
            return [];
        }
    }
    function getUsers() {
        $query = "SELECT * FROM signup"; // Adjust the table name if necessary
        $result = $this->conn->query($query); // Execute the query

        if ($result) {
            $users = []; // Initialize an array to hold the user data
            while ($user = $result->fetch_assoc()) { // Fetch each row as an associative array
                $users[] = $user;
            }
            return $users; // Return the array of users
        } else {
            return []; // Return an empty array if there is an error
        }
    }
    public function getcategory($id = null) {
        if ($id) {
            // Fetch a single category if an ID is provided
            $query = "SELECT * FROM categories WHERE cid = $id"; // cid is assumed to be the category ID column
            $result = $this->conn->query($query);
            
            if ($result && $result->num_rows > 0) {
                return $result->fetch_assoc(); // Return the single category as an associative array
            } else {
                return null; // Return null if no category is found
            }
        } else {
            // Fetch all categories if no ID is provided
            $query = "SELECT * FROM categories";
            $result = $this->conn->query($query);
            
            if ($result) {
                $data = []; // Initialize an array to hold the category data
                while ($category = $result->fetch_assoc()) {
                    $data[] = $category; // Add each category to the array
                }
                return $data; // Return the array of categories
            } else {
                return []; 
            }
        }
    }
    
    function addcategory($category) {
        $query = "INSERT INTO categories (category_name) VALUES ('$category')";
        if ($this->conn->query($query) === TRUE)
        {
            return true; 
        } 
        else 
        {
            return false;
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
        $query = "SELECT * FROM comments WHERE post_id = '$postId'"; 
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
    function commentshow() 
    {
        $sql = "SELECT * FROM comments ORDER BY created_at DESC LIMIT 3";
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
    function recentpost($uid, $limit, $offset) {
        $query = "SELECT * FROM blogs WHERE uid = '$uid' LIMIT $limit OFFSET $offset";
        $result = $this->conn->query($query);
        return $result->fetch_all(MYSQLI_ASSOC);
    }

    // Method to get total number of blogs for the user
    function totalnotapproved() {
        $query = "SELECT COUNT(*) as total FROM blogs WHERE approved=0";
        $result = $this->conn->query($query);
        return $result->fetch_assoc()['total'];
    }
    
    function getTotalBlogs($uid) {
        $query = "SELECT COUNT(*) as total FROM blogs WHERE uid = '$uid'";
        $result = $this->conn->query($query);
        return $result->fetch_assoc()['total'];
    }
     function approvePost($id) {
        $id = intval($id); 
        $query = "UPDATE `blogs` SET `approved`='1' WHERE blog_id = $id";
        $result = mysqli_query($this->conn, $query);

        if ($result) {
            return true;
        } else {
            return false;
        }
    }
    public function getUserById($id) {
        // Correct SQL query using mysqli
        $query = "SELECT * FROM signup WHERE uid = $id";
        $result = $this->conn->query($query);
    
        // Check if result is valid and fetch as associative array
        if ($result && $result->num_rows > 0) {
            return $result->fetch_assoc(); // Use fetch_assoc() to get associative array
        } else {
            return null; // Return null if no user found
        }
    }
    

    // Function to update a user
    public function updateUser($id, $name, $email,$role) {
        // Prepare the SQL query to update the user information
        $query = "UPDATE signup SET name = '$name', email = '$email', role='$role' WHERE uid = '$id'";
        
        // Execute the query
        $result = mysqli_query($this->conn, $query);
        
        // Return true if the query was successful, otherwise false
        return $result ? true : false;
    }
    public function updatecategory($category, $id) {
        $query = "UPDATE categories SET category_name='$category' WHERE cid = $id";
        
        // Execute the query
        $result = mysqli_query($this->conn, $query);
        
        // Return true if the query was successful, otherwise false
        return $result ? true : false;
    }
    
    
    
    function adduser($name, $email,$role)
    {
        $token = bin2hex(random_bytes(16));
    // Insert the new user into the 'signup' table
    $query = "INSERT INTO signup (name, email,role) VALUES ('$name', '$email','$role')";
    
    // Execute the query
    $result = mysqli_query($this->conn, $query);
    
    // Return true if the query was successful, otherwise false
    if ($result) 
    {
        $this->send($email, $token);
        return true;
    }
    }
    /*for dashboard trafic */
    public function getTotalPosts($uid) {
        $query = "SELECT COUNT(*) as total_posts FROM blogs WHERE uid = $uid";
        $result = $this->conn->query($query);
        $row = $result->fetch_array(MYSQLI_ASSOC); // Fetch associative array
        return (int)$row['total_posts']; // Return total_posts as integer
    }
    
    public function addveiw($blogId, $userId) {
        // Check if a view entry already exists for the blog by the user (if you track by user)
        $query = "SELECT * FROM view WHERE blog_id = $blogId AND uid = $userId";
        $result = $this->conn->query($query);
        
        if ($result->num_rows > 0) {
            // If the view entry exists, update the views count
            $query = "UPDATE view SET views = views + 1 WHERE blog_id = $blogId AND uid = " . ($userId !== null ? $userId : 'NULL');
        } else {
            // If the view entry does not exist, insert a new record
            $query = "INSERT INTO view (blog_id, uid, views) VALUES ($blogId, " . ($userId !== null ? $userId : 'NULL') . ", 1)";
        }
        
        return $this->conn->query($query);
    }
    

    public function getTotalViewers($blogId) {
        // Query to sum up the views for a specific blog_id
        $query = "SELECT SUM(views) as total_views FROM view WHERE uid = $blogId";
        
        // Execute the query
        $result = $this->conn->query($query);
    
        // Check for errors in the query
        if (!$result) {
            echo "Error: " . $this->conn->error; // Output any SQL errors
            return 0; // Return 0 if there is an error
        }
    
        // Fetch the result as an associative array
        $row = $result->fetch_array(MYSQLI_ASSOC);
        
        // Return the total views, defaulting to 0 if no views are found
        return (int) $row['total_views'] ?: 0;  // Use ?: to ensure a default of 0
    }
    
    
    

    

    public function getTotalComments($uid) {
        // Directly execute the query without using prepare
        $query = "SELECT COUNT(*) as total_comments FROM comments WHERE uid = $uid";
        $result = $this->conn->query($query);
        $row = $result->fetch_array(MYSQLI_ASSOC); // Fetch associative array
        return (int)$row['total_comments'];
    }


}   
class Delete
{
    private $conn;

    function __construct($dbConnection) 
    {
        $this->conn = $dbConnection; 
    }
    function deletepost($user_id) {
        $query = "DELETE FROM blogs WHERE blog_id = $user_id";
        if ($this->conn->query($query) === TRUE)
        {
            return true; 
        } 
        else 
        {
            return false;
        }
    }
    function deleteCategory($category_id) {
        $query = "DELETE FROM categories WHERE cid = $category_id";
        if ($this->conn->query($query) === TRUE)
        {
            return true; 
        } 
        else 
        {
            return false;
        }
    }
    function deleteuser($user_id) {
        $query = "DELETE FROM signup WHERE uid = $user_id";
        if ($this->conn->query($query) === TRUE)
        {
            return true; 
        } 
        else 
        {
            return false;
        }
    }
}
?>  
