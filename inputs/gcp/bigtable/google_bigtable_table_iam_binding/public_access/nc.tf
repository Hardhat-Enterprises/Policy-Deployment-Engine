resource "google_bigtable_table_iam_binding" "nc123" {
  instance = "nc123"
  table    = "nc123"
  role     = "roles/bigtable.admin"
  members = [
    "allUsers",
  ]
}
