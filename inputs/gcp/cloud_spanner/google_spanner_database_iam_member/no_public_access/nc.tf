resource "google_spanner_database_iam_member" "nc" {
  instance = "nc-instance"
  database = "nc"
  role     = "roles/spanner.databaseReader"
  member   = "allUsers"
}
