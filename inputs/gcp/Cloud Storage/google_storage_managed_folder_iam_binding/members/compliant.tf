resource "google_storage_managed_folder_iam_binding" "compliant_example_1" {
  bucket         = "compliant_example_1"
  managed_folder = "managed/folder/name/"
  role           = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}
