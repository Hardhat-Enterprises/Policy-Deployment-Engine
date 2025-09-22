# resource "google_firestore_backup_schedule" "c" {
# resource "google_firestore_database" "c" {
#   project  = "abcd1234"
#   # database = google_firestore_database.database.name
#   retention = "8467200s" // 14 weeks (maximum possible retention)
#   # daily_recurrence {}
# }

resource "google_firestore_database" "database" {
  project     = "abcd1234"
  name        = "database-id"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

  # delete_protection_state = "DELETE_PROTECTION_ENABLED"
  # deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "c" {
  project  = "abcd1234"
  database = google_firestore_database.database.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  daily_recurrence {}
}
