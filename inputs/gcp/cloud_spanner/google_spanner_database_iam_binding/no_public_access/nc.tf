resource "google_spanner_database_iam_binding" "nc1" {
  instance = "nc1-instance"
  database = "nc1"
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}
