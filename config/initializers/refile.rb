require "refile/s3"

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['AKIAWRSUNCEYBDINTOXV'], # アクセスキーID
    secret_access_key: ENV['N/LCsJZjx4ugBuGjkLidUBYGCgjXFXdqnAT9tRTG'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    bucket: 'pract-guitars', # バケット名
  }
end