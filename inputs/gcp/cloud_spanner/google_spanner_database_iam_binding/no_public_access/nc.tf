resource "google_spanner_database_iam_binding" "nc" {
  instance = google_spanner_instance.nc_instance.name
  database = google_spanner_database.nc_database.name
  role     = "roles/spanner.databaseReader"

  members = [
    "allUsers"
  ]
}

resource "google_spanner_instance" "nc_instance" {
  name         = "test-instance-nc"
  config       = "regional-australia-southeast1"
  display_name = "Test Instance NC"
  num_nodes    = 1
}

resource "google_spanner_database" "nc_database" {
  instance = google_spanner_instance.nc_instance.name
  name     = "nc-database"
}
