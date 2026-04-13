resource "google_firestore_backup_schedule" "c" {
  project   = "c"
  retention = "8467200" // 14 weeks (maximum possible retention)
  daily_recurrence {}
}
