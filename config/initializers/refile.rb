require "refile/s3"

if Rails.env.production? # 本番環境の場合はS3へアップロード
  aws = {
    access_key_id: ENV['AKIAWRSUNCEYB6WECPFD'], # アクセスキーID
    secret_access_key: ENV['wP9S1OcJR96VxrQzFynmS/yUcxHZSmBnaogFXtQZ'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    bucket: 'pract-guitars', # バケット名
  }
  Refile.cache = Refile::S3.new(prefix: 'cache', **aws)
  Refile.store = Refile::S3.new(prefix: 'store', **aws)
end