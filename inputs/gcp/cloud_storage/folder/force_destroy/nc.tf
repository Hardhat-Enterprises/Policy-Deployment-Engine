resource "google_storage_bucket" "bucket-nc" {
  name                        = "my-bucket-nc"
  location                    = "EU"
  uniform_bucket_level_access = true
  hierarchical_namespace {
    enabled = true
  }
}

resource "google_storage_folder" "folder-nc" {
  bucket        = google_storage_bucket.bucket-nc.name
  name          = "parent-folder/"
  force_destroy = true
}

resource "google_storage_folder" "subfolder-nc" {
  bucket        = google_storage_bucket.bucket-nc.name
  name          = "${google_storage_folder.folder-nc.name}subfolder/"
}