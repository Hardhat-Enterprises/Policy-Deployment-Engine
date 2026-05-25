resource "google_spanner_database_iam_binding" "c" {
  instance = google_spanner_instance.c_instance.name
  database = google_spanner_database.c_database.name
  role     = "roles/spanner.databaseReader"

  members = [
    "user:legitimate-user@example.com"
  ]
}

resource "google_spanner_instance" "c_instance" {
  name         = "test-instance-c"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance C"
  num_nodes    = 1
}

resource "google_spanner_database" "c_database" {
  instance = google_spanner_instance.c_instance.name
  name     = "c-database"
}
