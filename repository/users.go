package repository

import (
	"github.com/jmoiron/sqlx"
	_ "github.com/lib/pq"

	"github.com/OkanoShogo0903/image-database/model"
)

func IsExistUser(db *sqlx.DB, ipv4 string) (*bool, error) {
	// TODO: より適したsql文に変える
	m := make([]model.User, 0)

	if err := db.Select(&m, `SELECT * FROM users WHERE ipv4 = (INET_ATON(?))`, ipv4); err != nil {
		return nil, err
	}

	res := new(bool)
	if len(m) > 0 {
		*res = true
	} else {
		*res = false
	}
	return res, nil
}

func GetUser(db *sqlx.DB, ipv4 string) ([]model.User, error) {
	m := make([]model.User, 0)

	if err := db.Select(&m, `SELECT * FROM users WHERE ipv4 = (INET_ATON(?))`, ipv4); err != nil {
		return nil, err
	}

	return m, nil
}

func CreateUser(db *sqlx.DB, ipv4 string) error {
	if _, err := db.Query(`INSERT INTO users (ipv4) VALUES (INET_ATON(?))`, ipv4); err != nil {
		return err
	}
	return nil
}
