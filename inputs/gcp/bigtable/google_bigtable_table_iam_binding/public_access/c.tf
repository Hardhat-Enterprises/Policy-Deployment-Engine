resource "google_bigtable_table_iam_binding" "c123" {
  instance = "c123"
  table    = "c123"
  role     = "roles/bigtable.viewer"
  members = [
    "user:admin@example.com",
  ]
}
