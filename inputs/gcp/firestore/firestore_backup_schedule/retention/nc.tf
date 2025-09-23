resource "google_firestore_database" "database_1" {
  project     = "my-project-name"
  name        = "database-id"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"
}

resource "google_firestore_backup_schedule" "nc" {
  project  = "my-project-name"
  database = google_firestore_database.database_1.name

  retention = "1" //

  daily_recurrence {}
}