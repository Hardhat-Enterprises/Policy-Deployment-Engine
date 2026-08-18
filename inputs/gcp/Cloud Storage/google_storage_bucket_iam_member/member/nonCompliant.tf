resource "google_storage_bucket_iam_member" "non_compliant_example_1" {
  bucket = "non_compliant_example_1"
  role   = "roles/storage.admin"
  member = "allUsers"
}
