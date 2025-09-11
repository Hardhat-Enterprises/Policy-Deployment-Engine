resource "google_storage_bucket" "nc123" {
  name = "nc123"

  location                    = "AU"
  uniform_bucket_level_access = false
}