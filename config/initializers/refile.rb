require "refile/s3"

aws = {
  access_key_id: ENV['AKIAWRSUNCEYB6WECPFD
  '],
  secret_access_key: ENV['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
  '],
  region: "ap-northeast-1",
  bucket: "pract-guitars",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)