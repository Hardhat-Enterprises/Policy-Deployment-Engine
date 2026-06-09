resource "google_spanner_database_iam_binding" "c" {
  instance = "c-instance"
  database = "c"
  role     = "roles/spanner.databaseReader"
  members  = ["user:legitimate-user@example.com"]
}
