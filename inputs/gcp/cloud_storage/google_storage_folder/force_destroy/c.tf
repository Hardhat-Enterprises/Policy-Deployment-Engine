resource "google_storage_bucket" "bucket" {
  name                        = "c123"
  location                    = "EU"
  uniform_bucket_level_access = true
  hierarchical_namespace {
    enabled = true
  }
}

resource "google_storage_folder" "c123" {
  bucket = google_storage_bucket.bucket.name
  name   = "parent-folders/"

}

