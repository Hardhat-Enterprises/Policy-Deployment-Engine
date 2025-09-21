resource "google_storage_bucket" "bucket_nc" {
  name                        = "nc123"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "nc123" {
  bucket        = google_storage_bucket.bucket_nc.name
  name          = "managed/folder/name/"
  force_destroy = true
}