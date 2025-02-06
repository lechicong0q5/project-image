DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `pass_word` VARCHAR(255) DEFAULT NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255) DEFAULT NULL,
    `google_id` VARCHAR(255) DEFAULT NULL,
    `face_app_id` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;


DROP TABLE IF EXISTS `images`;


CREATE TABLE `users` (
    `user_id` INT NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(255) NOT NULL,
    `pass_word` VARCHAR(255) DEFAULT NULL,
    `full_name` VARCHAR(255) NOT NULL,
    `avatar` VARCHAR(255) DEFAULT NULL,
    `google_id` VARCHAR(255) DEFAULT NULL,
    `face_app_id` VARCHAR(255) DEFAULT NULL,
    `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`user_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 2 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

-- Insert 3 users
INSERT INTO `users` (`email`, `pass_word`, `full_name`, `avatar`, `google_id`, `face_app_id`) VALUES
('user1@example.com', 'password1', 'User One', 'avatar1.png', NULL, NULL),
('user2@example.com', 'password2', 'User Two', 'avatar2.png', NULL, NULL),
('user3@example.com', 'password3', 'User Three', 'avatar3.png', NULL, NULL);

CREATE TABLE `images` (
    `image_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` TEXT,
    `image_url` VARCHAR(255) NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`image_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;


INSERT INTO `images` (`user_id`, `title`, `description`, `image_url`) VALUES
(1, 'Cảnh Núi Hùng Vĩ', 'Một cảnh núi non tuyệt đẹp với bầu trời trong xanh.', 'https://picsum.photos/800/600?random=1'),
(2, 'Đường Mòn Trong Rừng', 'Một con đường mòn yên bình giữa khu rừng rậm.', 'https://picsum.photos/800/600?random=2'),
(3, 'Hoàng Hôn Bên Bờ Biển', 'Hoàng hôn rực rỡ trên bãi biển cát trắng.', 'https://picsum.photos/800/600?random=3'),
(3, 'Đường Phố Thành Phố Ban Đêm', 'Khung cảnh đường phố sôi động vào ban đêm.', 'https://picsum.photos/800/600?random=4'),
(3, 'Cồn Cát Sa Mạc', 'Những cồn cát vàng óng trải dài dưới bầu trời xanh.', 'https://picsum.photos/800/600?random=5'),
(1, 'Thác Nước Hùng Vĩ', 'Thác nước đẹp mê hồn trong khu rừng nhiệt đới.', 'https://picsum.photos/800/600?random=6'),
(2, 'Cảnh Quan Tuyết Phủ', 'Một vùng đất phủ đầy tuyết trắng, yên bình và lạnh giá.', 'https://picsum.photos/800/600?random=7'),
(2, 'Hồ Nước Phản Chiếu Núi', 'Hồ nước phẳng lặng phản chiếu dãy núi xung quanh.', 'https://picsum.photos/800/600?random=8'),
(3, 'Cánh Đồng Hoa Hướng Dương', 'Một cánh đồng hoa hướng dương vàng rực dưới ánh mặt trời.', 'https://picsum.photos/800/600?random=9'),
(1, 'Cảnh Đồng Quê Thanh Bình', 'Cánh đồng cỏ xanh mướt trải dài đến chân trời.', 'https://picsum.photos/800/600?random=10');


CREATE TABLE `comments` (
    `comment_id` INT NOT NULL AUTO_INCREMENT,
    `image_id` INT NOT NULL,
    `user_id` INT NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    `updated_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`comment_id`),
    FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `comments` (`image_id`, `user_id`, `content`) VALUES
(4, 1, 'This picture is absolutely stunning!'),
(5, 2, 'Amazing details, very impressive!'),
(6, 3, 'Love the colors, very vibrant!'),
(7, 1, 'Such a peaceful vibe in this photo.'),
(8, 2, 'This one stands out, beautiful work!'),
(9, 3, 'Incredible shot, well done!'),
(10, 1, 'The perspective in this photo is so cool!'),
(1, 3, 'Really creative composition, love it!'),
(2, 2, 'Fantastic view, so inspiring!'),
(3, 1, 'The lighting in this one is perfect!');



CREATE TABLE `saved_images` (
    `save_id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `image_id` INT NOT NULL,
    `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`save_id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
    FOREIGN KEY (`image_id`) REFERENCES `images` (`image_id`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

INSERT INTO `saved_images` (`user_id`, `image_id`) VALUES
(1, 2),
(2, 3),
(3, 1),
(3,2),
(3,6),
(2,10),
(1,10),
(2,7),
(2,4);