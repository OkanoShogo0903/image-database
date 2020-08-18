-- +goose Up
CREATE TABLE images (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,

  url TEXT(3000) NOT NULL,
  character_id int(10) UNSIGNED NOT NULL,
  main_category_id int(10) UNSIGNED NOT NULL,
  favorite boolean NOT NULL DEFAULT false,

  PRIMARY KEY (id),
  CONSTRAINT fk_character_id
    FOREIGN KEY (character_id) 
    REFERENCES characters (id),

  CONSTRAINT fk_main_category_id
    FOREIGN KEY (main_category_id) 
    REFERENCES categories (id)

) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE images;
