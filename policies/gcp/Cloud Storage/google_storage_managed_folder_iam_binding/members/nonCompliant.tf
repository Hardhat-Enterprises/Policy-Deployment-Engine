resource "google_storage_managed_folder_iam_binding" "non_compliant_example_1" {
  bucket         = "non_compliant_example_1"
  managed_folder = "managed/folder/name/"
  role           = "roles/storage.admin"
  members = [
    "allAuthenticatedUsers",
  ]
}
