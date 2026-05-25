resource "google_spanner_database_iam_binding" "c1" {
  instance = google_spanner_instance.c1_instance.name
  database = google_spanner_database.c1_database.name
  role     = "roles/spanner.databaseReader"
  members  = ["user:legitimate-user@example.com"]
}
resource "google_spanner_instance" "c1_instance" {
  name         = "test-instance-c1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C1"
  num_nodes    = 1
}
resource "google_spanner_database" "c1_database" {
  instance = google_spanner_instance.c1_instance.name
  name     = "c1-database"
}
