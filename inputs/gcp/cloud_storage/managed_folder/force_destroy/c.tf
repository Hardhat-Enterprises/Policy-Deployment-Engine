resource "google_storage_bucket" "bucket" {
  name                        = "my-bucket-c"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "c" {
  bucket        = google_storage_bucket.bucket.name
  name          = "managed/folder/name/"
}