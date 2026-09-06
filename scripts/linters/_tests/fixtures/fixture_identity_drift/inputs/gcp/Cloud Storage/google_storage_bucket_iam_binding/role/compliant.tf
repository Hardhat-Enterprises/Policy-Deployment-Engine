resource "google_storage_bucket_iam_binding" "compliant_example_1" {
  bucket = "prod-data-bucket"
  role   = "roles/storage.objectViewer"
  members = [
    "user:jane@example.com",
  ]
}
