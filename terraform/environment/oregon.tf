module "s3_bucket" {
  source      = "../module/s3"
  bucket_name = "test_bucket1_oregon" # custom bucket name
}