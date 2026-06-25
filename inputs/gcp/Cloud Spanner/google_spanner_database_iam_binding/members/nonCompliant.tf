resource "google_spanner_database_iam_binding" "non_compliant_example_1" {
  instance = "nc-instance"
  database = "non_compliant_example_1"
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}
