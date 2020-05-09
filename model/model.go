package model

import (
    null "gopkg.in/guregu/null.v3"
)

// DB mapping and throw to client as raw
type ImageDB struct{
    Id int `db:"id" json:"id"`
    Url string `db:"url" json:"url"`
    Character_name string `db:"character_name" json:"character_name"`
    Attribute_primary   string `db:"attribute_primary" json:"attribute_primary"`
    Attribute_secondary null.String `db:"attribute_secondary" json:"attribute_secondary"`
    Attribute_tertiary  null.String `db:"attribute_tertiary" json:"attribute_tertiary"`
}

// For receive client
type Image struct{
    url string `json:"url"`
}

// TODO: string -> attribute enum
type Attributes struct {
    attribute []string
}
