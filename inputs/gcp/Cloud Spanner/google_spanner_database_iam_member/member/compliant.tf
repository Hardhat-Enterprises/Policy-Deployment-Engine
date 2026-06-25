resource "google_spanner_database_iam_member" "compliant_example_1" {
  instance = "c-instance"
  database = "compliant_example_1"
  role     = "roles/spanner.databaseReader"
  member   = "user:legitimate-user@example.com"
}
