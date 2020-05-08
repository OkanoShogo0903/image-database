package controller

import (
    "io"

	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/aws/session"
	"github.com/aws/aws-sdk-go/service/s3/s3manager"
)

func UploadImage(file_data io.Reader, file_name string) ( string, error ){
	// sessionの作成
	sess := session.Must(session.NewSessionWithOptions(session.Options{
		Profile:           "default",
		SharedConfigState: session.SharedConfigEnable,
	}))

    bucket_name := "resimagebucket" // TODO: ベタ書きしない

	// Uploaderを作成し、ファイルをアップロード
	uploader := s3manager.NewUploader(sess)
    res, err := uploader.Upload(&s3manager.UploadInput{
		Bucket: aws.String(bucket_name),
		Key:    aws.String(file_name),
		Body:   file_data,
	})

	if err != nil {
		return "", err
	}
    return res.Location, nil
}
