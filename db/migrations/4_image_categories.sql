-- +goose Up
CREATE TABLE image_categories (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,

  image_id int(10) NOT NULL,
  category_id int(10) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE image_categories;
