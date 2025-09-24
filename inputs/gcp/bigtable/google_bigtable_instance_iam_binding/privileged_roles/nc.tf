resource "google_bigtable_instance_iam_binding" "nc123" {
  instance = "nc123"
  role     = "roles/bigtable.admin"
  members = [
    "allUsers",
  ]
}
