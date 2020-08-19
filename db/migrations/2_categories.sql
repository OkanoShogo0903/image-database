-- +goose Up
CREATE TABLE categories (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,

  name VARCHAR(255) NOT NULL unique,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into categories (name) values ('あいさつ');
insert into categories (name) values ('おつかれ');
insert into categories (name) values ('ありがとう');
insert into categories (name) values ('帰りたい');
insert into categories (name) values ('Yunomiを布教したい');
insert into categories (name) values ('ネガティブ');


-- +goose Down
DROP TABLE categories;
