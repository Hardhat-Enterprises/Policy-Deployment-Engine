resource "google_spanner_database_iam_binding" "nc" {
  instance = "nc-instance"
  database = "nc"
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}
