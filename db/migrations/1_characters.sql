-- +goose Up
CREATE TABLE characters (
  id int(10) UNSIGNED NOT NULL AUTO_INCREMENT,

  name VARCHAR(255) NOT NULL,

  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

insert into characters (name) values ('月ノ美兎');
insert into characters (name) values ('をとは');
insert into characters (name) values ('Yunomi');


-- +goose Down
DROP TABLE characters;
