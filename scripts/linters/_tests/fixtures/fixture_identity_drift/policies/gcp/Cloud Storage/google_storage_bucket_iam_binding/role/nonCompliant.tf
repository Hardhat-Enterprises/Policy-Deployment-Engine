resource "google_storage_bucket_iam_binding" "non_compliant_example_1" {
  bucket = "dev-scratch-bucket"
  role   = "roles/storage.admin"
  members = [
    "user:jane@example.com",
  ]
}
