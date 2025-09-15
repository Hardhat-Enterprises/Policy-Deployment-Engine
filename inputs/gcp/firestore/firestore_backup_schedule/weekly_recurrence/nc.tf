resource "google_firestore_database" "database-nc" {
  project     = "abcd_1234"
  name        = "nc"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

  delete_protection_state = "DELETE_PROTECTION_ENABLED"
  deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "weekly-backup-nc" {
  project  = "abcd_1234"
  database = google_firestore_database.database-nc.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  //weekly_recurrence {
    //day = "SUNDAY"
//  }
}