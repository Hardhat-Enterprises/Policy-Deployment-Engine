resource "google_storage_bucket_iam_member" "compliant_example_1" {
  bucket = "compliant_example_1"
  role   = "roles/storage.admin"
  member = "group:admins@example.com"

}
