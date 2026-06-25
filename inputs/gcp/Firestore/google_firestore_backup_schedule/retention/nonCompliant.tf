resource "google_firestore_backup_schedule" "non_compliant_example_1" {
  project  = "nc"
  retention = "1" //
  daily_recurrence {}
}
