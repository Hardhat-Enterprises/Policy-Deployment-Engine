resource "google_firestore_backup_schedule" "nc" {
  project  = "abcd_1234"
  # database = google_firestore_database.dnc.name

  retention = "3600s" // 1h,不合规
}

# resource "google_firestore_database" "database2" {
#   project     = "abcd_1234"
#   # name        = "nc"
#   name        = "dnc"
#   location_id = "nam5"
#   type        = "FIRESTORE_NATIVE"
#
# }