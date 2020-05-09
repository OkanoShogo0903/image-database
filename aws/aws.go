package aws

import (
    "io"
    "os"
    "log"

    "github.com/aws/aws-sdk-go/aws"
    "github.com/aws/aws-sdk-go/aws/session"
    "github.com/aws/aws-sdk-go/aws/credentials"
    "github.com/aws/aws-sdk-go/service/s3/s3manager"
)

type S3 struct {
    bucket_name       string
    region            string
    iam_access_key    string
    secret_access_key string
}

func New() *S3 {
    return &S3{}
}

func (aw *S3) Init(bucket string, env_region string, env_ak string, env_sak string) {
    region, is_exist := os.LookupEnv(env_region)
    if !is_exist {
        log.Fatal("failed 3s init.")
    }
    ak, is_exist := os.LookupEnv(env_ak)
    if !is_exist {
        log.Fatal("failed 3s init.")
    }
    sak, is_exist := os.LookupEnv(env_sak)
    if !is_exist {
        log.Fatal("failed 3s init.")
    }

    aw.bucket_name = bucket
    aw.region = region
    aw.iam_access_key = ak
    aw.secret_access_key = sak
}

func (aw *S3) UploadImage(file_data io.Reader, file_name string) ( string, error ){
    // 環境変数から取ってきたクレデンシャル情報を付与する
    creds := credentials.NewStaticCredentials(aw.iam_access_key, aw.secret_access_key, "")
    sess := session.Must(session.NewSession(&aws.Config{
        Credentials: creds,
        Region:      aws.String(aw.region),
    }))

    // サービスを作成
    uploader := s3manager.NewUploader(sess)
    res, err := uploader.Upload(&s3manager.UploadInput{
        Bucket: aws.String(aw.bucket_name),
        Key:    aws.String(file_name),
        Body:   file_data,
    })

    if err != nil {
        return "", err
    }
    return res.Location, nil
}
