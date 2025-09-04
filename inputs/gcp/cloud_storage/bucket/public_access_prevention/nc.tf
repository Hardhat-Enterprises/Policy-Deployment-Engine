resource "google_storage_bucket" "nc" {
name = "nc"
location ="AU"
public_access_prevention = "inherited"
}