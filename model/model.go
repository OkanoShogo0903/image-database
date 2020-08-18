package model

import (
// null "gopkg.in/guregu/null.v3"
)

// DB mapping and throw to client as raw
type Image struct {
	Id            int    `db:"id" json:"id"`
	Url           string `db:"url" json:"url"`
	CharacterName string `db:"character_name" json:"character_name"`
	CategoryName  string `db:"category_name" json:"category_name"`
	IsFav         bool   `db:"favorite" json:"is_fav"`
}

type Categories struct {
	Id   int    `db:"id" json:"id"`
	Name string `db:"name" json:"name"`
}
