resource "google_firestore_database" "database-c" {
  project     = "abcd_1234"
  name        = "c"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

}

resource "google_firestore_backup_schedule" "daily-backup-c" {
  project  = "abcd_1234"
  database = google_firestore_database.database-c.name

  retention = "8467200s" // 14 weeks (maximum possible retention)


}