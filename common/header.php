<header>
    <div class="header-container">
        <div class="logo-container">
            <img src="images/logo.jpg" alt="Website Logo" class="logo">
            <h1>BLOGGED WEBSITE</h1>
        </div>
        <nav>
            <ul>
                <li><a href="index.php?category=Clothes">Home</a></li>
                <li><a href="about.php">About</a></li>
                <li><a href="contact.php">Contact us</a></li>
                <li><a href="addpost.php">Add Post</a></li>
                <li>
                    <div class="btn">
                        <?php if (empty($_SESSION['username'])) { ?>
                            <a href="login/login.php"><input type="button" value="Log in"></a>
                        <?php } else { ?>
                            <a href="index.php?log=1"><input type="button" value="Log Out <?php echo $_SESSION['username']; ?>"></a>
                        <?php } ?>
                    </div>
                </li>
            </ul>
            <div class="search-container">
                <form action="search.php" method="GET">
                    <input type="text" name="query" placeholder="Search..." required>
                    <button type="submit">Search</button>
                </form>
            </div>
        </nav>
    </div>
    <?php
?>
</header>
