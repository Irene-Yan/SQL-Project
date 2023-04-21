CREATE DATABASE `yelp` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
CREATE TABLE `coffee` (
  `xuhao` int DEFAULT NULL,
  `school` text,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `zip_code` int DEFAULT NULL,
  `state` text,
  `country` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `coffee_graph` (
  `xuhao` int DEFAULT NULL,
  `school` text,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `city` text,
  `zip_code` int DEFAULT NULL,
  `state` text,
  `country` text,
  `rating_ind` float DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `coffee_info` (
  `xuhao` int NOT NULL,
  `school` text,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `zip_code` int DEFAULT NULL,
  PRIMARY KEY (`xuhao`),
  KEY `FK_zip` (`zip_code`),
  CONSTRAINT `FK_zip` FOREIGN KEY (`zip_code`) REFERENCES `geo_info` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `coffee_review` (
  `xuhao` int DEFAULT NULL,
  `school` text,
  `rating_ind` float DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `comment_food_info` (
  `comment_id` bigint NOT NULL,
  `xuhao` int DEFAULT NULL,
  `rating_ind` float DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`comment_id`),
  KEY `FK_food_xuhao1` (`xuhao`),
  CONSTRAINT `FK_food_xuhao1` FOREIGN KEY (`xuhao`) REFERENCES `food_info` (`xuhao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `comment_info` (
  `comment_id` bigint NOT NULL,
  `xuhao` int DEFAULT NULL,
  `rating_ind` float DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`comment_id`),
  KEY `FK_xuhao1` (`xuhao`),
  CONSTRAINT `FK_xuhao1` FOREIGN KEY (`xuhao`) REFERENCES `coffee_info` (`xuhao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `food` (
  `xuhao` int DEFAULT NULL,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `zip_code` int DEFAULT NULL,
  `state` text,
  `country` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `food_graph` (
  `xuhao` int DEFAULT NULL,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `city` text,
  `zip_code` int DEFAULT NULL,
  `state` text,
  `country` text,
  `rating_ind` float DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `food_info` (
  `xuhao` int NOT NULL,
  `name` text,
  `rating` float DEFAULT NULL,
  `review_count` int DEFAULT NULL,
  `cate_alias` text,
  `cate_title` text,
  `price` text,
  `distance` float DEFAULT NULL,
  `image_url` text,
  `display_phone` text,
  `is_closed` text,
  `id` text,
  `latitude` float DEFAULT NULL,
  `longitude` float DEFAULT NULL,
  `address_detail` text,
  `zip_code` int DEFAULT NULL,
  PRIMARY KEY (`xuhao`),
  KEY `FK_food_zip` (`zip_code`),
  CONSTRAINT `FK_food_zip` FOREIGN KEY (`zip_code`) REFERENCES `geo_food_info` (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `food_review` (
  `xuhao` int DEFAULT NULL,
  `rating_ind` float DEFAULT NULL,
  `text` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `geo_food_info` (
  `zip_code` int NOT NULL,
  `state` text,
  `country` text,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
CREATE TABLE `geo_info` (
  `zip_code` int NOT NULL,
  `state` text,
  `country` text,
  PRIMARY KEY (`zip_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

