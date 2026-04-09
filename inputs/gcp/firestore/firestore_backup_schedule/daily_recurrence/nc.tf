resource "google_firestore_backup_schedule" "nc" {
  project  = "nc"
  retention = "8467200s"
  daily_recurrence {}
}
