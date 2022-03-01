require "refile/s3"
  aws = {
    access_key_id: ENV['AKIAWRSUNCEYBDINTOXV'], # アクセスキーID
    secret_access_key: ENV['N/LCsJZjx4ugBuGjkLidUBYGCgjXFXdqnAT9tRTG'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    bucket: 'pract-guitars', # バケット名
  }
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)