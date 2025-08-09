resource "google_storage_bucket" "nc" {
  name = "gcp-test-bucket-nc"
location ="AU"
public_access_prevention = "inherited"
}