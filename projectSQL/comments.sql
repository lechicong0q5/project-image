/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `image_id` int NOT NULL,
  `user_id` int NOT NULL,
  `content` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `image_id` (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`comment_id`, `image_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 4, 1, 'This picture is absolutely stunning!', '2025-01-26 08:44:50', '2025-02-03 01:18:59');
INSERT INTO `comments` (`comment_id`, `image_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(2, 5, 2, 'Amazing details, very impressive!', '2025-01-26 08:44:50', '2025-02-03 01:18:59');
INSERT INTO `comments` (`comment_id`, `image_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(3, 6, 3, 'Love the colors, very vibrant!', '2025-01-26 08:44:50', '2025-02-03 01:18:59');
INSERT INTO `comments` (`comment_id`, `image_id`, `user_id`, `content`, `created_at`, `updated_at`) VALUES
(4, 7, 1, 'Such a peaceful vibe in this photo.', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(5, 8, 2, 'This one stands out, beautiful work!', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(6, 9, 3, 'Incredible shot, well done!', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(8, 1, 3, 'Really creative composition, love it!', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(9, 2, 2, 'Fantastic view, so inspiring!', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(10, 3, 1, 'The lighting in this one is perfect!', '2025-01-26 08:44:50', '2025-02-03 01:18:59'),
(11, 2, 3, 'oh my god', '2025-02-05 01:06:01', '2025-02-05 01:06:16');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;