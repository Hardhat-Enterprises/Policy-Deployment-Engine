resource "google_bigtable_instance_iam_binding" "c123" {
  instance = "c123"
  role     = "roles/bigtable.viewer"
  members = [
    "user:admin@example.com",
  ]
}
