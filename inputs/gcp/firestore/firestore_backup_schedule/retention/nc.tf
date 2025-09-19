resource "google_firestore_backup_schedule" "nc" {
  project  = "abcd_1234"
  database = google_firestore_database.d-nc.name

  retention = "" // 14 weeks (maximum possible retention)
}

resource "google_firestore_database" "d-nc" {
  project     = "abcd_1234"
  name        = "nc"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

}