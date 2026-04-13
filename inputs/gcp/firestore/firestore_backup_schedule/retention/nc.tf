resource "google_firestore_backup_schedule" "nc" {
  project   = "nc"
  retention = "1" //
  daily_recurrence {}
}