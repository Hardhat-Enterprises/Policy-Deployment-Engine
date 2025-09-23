# resource "google_firestore_backup_schedule" "nc" {
# resource "google_firestore_database" "c" {
#   project  = "abcd1234"
#   # database = google_firestore_database.dnc.name
#   retention = "8467200s" // 14 weeks (maximum possible retention)
#   # weekly_recurrence { }
# }

# resource "google_firestore_database" "database2" {
#   project     = "abcd_1234"
#   # name        = "nc"
#   name        = "dnc"
#   # location_id = "nam5"
#   type        = "FIRESTORE_NATIVE"
#
#   delete_protection_state = "DELETE_PROTECTION_ENABLED"
#   deletion_policy         = "DELETE"
# }

resource "google_firestore_database" "database_1" {
  project     = "my-project-name"
  name        = "database-id"
  # location_id = "nam5"
  # type        = "FIRESTORE_NATIVE"
  location_id = "us-central"
  type        = "FIRESTORE_NATIVE"

  # delete_protection_state = "DELETE_PROTECTION_ENABLED"
  # deletion_policy         = "DELETE"
}

resource "google_firestore_backup_schedule" "nc" {
  project  = "my-project-name"
  database = google_firestore_database.database_1.name

  retention = "8467200s"

  weekly_recurrence {
    day = "FRIDAY"  # ❌ 不合规（不是 MONDAY）
  }
}
