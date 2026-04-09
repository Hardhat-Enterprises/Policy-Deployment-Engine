resource "google_storage_bucket" "bucket_nc" {
  name                        = "nc123"
  location                    = "EU"
  uniform_bucket_level_access = true
}

resource "google_storage_managed_folder" "folder_nc" {
  bucket = google_storage_bucket.bucket_nc.name
  name   = "managed/folder/name/"
}

resource "google_storage_managed_folder_iam_member" "nc123" {
  bucket         = google_storage_managed_folder.folder_nc.bucket
  managed_folder = google_storage_managed_folder.folder_nc.name
  role           = "roles/storage.admin"
  member         = "allUsers"
}
