-- +goose Up
CREATE TABLE images_users (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  image_id int(10) UNSIGNED NOT NULL,
  user_id int(10) UNSIGNED NOT NULL,

  favorite boolean NOT NULL DEFAULT false,
  ctime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,

  PRIMARY KEY (id),

  CONSTRAINT fk_image_id
    FOREIGN KEY (image_id) 
    REFERENCES images (id),

  CONSTRAINT fk_user_id
    FOREIGN KEY (user_id) 
    REFERENCES users (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE images_users;
