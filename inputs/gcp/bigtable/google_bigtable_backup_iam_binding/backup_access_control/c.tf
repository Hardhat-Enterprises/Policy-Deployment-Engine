resource "google_bigtable_backup_iam_binding" "c123" {
  backup_id = "c123"
  instance  = "c123"
  role      = "roles/bigtable.backupViewer"
  members = [
    "user:admin@example.com",
  ]
}
