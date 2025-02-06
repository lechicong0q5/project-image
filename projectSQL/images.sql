/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text,
  `image_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `images_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `images` (`image_id`, `user_id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(1, 1, 'Cảnh Núi Hùng Vĩ', 'Một cảnh núi non tuyệt đẹp với bầu trời trong xanh.', 'https://picsum.photos/800/600?random=1', '2025-01-26 08:42:49', '2025-01-26 08:44:45');
INSERT INTO `images` (`image_id`, `user_id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(2, 2, 'Đường Mòn Trong Rừng', 'Một con đường mòn yên bình giữa khu rừng rậm.', 'https://picsum.photos/800/600?random=2', '2025-01-26 08:42:49', '2025-01-26 08:44:45');
INSERT INTO `images` (`image_id`, `user_id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(3, 3, 'Hoàng Hôn Bên Bờ Biển', 'Hoàng hôn rực rỡ trên bãi biển cát trắng.', 'https://picsum.photos/800/600?random=3', '2025-01-26 08:42:49', '2025-01-26 08:44:45');
INSERT INTO `images` (`image_id`, `user_id`, `title`, `description`, `image_url`, `created_at`, `updated_at`) VALUES
(4, 3, 'Đường Phố Thành Phố Ban Đêm', 'Khung cảnh đường phố sôi động vào ban đêm.', 'https://picsum.photos/800/600?random=4', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(5, 3, 'Cồn Cát Sa Mạc', 'Những cồn cát vàng óng trải dài dưới bầu trời xanh.', 'https://picsum.photos/800/600?random=5', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(6, 1, 'Thác Nước Hùng Vĩ', 'Thác nước đẹp mê hồn trong khu rừng nhiệt đới.', 'https://picsum.photos/800/600?random=6', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(7, 2, 'Cảnh Quan Tuyết Phủ', 'Một vùng đất phủ đầy tuyết trắng, yên bình và lạnh giá.', 'https://picsum.photos/800/600?random=7', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(8, 2, 'Hồ Nước Phản Chiếu Núi', 'Hồ nước phẳng lặng phản chiếu dãy núi xung quanh.', 'https://picsum.photos/800/600?random=8', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(9, 3, 'Cánh Đồng Hoa Hướng Dương', 'Một cánh đồng hoa hướng dương vàng rực dưới ánh mặt trời.', 'https://picsum.photos/800/600?random=9', '2025-01-26 08:42:49', '2025-01-26 08:44:45'),
(10, 2, 'Cảnh Chim Bay', 'Một cánh đồng ', 'https://tse3.mm.bing.net/th?id=OIP.3BHumqCBJepicNQbhzQfPwHaFN&w=333&h=333&c=7', '2025-02-06 01:08:06', '2025-02-06 01:08:06');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;