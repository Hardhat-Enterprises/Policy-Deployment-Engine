resource "google_firestore_backup_schedule" "nc" {
  project  = "abcd_1234"
  database = google_firestore_database.dnc.name

  retention = "" // 14 weeks (maximum possible retention)
}

resource "google_firestore_database" "dnc" {
  project     = "abcd_1234"
  # name        = "nc"
  name        = "dnc"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

}