CREATE TABLE `characters_promocode` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  `item_reward` int DEFAULT NULL,
  `uses_left` int DEFAULT '3',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `gold_reward` int DEFAULT NULL,
  `reward_type` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `loyalty_points_reward` int unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;