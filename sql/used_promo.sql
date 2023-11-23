CREATE TABLE `character_used_promocodes` (
  `character_id` int NOT NULL,
  `promo_code` varchar(12) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`character_id`,`promo_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;