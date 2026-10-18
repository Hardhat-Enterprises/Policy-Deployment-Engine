resource "google_storage_bucket_iam_binding" "compliant_example_1" {
  bucket = "compliant_example_1"
  role   = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}
