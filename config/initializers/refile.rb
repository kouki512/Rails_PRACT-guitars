require "refile/s3"

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['AWS_ACCESS_KEY_ID'], # アクセスキーID
    secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: ENV['AWS_REGION'], # リージョン
    bucket: ENV['AWS_BUCKET'] # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: "cache", **aws,http_wire_trace: true)
  Refile.store = Refile::S3.new(prefix: "store", **aws,http_wire_trace: true)
end