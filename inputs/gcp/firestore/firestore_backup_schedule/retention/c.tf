resource "google_firestore_backup_schedule" "c" {
  project  = "abcd_1234"
  database = google_firestore_database.dc.name

  retention = "8467200s" // 14 weeks (maximum possible retention)
}

resource "google_firestore_database" "dc" {
  project     = "abcd_1234"
  # name        = "c"
  name        = "dc"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"
}

