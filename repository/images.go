package repository

import (
    "errors"

    "github.com/jmoiron/sqlx"

    "github.com/OkanoShogo0903/image-database/model"
)

func AllImage(db *sqlx.DB) ([]model.Images, error) {
    m := make([]model.Images, 0)

    if err := db.Select(&m, `
        select images.id, url, characters.name as character_name, categories.name as category_name from images
        JOIN characters ON images.character_id = characters.id
        JOIN categories ON images.main_category_id = categories.id`); err != nil{
        return nil, err
    }
    return m, nil
}

func Image(db *sqlx.DB, select_category string) ([]model.Images, error) {
    categories := make([]model.Categories, 0)
    images := make([]model.Images, 0)

    if err := db.Select(&categories, `SELECT id, name FROM categories WHERE name = ?`, select_category); err != nil {
        return nil, err
    }

    if len(categories) == 0 {
        return nil, errors.New("undefined category")
    }

    if err := db.Select(&images,
        `
        select images.id, url, characters.name as character_name, categories.name as category_name from images
        JOIN characters ON images.character_id = characters.id
        JOIN categories ON images.main_category_id = categories.id
        WHERE main_category_id = ?`, categories[0].Id); err != nil{
        return nil, err
    }
    return images, nil
}

func AllGenre(db *sqlx.DB) ([]string, error) {
    var m []string

    if err := db.Select(&m, `SELECT name from categories`); err != nil {
        return nil, err
    }
    return m, nil
}

func AllCharactorName(db *sqlx.DB) ([]string, error) {
	var m []string

    if err := db.Select(&m, `SELECT name from characters`); err != nil {
        return nil, err
    }
    return m, nil
}

func RegisteImage(db *sqlx.DB, url string, character_name string, category_name string) (error) {
    character_id, err := CharacterName2Id( db, character_name ) // TODO
    if err != nil {
        return err
    }

    category_id, err := CategoryName2Id( db, category_name ) // TODO
    if err != nil {
        return err
    }
    // TODO interface実装じゃなくて、imagesモデルにデータを入れてからNameExecに渡すようにする

    _, err = db.NamedExec(`insert into images (url, character_id, category_id) values (:url, :character, :category)`,
        map[string]interface{}{
            "url": url,
            "character": character_id,
            "category": category_id,
    })
    return err
}

func CharacterName2Id(db *sqlx.DB, name string) (string, error) {
	var id string

    if err := db.Select(&id, `SELECT id from characters WHERE name = ?`, name); err != nil {
        return "", err
    }
    return id, nil
}

func CategoryName2Id(db *sqlx.DB, name string) (string, error) {
	var id string

    if err := db.Select(&id, `SELECT id from categories WHERE name = ?`, name); err != nil {
        return "", err
    }
    return id, nil
}

