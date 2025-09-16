resource "google_storage_bucket" "bucket" {
  name                        = "c123"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "c123" {
  bucket = google_storage_bucket.bucket.name
  name   = "managed/folder/name/"
}