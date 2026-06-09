resource "google_spanner_database_iam_member" "c" {
  instance = "c-instance"
  database = "c"
  role     = "roles/spanner.databaseReader"
  member   = "user:legitimate-user@example.com"
}
