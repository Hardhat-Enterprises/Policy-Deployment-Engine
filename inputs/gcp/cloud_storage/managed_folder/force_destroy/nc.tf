resource "google_storage_bucket" "bucket_nc" {
  name                        = "my-bucket-nc"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "nc" {
  bucket        = google_storage_bucket.bucket_nc.name
  name          = "managed/folder/name/"
  force_destroy = true
}