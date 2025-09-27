resource "google_bigtable_backup_iam_binding" "nc123" {
  backup_id = "nc123"
  instance  = "nc123"
  role      = "roles/bigtable.admin"
  members = [
    "allUsers",
  ]
}
