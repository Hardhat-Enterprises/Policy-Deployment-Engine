resource "google_firestore_backup_schedule" "nc" {
  project  = "my-project-name"
  retention = "8467200s"
  daily_recurrence {}
}
