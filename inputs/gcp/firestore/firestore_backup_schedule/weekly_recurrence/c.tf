resource "google_firestore_database" "database" {
  project     = "my-project-name"
  name        = "(default)"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_backup_schedule" "c" {
  project  = "my-project-name"
  database = google_firestore_database.database.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  weekly_recurrence {
     day = "MONDAY"  # ✅ 合规
  }
}