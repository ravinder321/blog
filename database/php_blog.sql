-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 20, 2024 at 07:39 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `php_blog`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(6, 'ram rattan', 'ramrattan099@gmail.com', 'sdf', 'sdfs', '2024-10-10 05:38:12'),
(7, 'sdfs', 'raviking2311@gmail.com', 'give ', 'dfgdg', '2024-10-10 05:40:27'),
(8, 'ram rattan begowal', 'ramrattan099@gmail.com', 'sdf', 'h', '2024-10-10 09:48:24'),
(9, 'ram rattan', 'ramrattan099@gmail.com', 'give ', 'a', '2024-10-16 23:10:31'),
(10, 'ram rattan', 'ram@gmail.com', 'w', 'w', '2024-10-16 23:11:23'),
(11, 'ram rattan', 'ramrattan099@gmail.com', 'dfg', 'f', '2024-10-27 23:31:59');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `blog_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `category` varchar(100) NOT NULL,
  `content` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(255) NOT NULL,
  `excerpt` text NOT NULL,
  `uid` int(11) NOT NULL,
  `approved` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`blog_id`, `title`, `category`, `content`, `author`, `created_at`, `image`, `excerpt`, `uid`, `approved`) VALUES
(1, 'Top 5 Smartphones of 2024', 'Electronics', 'As we enter 2024, the smartphone market is buzzing with exciting new releases that showcase cutting-edge technology and innovative features. Here are the top 5 smartphones to look out for this year:  1. **Apple iPhone 15 Pro Max**: The latest flagship from Apple, the iPhone 15 Pro Max features a stunning 6.7-inch Super Retina XDR display, the powerful A17 Bionic chip, and an impressive camera system that excels in low-light photography. With enhanced battery life and iOS 17, it\'s perfect for both everyday users and photography enthusiasts.  2. **Samsung Galaxy S24 Ultra**: Known for its versatility, the Galaxy S24 Ultra offers a 6.8-inch Dynamic AMOLED display with a 120Hz refresh rate. It boasts a quad-camera setup, including a 200MP main sensor, and supports S Pen functionality for productivity. With its long-lasting battery and One UI 6, it\'s a top choice for Android users.  3. **Google Pixel 8 Pro**: The Pixel 8 Pro continues Google\'s tradition of exceptional photography, featuring an advanced camera system with AI enhancements for stunning images. Its 6.7-inch OLED display provides vibrant colors, and the integration of Android 14 ensures a smooth user experience.   4. **OnePlus 11T**: The OnePlus 11T is designed for performance enthusiasts, equipped with a Snapdragon 8 Gen 2 processor and up to 16GB of RAM. Its 6.7-inch Fluid AMOLED display is perfect for gaming, and the 100W fast charging capability ensures you’ll never run out of power quickly.  5. **Xiaomi 13 Pro**: The Xiaomi 13 Pro is a premium flagship with a sleek design, featuring a 6.73-inch AMOLED display and Snapdragon 8 Gen 2 processor. Its camera system, co-engineered with Leica, delivers stunning photography and videography capabilities, making it a favorite among tech enthusiasts.', 'Tech Guru', '2024-10-15 04:33:15', 'images/smartphones.jpg', 'Discover the best smartphones of 2024, featuring cutting-edge technology and sleek designs...', 1, 1),
(3, 'The Latest Fashion Trends in 2024 ', 'Clothes', 'As we move into 2024, fashion continues to evolve, blending sustainability with innovative designs. This year, we can expect to see a significant focus on eco-friendly materials and ethical production practices. Key trends include oversized silhouettes, vibrant colors, and the resurgence of nostalgic styles from the early 2000s.   Accessories play a crucial role in this year\'s fashion, with chunky shoes and statement bags leading the way. Additionally, layering will remain popular, allowing individuals to mix textures and styles creatively.   Streetwear will also continue to influence high fashion, with bold graphics and athleisure pieces dominating the scene. Overall, 2024 promises to be an exciting year for fashion enthusiasts, showcasing creativity and individuality.\";', 'Jane Doe', '2024-10-15 04:53:12', 'images/fashion1.png', 'Discover the hottest clothing trends of 2024, from bold colors to sustainable fashion...', 2, 1),
(4, 'How to Build a Capsule Wardrobe', 'Clothes', 'As we move into 2024, fashion continues to evolve, blending sustainability with innovative designs. This year, we can expect to see a significant focus on eco-friendly materials and ethical production practices. Key trends include oversized silhouettes, vibrant colors, and the resurgence of nostalgic styles from the early 2000s.   Accessories play a crucial role in this year\'s fashion, with chunky shoes and statement bags leading the way. Additionally, layering will remain popular, allowing individuals to mix textures and styles creatively.   Streetwear will also continue to influence high fashion, with bold graphics and athleisure pieces dominating the scene. Overall, 2024 promises to be an exciting year for fashion enthusiasts, showcasing creativity and individuality.\";', 'John Smith', '2024-10-15 04:55:17', 'images/fashion2.png', 'Learn how to create a timeless capsule wardrobe that is both practical and stylish...', 1, 1),
(5, 'Sustainable Fabrics You Should Know About', 'Clothes', 'As we move into 2024, fashion continues to evolve, blending sustainability with innovative designs. This year, we can expect to see a significant focus on eco-friendly materials and ethical production practices. Key trends include oversized silhouettes, vibrant colors, and the resurgence of nostalgic styles from the early 2000s.   Accessories play a crucial role in this year\'s fashion, with chunky shoes and statement bags leading the way. Additionally, layering will remain popular, allowing individuals to mix textures and styles creatively.   Streetwear will also continue to influence high fashion, with bold graphics and athleisure pieces dominating the scene. Overall, 2024 promises to be an exciting year for fashion enthusiasts, showcasing creativity and individuality.\";', 'Emily Johnson', '2024-10-15 04:57:27', 'images/fashion3.png', 'A guide to eco-friendly fabrics and how they are shaping the future of fashion...', 2, 1),
(11, 'How to Build a Gaming PC', 'Electronics', 'As we enter 2024, the smartphone market is buzzing with exciting new releases that showcase cutting-edge technology and innovative features. Here are the top 5 smartphones to look out for this year:  1. **Apple iPhone 15 Pro Max**: The latest flagship from Apple, the iPhone 15 Pro Max features a stunning 6.7-inch Super Retina XDR display, the powerful A17 Bionic chip, and an impressive camera system that excels in low-light photography. With enhanced battery life and iOS 17, it\'s perfect for both everyday users and photography enthusiasts.  2. **Samsung Galaxy S24 Ultra**: Known for its versatility, the Galaxy S24 Ultra offers a 6.8-inch Dynamic AMOLED display with a 120Hz refresh rate. It boasts a quad-camera setup, including a 200MP main sensor, and supports S Pen functionality for productivity. With its long-lasting battery and One UI 6, it\'s a top choice for Android users.  3. **Google Pixel 8 Pro**: The Pixel 8 Pro continues Google\'s tradition of exceptional photography, featuring an advanced camera system with AI enhancements for stunning images. Its 6.7-inch OLED display provides vibrant colors, and the integration of Android 14 ensures a smooth user experience.   4. **OnePlus 11T**: The OnePlus 11T is designed for performance enthusiasts, equipped with a Snapdragon 8 Gen 2 processor and up to 16GB of RAM. Its 6.7-inch Fluid AMOLED display is perfect for gaming, and the 100W fast charging capability ensures you’ll never run out of power quickly.  5. **Xiaomi 13 Pro**: The Xiaomi 13 Pro is a premium flagship with a sleek design, featuring a 6.73-inch AMOLED display and Snapdragon 8 Gen 2 processor. Its camera system, co-engineered with Leica, delivers stunning photography and videography capabilities, making it a favorite among tech enthusiasts.', 'John Tech', '2024-10-15 04:57:49', 'images/gaming-pc.jpg', 'A complete guide to building a high-performance gaming PC, from selecting parts to assembly...', 3, 1),
(12, 'The Future of AI in Consumer Electronics', 'Electronics', 'As we enter 2024, the smartphone market is buzzing with exciting new releases that showcase cutting-edge technology and innovative features. Here are the top 5 smartphones to look out for this year:  1. **Apple iPhone 15 Pro Max**: The latest flagship from Apple, the iPhone 15 Pro Max features a stunning 6.7-inch Super Retina XDR display, the powerful A17 Bionic chip, and an impressive camera system that excels in low-light photography. With enhanced battery life and iOS 17, it\'s perfect for both everyday users and photography enthusiasts.  2. **Samsung Galaxy S24 Ultra**: Known for its versatility, the Galaxy S24 Ultra offers a 6.8-inch Dynamic AMOLED display with a 120Hz refresh rate. It boasts a quad-camera setup, including a 200MP main sensor, and supports S Pen functionality for productivity. With its long-lasting battery and One UI 6, it\'s a top choice for Android users.  3. **Google Pixel 8 Pro**: The Pixel 8 Pro continues Google\'s tradition of exceptional photography, featuring an advanced camera system with AI enhancements for stunning images. Its 6.7-inch OLED display provides vibrant colors, and the integration of Android 14 ensures a smooth user experience.   4. **OnePlus 11T**: The OnePlus 11T is designed for performance enthusiasts, equipped with a Snapdragon 8 Gen 2 processor and up to 16GB of RAM. Its 6.7-inch Fluid AMOLED display is perfect for gaming, and the 100W fast charging capability ensures you’ll never run out of power quickly.  5. **Xiaomi 13 Pro**: The Xiaomi 13 Pro is a premium flagship with a sleek design, featuring a 6.73-inch AMOLED display and Snapdragon 8 Gen 2 processor. Its camera system, co-engineered with Leica, delivers stunning photography and videography capabilities, making it a favorite among tech enthusiasts.', 'AI Expert', '2024-10-16 09:04:43', 'images/ai-electronics.jpg', 'Learn about the latest advancements in AI and how it’s transforming the electronics industry...', 2, 1),
(14, 'Top Sports Events to Watch in 2024', 'Sports', '2024 promises to be an exciting year for sports fans, with a lineup of major events that will showcase the best athletes from around the world. Here are the top sports events to watch:  1. **2024 Summer Olympics (Paris, France)**: From July 26 to August 11, the Summer Olympics will return, bringing together athletes from over 200 nations. This edition will feature a wide range of sports, including athletics, swimming, gymnastics, and team sports, all set against the backdrop of iconic Parisian landmarks.  2. **UEFA Euro 2024 (Germany)**: Kicking off in June, the UEFA European Championship will see the continent\'s top football nations compete for glory. With matches held across 10 German cities, fans can expect thrilling games and passionate atmospheres as teams vie for the prestigious trophy.  3. **Super Bowl LVIII (Las Vegas, USA)**: Scheduled for February 11, 2024, the Super Bowl will take place at Allegiant Stadium in Las Vegas. This highly anticipated event will feature the champions of the NFL, along with extravagant halftime performances and commercials that fans look forward to every year.  4. **NBA All-Star Weekend (Indianapolis, USA)**: Taking place from February 16 to 18, 2024, the NBA All-Star Weekend is a celebration of basketball featuring the best players in the league. Events include the All-Star Game, Slam Dunk Contest, and 3-Point Contest, showcasing the incredible talent of the league\'s stars.  5. **Formula 1 Monaco Grand Prix**: On May 26, 2024, the iconic Monaco Grand Prix will return, offering one of the most prestigious races in the Formula 1 calendar. The race takes place on the streets of Monte Carlo, combining speed with stunning views of the Mediterranean.', 'Sports Fanatic', '2024-10-15 04:57:57', 'images/sports1.jpg', 'A look at the biggest sports events to mark on your calendar for 2024...', 1, 1),
(15, 'How to Stay Fit During the Off-Season', 'Sports', '2024 promises to be an exciting year for sports fans, with a lineup of major events that will showcase the best athletes from around the world. Here are the top sports events to watch:  1. **2024 Summer Olympics (Paris, France)**: From July 26 to August 11, the Summer Olympics will return, bringing together athletes from over 200 nations. This edition will feature a wide range of sports, including athletics, swimming, gymnastics, and team sports, all set against the backdrop of iconic Parisian landmarks.  2. **UEFA Euro 2024 (Germany)**: Kicking off in June, the UEFA European Championship will see the continent\'s top football nations compete for glory. With matches held across 10 German cities, fans can expect thrilling games and passionate atmospheres as teams vie for the prestigious trophy.  3. **Super Bowl LVIII (Las Vegas, USA)**: Scheduled for February 11, 2024, the Super Bowl will take place at Allegiant Stadium in Las Vegas. This highly anticipated event will feature the champions of the NFL, along with extravagant halftime performances and commercials that fans look forward to every year.  4. **NBA All-Star Weekend (Indianapolis, USA)**: Taking place from February 16 to 18, 2024, the NBA All-Star Weekend is a celebration of basketball featuring the best players in the league. Events include the All-Star Game, Slam Dunk Contest, and 3-Point Contest, showcasing the incredible talent of the league\'s stars.  5. **Formula 1 Monaco Grand Prix**: On May 26, 2024, the iconic Monaco Grand Prix will return, offering one of the most prestigious races in the Formula 1 calendar. The race takes place on the streets of Monte Carlo, combining speed with stunning views of the Mediterranean.', 'Fitness Trainer', '2024-10-15 04:57:52', 'images/sports2.jpg', 'Tips and tricks for maintaining your fitness level when your sport is off-season...', 2, 1),
(16, 'The Rise of E-Sports in 2024', 'Sports', '2024 promises to be an exciting year for sports fans, with a lineup of major events that will showcase the best athletes from around the world. Here are the top sports events to watch:  1. **2024 Summer Olympics (Paris, France)**: From July 26 to August 11, the Summer Olympics will return, bringing together athletes from over 200 nations. This edition will feature a wide range of sports, including athletics, swimming, gymnastics, and team sports, all set against the backdrop of iconic Parisian landmarks.  2. **UEFA Euro 2024 (Germany)**: Kicking off in June, the UEFA European Championship will see the continent\'s top football nations compete for glory. With matches held across 10 German cities, fans can expect thrilling games and passionate atmospheres as teams vie for the prestigious trophy.  3. **Super Bowl LVIII (Las Vegas, USA)**: Scheduled for February 11, 2024, the Super Bowl will take place at Allegiant Stadium in Las Vegas. This highly anticipated event will feature the champions of the NFL, along with extravagant halftime performances and commercials that fans look forward to every year.  4. **NBA All-Star Weekend (Indianapolis, USA)**: Taking place from February 16 to 18, 2024, the NBA All-Star Weekend is a celebration of basketball featuring the best players in the league. Events include the All-Star Game, Slam Dunk Contest, and 3-Point Contest, showcasing the incredible talent of the league\'s stars.  5. **Formula 1 Monaco Grand Prix**: On May 26, 2024, the iconic Monaco Grand Prix will return, offering one of the most prestigious races in the Formula 1 calendar. The race takes place on the streets of Monte Carlo, combining speed with stunning views of the Mediterranean.', 'Gaming Expert', '2024-10-17 00:04:52', 'images/sports3.jpg', 'Explore the growing phenomenon of e-sports and what it means for traditional sports...', 2, 1),
(17, 'The Best-Selling Novels of 2024', 'Books', 'As we step into 2024, the literary world is brimming with excitement over new releases from acclaimed authors and emerging voices. Here are some of the best-selling novels to look forward to this year:  1. **\'The Midnight Library\' by Matt Haig**: This novel explores the infinite possibilities of life through the lens of a library filled with books that contain different versions of one’s life. Haig\'s profound storytelling continues to resonate, making this a must-read for fans of thought-provoking fiction.  2. **\'Lessons in Chemistry\' by Bonnie Garmus**: This novel tells the story of a female chemist in the 1960s who defies societal norms to become a science show host. With humor and heart, Garmus delivers a powerful commentary on gender roles and scientific exploration that has captured readers\' hearts.  3. **\'Tomorrow, and Tomorrow, and Tomorrow\' by Gabrielle Zevin**: A captivating tale of friendship, creativity, and the gaming industry, this novel follows two childhood friends who reunite to create a groundbreaking video game. Zevin’s exploration of the intersection between art and technology makes this an engaging read.  4. **\'The Covenant of Water\' by Abraham Verghese**: This sweeping family saga set in Kerala, India, spans several generations and delves into themes of love, loss, and healing. Verghese’s lyrical prose and rich storytelling have positioned this novel as a top contender for the best-seller list.  5. **\'Pineapple Street\' by Jenny Jackson**: This sharp and witty novel revolves around the complexities of wealth, family, and societal expectations in Brooklyn. Jackson\'s keen observations and relatable characters make this a delightful read for those interested in contemporary social dynamics.', 'Literature Lover', '2024-10-15 04:57:59', 'images/books1.jpg', 'Explore the best-selling novels of the year, from thrilling mysteries to heartwarming romances...', 1, 1),
(18, 'How to Start a Book Club', 'Books', 'As we step into 2024, the literary world is brimming with excitement over new releases from acclaimed authors and emerging voices. Here are some of the best-selling novels to look forward to this year:  1. **\'The Midnight Library\' by Matt Haig**: This novel explores the infinite possibilities of life through the lens of a library filled with books that contain different versions of one’s life. Haig\'s profound storytelling continues to resonate, making this a must-read for fans of thought-provoking fiction.  2. **\'Lessons in Chemistry\' by Bonnie Garmus**: This novel tells the story of a female chemist in the 1960s who defies societal norms to become a science show host. With humor and heart, Garmus delivers a powerful commentary on gender roles and scientific exploration that has captured readers\' hearts.  3. **\'Tomorrow, and Tomorrow, and Tomorrow\' by Gabrielle Zevin**: A captivating tale of friendship, creativity, and the gaming industry, this novel follows two childhood friends who reunite to create a groundbreaking video game. Zevin’s exploration of the intersection between art and technology makes this an engaging read.  4. **\'The Covenant of Water\' by Abraham Verghese**: This sweeping family saga set in Kerala, India, spans several generations and delves into themes of love, loss, and healing. Verghese’s lyrical prose and rich storytelling have positioned this novel as a top contender for the best-seller list.  5. **\'Pineapple Street\' by Jenny Jackson**: This sharp and witty novel revolves around the complexities of wealth, family, and societal expectations in Brooklyn. Jackson\'s keen observations and relatable characters make this a delightful read for those interested in contemporary social dynamics.', 'Bookworm Blogger', '2024-10-17 00:04:55', 'images/books2.jpg', 'A guide to starting your own book club, including tips on book selection and group dynamics...', 1, 1),
(19, 'Top 10 Must-Read Books for 2024', 'Books', 'As we step into 2024, the literary world is brimming with excitement over new releases from acclaimed authors and emerging voices. Here are some of the best-selling novels to look forward to this year:  1. **\'The Midnight Library\' by Matt Haig**: This novel explores the infinite possibilities of life through the lens of a library filled with books that contain different versions of one’s life. Haig\'s profound storytelling continues to resonate, making this a must-read for fans of thought-provoking fiction.  2. **\'Lessons in Chemistry\' by Bonnie Garmus**: This novel tells the story of a female chemist in the 1960s who defies societal norms to become a science show host. With humor and heart, Garmus delivers a powerful commentary on gender roles and scientific exploration that has captured readers\' hearts.  3. **\'Tomorrow, and Tomorrow, and Tomorrow\' by Gabrielle Zevin**: A captivating tale of friendship, creativity, and the gaming industry, this novel follows two childhood friends who reunite to create a groundbreaking video game. Zevin’s exploration of the intersection between art and technology makes this an engaging read.  4. **\'The Covenant of Water\' by Abraham Verghese**: This sweeping family saga set in Kerala, India, spans several generations and delves into themes of love, loss, and healing. Verghese’s lyrical prose and rich storytelling have positioned this novel as a top contender for the best-seller list.  5. **\'Pineapple Street\' by Jenny Jackson**: This sharp and witty novel revolves around the complexities of wealth, family, and societal expectations in Brooklyn. Jackson\'s keen observations and relatable characters make this a delightful read for those interested in contemporary social dynamics.', 'Readers Digest', '2024-10-15 03:31:14', 'images/books3.jpg', 'Don’t miss these must-read books that will be taking the literary world by storm...', 2, 0),
(20, 'Trendy Furniture Designs for 2024', 'Furniture', 'As we step into 2024, the world of interior design is embracing innovative and sustainable furniture trends that cater to modern lifestyles. Here are some of the top furniture designs to watch for this year:  1. **Sustainable Materials**: With an increasing emphasis on eco-friendliness, furniture made from sustainable materials such as reclaimed wood, bamboo, and recycled metals will dominate. Designers are focusing on durability and environmental impact, creating pieces that are both stylish and responsible.  2. **Multifunctional Furniture**: As living spaces become smaller, the demand for multifunctional furniture is rising. Look for designs that serve multiple purposes, such as sofas that convert into beds, coffee tables with storage compartments, and desks that can be adjusted for standing or sitting.  3. **Bold Colors and Patterns**: 2024 will see a shift towards bold colors and intricate patterns. Expect to see vibrant hues like emerald green, terracotta, and deep blue, paired with geometric or floral patterns. These designs will add personality and flair to any space.  4. **Organic Shapes**: Soft, organic shapes are making a comeback, moving away from the harsh lines of modern minimalism. Curved sofas, round coffee tables, and soft-edged chairs create a more inviting atmosphere and enhance comfort.  5. **Tech-Integrated Furniture**: With the rise of smart homes, furniture that integrates technology will be at the forefront. This includes charging ports built into tables, smart mirrors with LED lighting, and adjustable lighting systems in furniture pieces.', 'Home Decorator', '2024-10-15 04:58:13', 'images/furniture1.jpg', 'Discover the furniture trends of 2024 that will transform your living space...', 1, 1),
(21, 'How to Choose the Right Sofa', 'Furniture', 'As we step into 2024, the world of interior design is embracing innovative and sustainable furniture trends that cater to modern lifestyles. Here are some of the top furniture designs to watch for this year:  1. **Sustainable Materials**: With an increasing emphasis on eco-friendliness, furniture made from sustainable materials such as reclaimed wood, bamboo, and recycled metals will dominate. Designers are focusing on durability and environmental impact, creating pieces that are both stylish and responsible.  2. **Multifunctional Furniture**: As living spaces become smaller, the demand for multifunctional furniture is rising. Look for designs that serve multiple purposes, such as sofas that convert into beds, coffee tables with storage compartments, and desks that can be adjusted for standing or sitting.  3. **Bold Colors and Patterns**: 2024 will see a shift towards bold colors and intricate patterns. Expect to see vibrant hues like emerald green, terracotta, and deep blue, paired with geometric or floral patterns. These designs will add personality and flair to any space.  4. **Organic Shapes**: Soft, organic shapes are making a comeback, moving away from the harsh lines of modern minimalism. Curved sofas, round coffee tables, and soft-edged chairs create a more inviting atmosphere and enhance comfort.  5. **Tech-Integrated Furniture**: With the rise of smart homes, furniture that integrates technology will be at the forefront. This includes charging ports built into tables, smart mirrors with LED lighting, and adjustable lighting systems in furniture pieces.', 'Interior Designer', '2024-10-15 03:31:49', 'images/furniture2.jpg', 'Tips for selecting the perfect sofa to complement your home decor...', 2, 0),
(22, 'DIY Furniture Projects for Beginners', 'Furniture', 'As we step into 2024, the world of interior design is embracing innovative and sustainable furniture trends that cater to modern lifestyles. Here are some of the top furniture designs to watch for this year:  1. **Sustainable Materials**: With an increasing emphasis on eco-friendliness, furniture made from sustainable materials such as reclaimed wood, bamboo, and recycled metals will dominate. Designers are focusing on durability and environmental impact, creating pieces that are both stylish and responsible.  2. **Multifunctional Furniture**: As living spaces become smaller, the demand for multifunctional furniture is rising. Look for designs that serve multiple purposes, such as sofas that convert into beds, coffee tables with storage compartments, and desks that can be adjusted for standing or sitting.  3. **Bold Colors and Patterns**: 2024 will see a shift towards bold colors and intricate patterns. Expect to see vibrant hues like emerald green, terracotta, and deep blue, paired with geometric or floral patterns. These designs will add personality and flair to any space.  4. **Organic Shapes**: Soft, organic shapes are making a comeback, moving away from the harsh lines of modern minimalism. Curved sofas, round coffee tables, and soft-edged chairs create a more inviting atmosphere and enhance comfort.  5. **Tech-Integrated Furniture**: With the rise of smart homes, furniture that integrates technology will be at the forefront. This includes charging ports built into tables, smart mirrors with LED lighting, and adjustable lighting systems in furniture pieces.', 'Craft Enthusiast', '2024-10-15 03:31:52', 'images/furniture3.jpg', 'Easy DIY furniture projects that you can start this weekend...', 1, 0),
(23, 'Fashion Accessories to Elevate Your Look', 'Accessories', 'This section covers the latest trends in fashion accessories, featuring styles that elevate any outfit and enhance personal expression.', 'Style Expert', '2024-10-15 03:31:55', 'images/accessories1.jpg', 'Discover the must-have accessories to complete your outfit this season...', 2, 0),
(44, 'Fashion Accessories to Elevate Your Look 2024', 'Accessories', 'This section covers the latest trends in fashion accessories, featuring styles that elevate any outfit and enhance personal expression.', 'Style Expert', '2024-10-15 04:57:29', 'images/accessories1.jpg', 'Discover the must-have accessories to complete your outfit this season...', 1, 1),
(49, 'Fashion Accessories to Elevate Your Look 2025', 'Accessories', 'This section covers the latest trends in fashion accessories, featuring styles that elevate any outfit and enhance personal expression.', 'Style Expert', '2024-10-15 04:57:30', 'images/accessories1.jpg', 'Discover the must-have accessories to complete your look...', 1, 1),
(70, 'fullname', 'clothes', '', 'ram shah', '2024-10-23 00:14:34', 'uploads/fb.png', 'd', 1, 1),
(71, 'name', 'clothes', '', 'ramshah', '2024-10-23 00:14:26', 'uploads/fb.png', 'this is my fullname likeramshah', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `category_name` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `category_name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Clothes', 'Apparel and clothing items for men, women, and children', '2024-10-15 00:43:21', '2024-10-15 00:43:21'),
(2, 'Electronics', 'Electronic gadgets and devices like smartphones, laptops, and TVs', '2024-10-15 00:43:21', '2024-10-15 00:43:21'),
(3, 'Books', 'Various genres of books and reading material', '2024-10-15 00:43:21', '2024-10-15 00:43:21'),
(4, 'Furniture', 'Home and office furniture such as chairs, tables, and sofas', '2024-10-15 00:43:21', '2024-10-15 00:43:21'),
(5, 'Sports', 'Sports equipment and accessories', '2024-10-15 00:43:21', '2024-10-15 00:43:21'),
(11, 'Accessories', NULL, '2024-10-15 01:45:45', '2024-10-15 01:52:46');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `uid`, `post_id`, `author`, `content`, `created_at`) VALUES
(1, 1, 22, 'ram', 'this is my name', '2024-10-14 09:52:47'),
(2, 2, 22, 'ram', 'this is my name', '2024-10-14 09:52:47'),
(3, 1, 22, 'ram shah', 'this is my name', '2024-10-14 09:52:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email`, `subject`, `message`, `created_at`) VALUES
(4, 'dfg', 'ramrattan099@gmail.com', 'dfg', 'dfg', '2024-10-09 04:37:42'),
(5, 'ram rattan', 'ramrattan099@gmail.com', 'give ', 'ff', '2024-10-09 04:52:57'),
(6, 'ram rattan', 'ramrattan099@gmail.com', 'give ', 'ram', '2024-10-09 05:04:10'),
(7, 'ram rattan', 'raviking2311@gmail.com', 'give ', 'dfgd', '2024-10-09 05:05:08'),
(8, 'ram rattan', 'ramrattan099@gmail.com', 'sdfsdfsdfsdfsdfs', 'dfsdfsddddddddddddddddddddddddddddddddddd', '2024-10-10 04:07:42'),
(9, 'ravinder mishra', 'ramrattan099@gmail.com', 'sadasda', 'sdasd', '2024-10-10 04:09:06'),
(10, 'ram rattan', 'ramrattan099@gmail.com', 'ghj', 'ghjg', '2024-10-10 04:14:00'),
(11, 'ravinder mishra', 'ramrattan099@gmail.com', 'sdfs', 'dfsdf', '2024-10-10 04:14:34');

-- --------------------------------------------------------

--
-- Table structure for table `signup`
--

CREATE TABLE `signup` (
  `uid` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `verification_token` varchar(255) NOT NULL,
  `is_verified` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `signup`
--

INSERT INTO `signup` (`uid`, `name`, `email`, `password`, `verification_token`, `is_verified`, `created_at`, `role`) VALUES
(1, 'ram rattan', 'ramrattan099@gmail.com', '1', 'c242039e47afc3fbaccdd66d631b86ce', '1', '2024-10-15 09:49:27', 'admin'),
(2, 'ram rattan', 'ramrattan0999@gmail.com', '11', 'c242039e47afc3fbaccdd66d631b86ce', '1', '2024-10-16 09:58:58', 'user'),
(4, 'Guriya Shah', 'shahguriya610@gmail.com', '', '', '1', '2024-10-16 09:58:51', 'admin'),
(42, 'ravinder mishra', 'ramrattan099@gmail.com', '', '', '', '2024-10-16 23:17:39', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `view`
--

CREATE TABLE `view` (
  `id` int(11) NOT NULL,
  `blog_id` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `view`
--

INSERT INTO `view` (`id`, `blog_id`, `uid`, `views`) VALUES
(2, 11, 1, 2),
(3, 12, 1, 2),
(4, 12, 2, 2),
(5, 12, 2, 2),
(6, 5, 1, 2),
(7, 20, 1, 4),
(8, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `visiters`
--

CREATE TABLE `visiters` (
  `id` int(11) NOT NULL,
  `views` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `visiters`
--

INSERT INTO `visiters` (`id`, `views`) VALUES
(8, 360);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
