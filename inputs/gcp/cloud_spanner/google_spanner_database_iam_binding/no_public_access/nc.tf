resource "google_spanner_database_iam_binding" "nc1" {
  instance = google_spanner_instance.nc1_instance.name
  database = google_spanner_database.nc1_database.name
  role     = "roles/spanner.databaseReader"
  members  = ["allUsers"]
}
resource "google_spanner_instance" "nc1_instance" {
  name         = "test-instance-nc1"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC1"
  num_nodes    = 1
}
resource "google_spanner_database" "nc1_database" {
  instance = google_spanner_instance.nc1_instance.name
  name     = "nc1-database"
}
