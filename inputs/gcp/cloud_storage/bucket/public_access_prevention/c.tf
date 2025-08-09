resource "google_storage_bucket" "c" {
name = "gcp-test-bucket-c"
location ="AU"
public_access_prevention = "enforced"
}
