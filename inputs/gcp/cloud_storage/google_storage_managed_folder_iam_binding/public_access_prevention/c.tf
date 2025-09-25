resource "google_storage_bucket" "bucket" {
  name                        = "c123"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "folder" {
  bucket = google_storage_bucket.bucket.name
  name   = "managed/folder/name/"
}

resource "google_storage_managed_folder_iam_binding" "c123" {
  bucket         = google_storage_managed_folder.folder.bucket
  managed_folder = google_storage_managed_folder.folder.name
  role           = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}
