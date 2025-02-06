/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `face_app_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `created_at`, `updated_at`) VALUES
(1, 'lechicong015@gmail.com', '$2b$10$k0d/dJXTK2llDODvPclC0ublIRykfJUF2ugJqmhrvKpFP98n.B1dO', 'Cong', NULL, NULL, NULL, '2025-01-26 08:28:07', '2025-01-26 08:28:58');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `created_at`, `updated_at`) VALUES
(2, 'long015@gmail.com', '$2b$10$XMykkMX/lzQjecih0Ji43eIkAicfCOtys/YsqMuZUjZz/DLHH6QMa', 'long', NULL, NULL, NULL, '2025-01-26 08:29:18', '2025-01-26 08:42:46');
INSERT INTO `users` (`user_id`, `email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`, `created_at`, `updated_at`) VALUES
(3, 'long12@gmail.com', '$2b$10$B67FSpHLcNa86Ud2d9DF6eaIu6v.DvKHXavBvggId1hRmhVA3iEC2', 'longlong', NULL, NULL, NULL, '2025-01-26 08:29:31', '2025-01-26 08:42:46');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;