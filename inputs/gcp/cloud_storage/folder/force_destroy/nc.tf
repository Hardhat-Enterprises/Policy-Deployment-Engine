resource "google_storage_bucket" "bucket-nc" {
  name                        = "nc123"
  location                    = "EU"
  uniform_bucket_level_access = true
  hierarchical_namespace {
    enabled = true
  }
}

resource "google_storage_folder" "nc123" {
  bucket        = google_storage_bucket.bucket-nc.name
  name          = "parent-folders/"
  force_destroy = true
}

