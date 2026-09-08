resource "google_storage_bucket_iam_binding" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  role   = "roles/storage.admin"
  members = [
    "allUsers",
  ]
}
