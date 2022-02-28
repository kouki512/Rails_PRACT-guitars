require "refile/s3"

aws = {
  access_key_id: ENV['AKIAWRSUNCEYKBTDAX5I
  '],
  secret_access_key: ENV['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
  '],
  region: "ap-northeast-1",
  bucket: "pract-guitars",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)