resource "google_firestore_database" "nc" {
  project     = "abcd_1234"
  name        = "nc"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

}

resource "google_firestore_backup_schedule" "daily-backup-nc" {
  project  = "abcd_1234"
  database = google_firestore_database.nc.name

  retention = "" // 14 weeks (maximum possible retention)


}