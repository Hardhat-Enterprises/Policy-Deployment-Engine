resource "google_storage_managed_folder_iam_member" "compliant_example_1" {
  bucket         = "compliant_example_1"
  managed_folder = "managed/folder/name/"
  role           = "roles/storage.admin"
  member         = "user:jane@example.com"
}
