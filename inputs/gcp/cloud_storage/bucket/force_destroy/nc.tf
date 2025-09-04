resource "google_storage_bucket" "nc" {
name = "nc"

location ="AU"
force_destroy = true
}