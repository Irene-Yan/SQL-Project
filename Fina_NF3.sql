# This is to convert data to NF3.
# As our work has two seperate parts, which is coffee and food parts, 
# our results will include two relational table system.
# The coffee relationsal table will include coffee_info, geo_onfo and comment_info
# The food relational table will include food_info, geo_food_info, comment_food_info

SELECT state, country
FROM coffee
GROUP BY state, country;

SELECT state, country
FROM food
GROUP BY state, country;

ALTER TABLE `yelp`.`coffee_review` 
CHANGE COLUMN `rating` `rating_ind` FLOAT NULL DEFAULT NULL ;

ALTER TABLE `yelp`.`food_review` 
CHANGE COLUMN `rating` `rating_ind` FLOAT NULL DEFAULT NULL ;

#########################################################
# coffee NF3

DROP TABLE IF EXISTS coffee_info;
CREATE TABLE IF NOT EXISTS coffee_info AS
SELECT 	distinct xuhao, school, name, rating, review_count, cate_alias, cate_title, price, distance, image_url, display_phone, is_closed, id, latitude, longitude, address_detail, zip_code
FROM coffee;

DROP TABLE IF EXISTS geo_info;
CREATE TABLE IF NOT EXISTS geo_info AS
SELECT 	distinct zip_code, state, country
FROM coffee;

set @row_num := 0;
DROP TABLE IF EXISTS comment_info;
CREATE TABLE IF NOT EXISTS comment_info AS
SELECT (@row_num := @row_num + 1) as comment_id, xuhao, rating_ind, text
FROM coffee_review;

ALTER TABLE `yelp`.`coffee_info` 
CHANGE COLUMN `xuhao` `xuhao` INT NOT NULL ,
ADD PRIMARY KEY (`xuhao`);
;
ALTER TABLE `yelp`.`geo_info` 
CHANGE COLUMN `zip_code` `zip_code` INT NOT NULL ,
ADD PRIMARY KEY (`zip_code`);
;
ALTER TABLE `yelp`.`comment_info` 
CHANGE COLUMN `comment_id` `comment_id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`comment_id`);
;

alter table coffee_info
add constraint FK_zip foreign key(zip_code) REFERENCES geo_info(zip_code);

alter table comment_info
add constraint FK_xuhao1 foreign key(xuhao) REFERENCES coffee_info(xuhao);

#ALTER TABLE coffee_info DROP FOREIGN KEY FK_xuhao ;

#SHOW CREATE TABLE coffee_info;


#########################################################
# food NF3

DROP TABLE IF EXISTS food_info;
CREATE TABLE IF NOT EXISTS food_info AS
SELECT 	distinct xuhao, name, rating, review_count, cate_alias, cate_title, price, distance, image_url, display_phone, is_closed, id, latitude, longitude, address_detail, zip_code
FROM food;

DROP TABLE IF EXISTS geo_food_info;
CREATE TABLE IF NOT EXISTS geo_food_info AS
SELECT 	distinct zip_code, state, country
FROM food;

set @row_num := 0;
DROP TABLE IF EXISTS comment_food_info;
CREATE TABLE IF NOT EXISTS comment_food_info AS
SELECT (@row_num := @row_num + 1) as comment_id, xuhao, rating_ind, text
FROM food_review;

ALTER TABLE `yelp`.`food_info` 
CHANGE COLUMN `xuhao` `xuhao` INT NOT NULL ,
ADD PRIMARY KEY (`xuhao`);
;

ALTER TABLE `yelp`.`geo_food_info` 
CHANGE COLUMN `zip_code` `zip_code` INT NOT NULL ,
ADD PRIMARY KEY (`zip_code`);
;

ALTER TABLE `yelp`.`comment_food_info` 
CHANGE COLUMN `comment_id` `comment_id` BIGINT NOT NULL ,
ADD PRIMARY KEY (`comment_id`);
;

alter table food_info
add constraint FK_food_zip foreign key(zip_code) REFERENCES geo_food_info(zip_code);

alter table comment_food_info
add constraint FK_food_xuhao1 foreign key(xuhao) REFERENCES food_info(xuhao);

