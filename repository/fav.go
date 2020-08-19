package repository

import (
	"github.com/jmoiron/sqlx"
	"log"

	"github.com/OkanoShogo0903/image-database/model"
)

func PutFav(db *sqlx.DB, user_id int, image_id int, is_fav bool) error {
	m := model.ImagesUsers{
		ImageId: image_id,
		UserId:  user_id,
		IsFav:   is_fav,
	}

	log.Printf("%v", m)

	if _, err := db.Query(`INSERT INTO images_users (image_id, user_id, favorite) VALUES (?,?,?)`, m.ImageId, m.UserId, m.IsFav); err != nil {
		return err
	}

	return nil
}
