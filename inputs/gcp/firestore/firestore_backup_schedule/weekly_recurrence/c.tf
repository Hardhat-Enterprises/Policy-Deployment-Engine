resource "google_firestore_database" "database" {
  project     = "my-project-name"
  # name        = "database-id"
  # location_id = "nam5"
  name        = "(default)"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"

  # delete_protection_state = "DELETE_PROTECTION_ENABLED"
  # deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "c" {
  project  = "my-project-name"
  database = google_firestore_database.database.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  weekly_recurrence {
     day = "MONDAY"  # ✅ 合规
  }
}