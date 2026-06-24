resource "google_storage_bucket" "c123" {
  name                        = "c123"
  location                    = "AU"
  uniform_bucket_level_access = true
}
