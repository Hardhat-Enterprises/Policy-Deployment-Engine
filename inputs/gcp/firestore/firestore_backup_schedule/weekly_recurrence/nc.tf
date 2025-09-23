resource "google_firestore_database" "database_1" {
  project     = "my-project-name"
  name        = "database-id"
  # location_id = "nam5"
  # type        = "FIRESTORE_NATIVE"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"

  # delete_protection_state = "DELETE_PROTECTION_ENABLED"
  # deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "nc" {
  project  = "my-project-name"
  database = google_firestore_database.database_1.name

  retention = "8467200s"

  weekly_recurrence {
    day = "FRIDAY"  # ❌ 不合规（不是 MONDAY）
  }
}
