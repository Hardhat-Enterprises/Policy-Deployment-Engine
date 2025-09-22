resource "google_firestore_backup_schedule" "c" {
  project  = "abcd_1234"
  # database = google_firestore_database.dc.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  weekly_recurrence {
    day = "SUNDAY"
  }
}

# resource "google_firestore_database" "database1" {
#   project     = "abcd_1234"
#   # name        = "c"
#   name        = "dc"
#   location_id = "nam5"
#   type        = "FIRESTORE_NATIVE"
#
#   delete_protection_state = "DELETE_PROTECTION_ENABLED"
#   deletion_policy         = "DELETE"
# }

