resource "google_spanner_database_iam_binding" "c1" {
  instance = "c1-instance"
  database = "c1"
  role     = "roles/spanner.databaseReader"
  members  = ["user:legitimate-user@example.com"]
}
