# resource "google_firestore_backup_schedule" "nc" {
# resource "google_firestore_database" "c" {
#   project  = "abcd1234"
#   # database = google_firestore_database.database.name
#   # database = google_firestore_database.dnc.name
#   retention = "8467200s" // 14 weeks (maximum possible retention)
#   # daily_recurrence {}
# }

# resource "google_firestore_database" "database2" {
#   project     = "abcd_1234"
#   # name        = "nc"
#   name        = "dnc"
#   location_id = "nam5"
#   type        = "FIRESTORE_NATIVE"
#
#   //delete_protection_state = "DELETE_PROTECTION_ENABLED"
#   //deletion_policy         = "DELETE"
# }

resource "google_firestore_database" "database_nc" {
  project     = "abcd1234"
  name        = "database-id"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

  # delete_protection_state = "DELETE_PROTECTION_ENABLED"
  # deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "nc" {
  project  = "abcd1234"
  database = google_firestore_database.database_nc.name

  retention = "8467200s" // 14 weeks (maximum possible retention)

  weekly_recurrence {}
}
