resource "google_storage_bucket" "nc" {
name = "gcp-test-bucket-nc"

location ="AU"
 uniform_bucket_level_access = false
}