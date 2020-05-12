-- +goose Up
CREATE TABLE image (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,

  url TEXT(3000) NOT NULL,
  character_name VARCHAR(255) NOT NULL,

  attribute_primary VARCHAR(255) NOT NULL,
  attribute_secondary VARCHAR(255),
  attribute_tertiary VARCHAR(255),

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/tisu.jpg', '月ノ美兎', '挨拶', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/otu.jpg', '月ノ美兎', 'おつかれ', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/ehehe.jpg', '月ノ美兎', 'ありがとう', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/outikaero.png', 'をとは', '帰りたい', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/yunomi.png', 'Yunomi', 'Yunomiを布教したい', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/kuku.jpg', '月ノ美兎', 'ネガティブ', NULL, NULL);
insert into image (url, character_name, attribute_primary, attribute_secondary, attribute_tertiary) values ('https://resimagebucket.s3.us-east-2.amazonaws.com/mimamori.jpg', '月ノ美兎', 'ネガティブ', NULL, NULL);


-- +goose Down
DROP TABLE image;
