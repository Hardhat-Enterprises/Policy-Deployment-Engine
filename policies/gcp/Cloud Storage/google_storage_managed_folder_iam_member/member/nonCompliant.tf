resource "google_storage_managed_folder_iam_member" "non_compliant_example_1" {
  bucket         = "non_compliant_example_1"
  managed_folder = "managed/folder/name/"
  role           = "roles/storage.admin"
  member         = "allUsers"
}
