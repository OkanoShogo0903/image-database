-- +goose Up
CREATE TABLE users (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  ipv4 int(4) UNSIGNED NOT NULL unique,
  ctime timestamp,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- +goose Down
DROP TABLE users;
