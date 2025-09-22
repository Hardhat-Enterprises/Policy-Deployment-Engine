# resource "google_firestore_backup_schedule" "nc" {
# # resource "google_firestore_database" "nc" {
#   project  = "abcd1234"
#   # type        = "FIRESTORE_NATIVE"
#   # location_id = "nam5"
#   # name        = "nc"
#   database = google_firestore_database.database_nc.name
#   retention = "3600s" // 1h,不合规
#   daily_recurrence {}
# }
#
# resource "google_firestore_database" "database_nc" {
#   project     = "abcd_1234"
#   # name        = "nc"
#   name        = "database-id"
#   location_id = "nam5"
#   type        = "FIRESTORE_NATIVE"
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

  retention = "3600s" // 1h

  daily_recurrence {}
}