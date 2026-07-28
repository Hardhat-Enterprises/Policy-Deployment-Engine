resource "google_spanner_database_iam_binding" "compliant_example_1" {
  instance = "c-instance"
  database = "compliant_example_1"
  role     = "roles/spanner.databaseReader"
  members  = ["user:legitimate-user@example.com"]
}
