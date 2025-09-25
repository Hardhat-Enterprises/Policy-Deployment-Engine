resource "google_firestore_backup_schedule" "c" {
  project     = "my-project-name"
  retention = "8467200" // 14 weeks (maximum possible retention)
  daily_recurrence {}
}
