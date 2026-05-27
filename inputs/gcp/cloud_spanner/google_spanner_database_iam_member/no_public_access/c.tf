resource "google_spanner_database_iam_member" "c1" {
  instance = "c1-instance"
  database = "c1"
  role     = "roles/spanner.databaseReader"
  member   = "user:legitimate-user@example.com"
}
